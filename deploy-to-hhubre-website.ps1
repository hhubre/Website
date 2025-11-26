<#
  deploy-to-hhubre-website.ps1
  Usage: from PowerShell, in the project root:
    .\deploy-to-hhubre-website.ps1

  This script initialises git, creates a main branch if needed, sets
  the remote to the provided repository URL, and pushes the content.

  Note: This script will attempt to use gh (GitHub CLI) if available to
  create the remote repository (if it doesn't already exist). If gh is
  not installed or not authenticated, it will still set the given remote URL
  and push (the remote must already exist / accept pushes).
#>

param(
  [string]$RepoUrl = 'https://github.com/hhubre/Website.git',
  [switch]$ForceCreateRepoWithGH # if present and gh is available, try to create the repo
)

Write-Host "Deploy script starting — repo target: $RepoUrl" -ForegroundColor Cyan

if (-not (Test-Path -Path '.git')) {
  Write-Host "Initializing a new git repository" -ForegroundColor Yellow
  git init
}

git add .
git commit -m "Initial site" -q 2>$null || Write-Host "Nothing to commit or commit failed (maybe already committed)"

# ensure branch is main
git branch -M main

if ($ForceCreateRepoWithGH) {
  $ghPath = Get-Command gh -ErrorAction SilentlyContinue
  if ($ghPath) {
    Write-Host "Attempting to create remote repository using gh CLI (if it doesn't exist)" -ForegroundColor Yellow
    # try to create a repo using the owner/repo form from URL
    # parse repo name
    if ($RepoUrl -match 'github.com[/:](?<owner>[^/]+)/(?<repo>.+?)(?:\.git)?$'){
      $owner = $matches['owner']
      $repo = $matches['repo']
      Write-Host "Creating repo $owner/$repo..."
      gh repo create "$owner/$repo" --public --source=. --remote=origin --push -y 2>$null
    } else {
      Write-Host "Could not parse repo owner/name from URL; skipping gh create." -ForegroundColor Yellow
    }
  } else {
    Write-Host "gh CLI not found — skipping creation with gh." -ForegroundColor Yellow
  }
}

# set or update remote
$remoteSet = git remote get-url origin 2>$null
if (-not $remoteSet) {
  Write-Host "Adding remote origin -> $RepoUrl" -ForegroundColor Yellow
  git remote add origin $RepoUrl
} else {
  Write-Host "Remote 'origin' already exists (updating to $RepoUrl)" -ForegroundColor Yellow
  git remote set-url origin $RepoUrl
}

Write-Host "Pushing to origin main..." -ForegroundColor Green
git push -u origin main

Write-Host "Done. Check GitHub Actions → Pages and the Pages site URL for the published site." -ForegroundColor Cyan
