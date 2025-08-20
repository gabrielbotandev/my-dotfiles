# Oh My Posh
 oh-my-posh init pwsh --config 'C:\Program Files (x86)\oh-my-posh\themes\robbyrussell.omp.json' | Invoke-Expression

# Starship
# starship init powershell | Out-String | Invoke-Expression
# $ENV:STARSHIP_CONFIG = "C:\Users\user\.config\starship.toml"

# colors
$env:LS_COLORS = "di=93"

# Chocolatey Profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# Use lsd
Set-Alias ls lsd

# Functions
function poff { shutdown /p }

function init { git init }

function gcl { git clone $args }

function gst { git status }

function wip {
    git add .
    git commit -m "wip"
}

function ga { git add . }

function rd { param([string]$path) Remove-Item -Path $path -Recurse -Force }

function whereis ($command) {
		Get-Command -Name $command -ErrorAction SilentlyContinue | 
		Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Imports

Import-Module Terminal-Icons

Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView