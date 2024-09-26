# Oh My Posh (remove comment to use oh-my-posh and comment starship)
oh-my-posh init pwsh --config 'C:\Users\gabri\AppData\Local\Programs\oh-my-posh\themes\kali.omp.json' | Invoke-Expression

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
