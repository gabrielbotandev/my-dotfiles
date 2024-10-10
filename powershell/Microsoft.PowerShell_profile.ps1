# Oh My Posh
oh-my-posh init pwsh --config 'C:\Users\gabri\AppData\Local\Programs\oh-my-posh\themes\the-unnamed.omp.json' | Invoke-Expression

cls

# Starship
# starship init powershell | Out-String | Invoke-Expression
# $ENV:STARSHIP_CONFIG = "C:\Users\gabri\.config\starship.toml"

# colors
$env:LS_COLORS = "di=93"

# Posh-git function
function LoadPoshGit {
    if (-not (Get-Module -Name posh-git)) {
        Import-Module posh-git
    }
}

# Chocolatey Profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# Git module (on demand)
Set-Alias poshgit LoadPoshGit

# Use lsd
Set-Alias ls lsd

# Aliases
function init { git init }

function gcl { git clone $args }

function gst { git status }

function ga { git add . }

function cm { param([string]$msg) git commit -m $msg }

function gsh { git push }

function rd { param([string]$path) Remove-Item -Path $path -Recurse -Force }

function mfs { php artisan migrate:fresh --seed }
