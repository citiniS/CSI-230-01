clear
#Q1
#(Get-Process | Where-Object { $_.ProcessName -ilike "c*"})
#Q2
#(Get-Process | Where-Object { $_.Path  -inotlike "*system32*"})
#Q3
#Get-Service | Where-Object { $_.Status -ine "Running"} | Sort-Object | Export-Csv -Path .\Processes
#Q4


$chrome = (Get-Process | Where-Object { $_.ProcessName -ilike "chrome"})
if($chrome -eq $null)
{
Start-Process chrome.exe '--new https://Champlain.edu'
}
else
{
Stop-Process -Name *chrome*
}