$path = 'C:\ProgramData\chocolatey'
if (-not (Test-Path -Path $path)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    irm https://community.chocolatey.org/install.ps1 | iex
}
