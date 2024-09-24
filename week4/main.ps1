.(Join-Path $PSScriptRoot Apache-Logs.ps1)
.(Join-Path $PSScriptRoot apacheotherassingment.ps1)

$ipsoftens = $somethingTable | Where-Object {$_.IP -ilike "10.*"}
$ipsoftens2 = $tableRecords | Where-Object {$_.IP -ilike "10.*"}
$counts = $ipsoftens + $ipsoftens2 | Sort-Object IP | Group-Object IP
$counts | Select-Object Count, Name