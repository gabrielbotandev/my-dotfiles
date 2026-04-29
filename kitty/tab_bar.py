import datetime
import glob
import os
import re
import subprocess
import time

from kitty.boss import get_boss
from kitty.fast_data_types import Screen, add_timer, wcswidth
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    TabBarData,
    as_rgb,
    draw_tab_with_powerline,
)
from kitty.utils import color_as_int


REFRESH_SECONDS = 2.0
RIGHT_MARGIN = 1

# Nerd Font icons
ICON_MUSIC = "󰝚"
ICON_BATTERY = "󰁹"
ICON_CHARGING = "󰂄"
ICON_HEADPHONES = "󰋋"

timer_id = None
_cache = {}


def _redraw_tab_bar(_timer_id=None) -> None:
    tab_manager = get_boss().active_tab_manager
    if tab_manager is not None:
        tab_manager.mark_tab_bar_dirty()


def _cached(key: str, ttl: float, fn) -> str:
    now = time.monotonic()
    cached = _cache.get(key)

    if cached is not None:
        last_update, value = cached
        if now - last_update < ttl:
            return value

    try:
        value = fn()
    except Exception:
        value = ""

    _cache[key] = (now, value)
    return value


def _run(cmd: list[str], timeout: float = 0.5) -> str:
    try:
        return subprocess.check_output(
            cmd,
            stderr=subprocess.DEVNULL,
            timeout=timeout,
            text=True,
        ).strip()
    except Exception:
        return ""


def _clock() -> str:
    return datetime.datetime.now().strftime("%H:%M")


def _date() -> str:
    return datetime.datetime.now().strftime("%a %d %b")


def _media() -> str:
    status = _run(["playerctl", "status"])

    if status != "Playing":
        return ""

    artist = _run(["playerctl", "metadata", "artist"])
    title = _run(["playerctl", "metadata", "title"])

    if artist and title:
        text = f"{artist} - {title}"
    else:
        text = title or artist

    if not text:
        return ""

    max_len = 42
    if len(text) > max_len:
        text = text[: max_len - 1] + "…"

    return f"{ICON_MUSIC} {text}"


def _laptop_battery() -> str:
    for path in sorted(glob.glob("/sys/class/power_supply/BAT*")):
        capacity_path = os.path.join(path, "capacity")
        status_path = os.path.join(path, "status")

        if not os.path.exists(capacity_path):
            continue

        try:
            percent = int(open(capacity_path).read().strip())
            status = open(status_path).read().strip() if os.path.exists(status_path) else ""
        except Exception:
            continue

        icon = ICON_CHARGING if status in {"Charging", "Full", "Not charging"} else ICON_BATTERY
        return f"{icon} {percent}%"

    return ""


def _headphone_battery() -> str:
    devices = _run(["upower", "-e"])
    if not devices:
        return ""

    for device in devices.splitlines():
        lowered = device.lower()

        if not any(word in lowered for word in ("headset", "headphone", "earbuds")):
            continue

        info = _run(["upower", "-i", device])
        match = re.search(r"percentage:\s+(\d+)%", info)

        if match:
            return f"{ICON_HEADPHONES} {match.group(1)}%"

    return ""


def _battery() -> str:
    parts = []

    laptop = _cached("laptop_battery", 10.0, _laptop_battery)
    headphones = _cached("headphone_battery", 15.0, _headphone_battery)

    if laptop:
        parts.append(laptop)

    if headphones:
        parts.append(headphones)

    return "  ".join(parts)


def _width(text: str) -> int:
    width = wcswidth(text)
    return width if width > 0 else len(text)


def _draw_right_status(screen: Screen, draw_data: DrawData, left_end: int) -> None:
    parts = []

    media = _cached("media", 2.0, _media)
    if media:
        parts.append(media)

    battery = _battery()
    if battery:
        parts.append(battery)

    parts.append(_date())
    parts.append(_clock())

    text = "  ".join(parts)
    text = f" {text} "

    width = _width(text)
    start = screen.columns - width - RIGHT_MARGIN

    # Do not draw over tabs.
    if start <= left_end + 1:
        return

    screen.cursor.x = start
    screen.cursor.bold = False
    screen.cursor.italic = False

    screen.cursor.bg = as_rgb(color_as_int(draw_data.default_bg))
    screen.cursor.fg = as_rgb(color_as_int(draw_data.inactive_fg))

    screen.draw(text)

    screen.cursor.bg = 0
    screen.cursor.fg = 0
    screen.cursor.bold = False
    screen.cursor.italic = False


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    global timer_id

    if timer_id is None:
        timer_id = add_timer(_redraw_tab_bar, REFRESH_SECONDS, True)

    tab_draw_data = draw_data._replace(
        title_template=" {index} ",
        active_title_template=" {index} ",
    )

    end = draw_tab_with_powerline(
        tab_draw_data,
        screen,
        tab,
        before,
        max_tab_length,
        index,
        is_last,
        extra_data,
    )

    if is_last and not extra_data.for_layout:
        _draw_right_status(screen, draw_data, end)

    return end