Write-Host
Write-Host "Danh sách card mạng trên máy tính:"
Get-DnsClientServerAddress
Write-Host
$InterfaceAlias = Read-Host -Prompt 'Nhập vào tên của card mạng mà bạn muốn thay đổi DNS Servers:'
Set-DNSClientServerAddress "$InterfaceAlias" –ServerAddresses ("8.8.8.8", "1.1.1.1")

Write-Host
Write-Host "Kiểm tra lại DNS Server đã được thay đổi thành công:"
Get-DnsClientServerAddress
