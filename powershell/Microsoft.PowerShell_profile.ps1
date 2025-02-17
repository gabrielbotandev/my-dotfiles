cls

# Oh My Posh
# oh-my-posh init pwsh --config 'C:\Program Files (x86)\oh-my-posh\themes\kali.omp.json' | Invoke-Expression

# Starship
 starship init powershell | Out-String | Invoke-Expression
 $ENV:STARSHIP_CONFIG = "C:\Users\gabri\.config\starship.toml"

# colors
$env:LS_COLORS = "di=93"

# Chocolatey Profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# Use lsd
Set-Alias ls lsd

# Aliases
function poff { shutdown /p }

function init { git init }

function gcl { git clone $args }

function gst { git status }

function wip {
    git add .
    git commit -m "wip"
}

function ga { git add . }

function cm { param([string]$msg) git commit -m $msg }

function gsh { git push }

function rd { param([string]$path) Remove-Item -Path $path -Recurse -Force }

function mfs { php artisan migrate:fresh --seed }

function as { php artisan serve }
