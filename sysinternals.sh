$uri = 'https://live.sysinternals.com/'
$sysToolsPage = Invoke-WebRequest -Uri $uri
$sysIntPath = 'C:\sysinternals'

if (-not (Test-Path -Path $sysIntPath)){
    New-Item -Path $sysIntPath -ItemType Directory
}

Set-Location -Path $sysIntPath

$sysTools = $sysToolsPage.Links.innerHTML | Where-Object -FilterScript {$_ -like "*.exe" -or $_ -like "*.chm"} 


foreach ($sysTool in $sysTools){
    Invoke-WebRequest -Uri "$uri/$sysTool" -OutFile $sysTool
}
