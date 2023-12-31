Write-Host
Write-Host "Danh sách card mạng trên máy tính:" -ForegroundColor Yellow
Get-DnsClientServerAddress
Write-Host
$InterfaceAlias = $(Write-Host -NoNewLine) + $(Write-Host "Nhập vào tên của card mạng mà bạn muốn thay đổi DNS Servers:" -ForegroundColor Yellow -NoNewLine; Read-Host) 
Set-DNSClientServerAddress "$InterfaceAlias" –ServerAddresses ("192.168.0.5", "1.1.1.1")

Write-Host
Write-Host "Kiểm tra lại DNS Server đã được thay đổi thành công:" -ForegroundColor Green
Get-DnsClientServerAddress
