#===============================================================
#Name:           Domain Joining Script.
#Description:    Joining into Domain using PowerShell.
#Version:        1.2
#Date :          08/8/2023
#Website:        https://bonguides.com
#Script by:      Leo Nguyen
#For detailed script execution: https://bonguides.com
#===============================================================

if (-not([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You need to have Administrator rights to run this script!`nPlease re-run this script as an Administrator in an elevated powershell prompt!"
    break
}

#Pre-define username/password to preventing prompt when joinning.
$username = "duybao\admin"
$password = "1"
$secstr = New-Object -TypeName System.Security.SecureString
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr

#Check if the computer is a member of the domain then joins it.
$domain = (Get-WMIObject -NameSpace "Root\Cimv2" -Class "Win32_ComputerSystem").Domain
if ($domain -eq 'WORKGROUP') {
    Write-Host "This computer in in WORKGROUP." -ForegroundColor Yellow
    Write-Host "Joinning it into Domain...." -ForegroundColor Yellow
    Add-Computer -DomainName 'duybao.me' -DomainCredential $creds -Restart
} else {
    Write-Host "Already in Domain" -ForegroundColor Green
}
