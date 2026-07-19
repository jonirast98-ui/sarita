# Push seguro a GitHub usando GitHub CLI (evita el 403 del proxy de Claude)
$ErrorActionPreference = "Stop"

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Set-Location $PSScriptRoot

Write-Host "==> Comprobando sesion GitHub..."
gh auth status
if ($LASTEXITCODE -ne 0) {
  Write-Host "No hay sesion. Ejecuta: gh auth login"
  exit 1
}

Write-Host "==> Configurando credenciales git con gh..."
gh auth setup-git

$branch = (git rev-parse --abbrev-ref HEAD).Trim()
if (-not $branch) { $branch = "main" }

# Asegura remote correcto
$remote = git remote get-url origin 2>$null
if (-not $remote) {
  git remote add origin "https://github.com/jonirast98-ui/sarita.git"
} else {
  git remote set-url origin "https://github.com/jonirast98-ui/sarita.git"
}

Write-Host "==> Push de rama '$branch' a origin..."
git push -u origin $branch

if ($LASTEXITCODE -eq 0) {
  Write-Host "OK: https://github.com/jonirast98-ui/sarita"
  Write-Host "Web: https://jonirast98-ui.github.io/sarita/"
} else {
  Write-Host "Fallo el push. Prueba: gh auth login  y luego  .\push.ps1"
  exit $LASTEXITCODE
}
