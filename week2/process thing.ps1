$chrome = (Get-Process | Where-Object { $_.ProcessName -ilike "chrome"})
if($chrome -eq $null)
{
Start-Process chrome.exe '--new https://Champlain.edu'
}
else
{
Stop-Process -Name *chrome*
}
