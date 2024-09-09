clear
#Q1
#(Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ilike "Ethernet0" } ).IPAddress
#Q2
#(Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ilike "Ethernet0" } ).PrefixLength
#Q3
#Get-WmiObject -List | Where-Object {$_.Name -ilike "Win32_net*" }
#Q4
#Get-WmiObject -List | Where-Object {$_.Name -ilike "Win32_net*" } | Sort-Object
#Q5
#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | Select DHCPServer
#Q6
#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | Select DHCPServer | Format-Table -HideTableHeaders
#Q7
#(Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ilike "Ethernet0"}).ServerAddresses
#Q8
#cd $PSScriptRoot

#$files=(Get-ChildItem)
#for ($j=0; $j -le $files.Count ; $j++){

#    if($files[$j].Name -ilike "*ps1"){
#        Write-Host $files[$j].Name
#    }
#}
#Q9
#$folderpath="$PsscriptRoot\outfolder"
#if(Test-Path $folderpath){
#    Write-Host "Folder Already Exists"
#}
#else{
#    New-Item -ItemType Directory -Path $folderpath
#    }
#Q10
#cd $PSScriptRoot
#$files= (Get-ChildItem)

#$folderpath = "$PSScriptRoot/outfolder/"
#$filePath = Join-Path $folderPath "out.csv"

#$files | Where-Object { $_.extenstion -eq ".ps1" } | `
#Export-Csv -Path $filePath
#Q11
#$files = Get-ChildItem *.csv -Recurse -File
#$files | Rename-Item -NewName { $_.Name -replace '.csv', '.log'}
#Get-ChildItem -Recurse -File