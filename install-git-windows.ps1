<#
  install-git-windows.ps1
  Installe Git sur Windows en essayant successivement :
    1) winget
    2) Chocolatey
    3) Téléchargement direct de l'installateur Git for Windows

  Usage (exécuter PowerShell en tant qu'administrateur) :
    .\install-git-windows.ps1

  Notes :
  - Le script vérifie d'abord si git est déjà disponible.
  - Certaines commandes nécessitent des droits administrateurs (recommandé).
#>

function Is-Administrator { 
    $current = [Security.Principal.WindowsIdentity]::GetCurrent();
    $principal = New-Object Security.Principal.WindowsPrincipal($current);
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

Write-Host "== Installer Git pour Windows — script automatique ==" -ForegroundColor Cyan

if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "Git est déjà installé :" -ForegroundColor Green
    git --version
    exit 0
}

if (-not (Is-Administrator)) {
    Write-Host "Ce script nécessite des droits administrateur pour ajouter git au PATH et installer correctement." -ForegroundColor Yellow
    Write-Host "Relance PowerShell en mode administrateur puis exécute : .\install-git-windows.ps1" -ForegroundColor Yellow
    exit 2
}

# Try winget
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host "winget trouvé — installation via winget..." -ForegroundColor Yellow
    try {
        winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements -h 2>$null
    } catch {
        Write-Host "winget a retourné une erreur — on essaie la suite..." -ForegroundColor Red
    }
}

# Try chocolatey
if (-not (Get-Command git -ErrorAction SilentlyContinue) -and (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey trouvé — installation via choco..." -ForegroundColor Yellow
    try {
        choco install git -y 2>$null
    } catch {
        Write-Host "choco a retourné une erreur — on essaie la suite..." -ForegroundColor Red
    }
}

# Fallback: download official installer and run silently
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Téléchargement de l'installateur Git for Windows (fallback) ..." -ForegroundColor Yellow
    $tmp = Join-Path $env:TEMP "Git-Installer.exe"
    $url = 'https://github.com/git-for-windows/git/releases/latest/download/Git-64-bit.exe'
    try {
        Invoke-WebRequest -Uri $url -OutFile $tmp -UseBasicParsing -ErrorAction Stop
        Write-Host "Lancement de l'installateur en mode silencieux..." -ForegroundColor Yellow
        Start-Process -FilePath $tmp -ArgumentList "/VERYSILENT","/NORESTART" -Wait -NoNewWindow
    } catch {
        Write-Host "Échec du téléchargement ou de l'installation automatique : $_" -ForegroundColor Red
        Write-Host "Télécharge manuellement depuis https://git-scm.com/download/win et installe en choisissant 'Add Git to PATH' si besoin." -ForegroundColor Yellow
        exit 3
    } finally {
        if (Test-Path $tmp) { Remove-Item $tmp -Force -ErrorAction SilentlyContinue }
    }
}

Write-Host "Vérification finale :" -ForegroundColor Cyan
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "Git installé avec succès :" -ForegroundColor Green
    git --version
    Write-Host "Ferme puis rouvre ton terminal PowerShell / VS Code si 'git' n'est pas immédiatement trouvé." -ForegroundColor Green
    exit 0
} else {
    Write-Host "Après toutes les tentatives, 'git' n'a pas été trouvé." -ForegroundColor Red
    Write-Host "Installe manuellement depuis https://git-scm.com/download/win et choisis 'Add Git to PATH'." -ForegroundColor Yellow
    exit 4
}
