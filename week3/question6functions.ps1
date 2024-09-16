clear
.(Join-Path $PSScriptRoot functions.ps1)

$loginoutsTable = loginfotable(-15)
$loginoutsTable

$shutdownsTable = shutdowninfo(-25)
$shutdownsTable

$startupsTable = startupinfo(-25)
$startupsTable