clear
function apacheLogs($page, $http, $browser){
    $something = Get-Content  C:\xampp\apache\logs\access.log
   
    $somethingTable = @()
    for($i=0; $i -lt $something.Count; $i++){

        $words = $something[$i].Split(" ")

    $somethingTable += [PSCustomObject]@{ "IP" = $words[0]
                                            "Page" = $words[6]
                                           "Http" = $words[8]
                                        "Browser" = $words[11] }
    }
 $somethingTable | Where-Object { $_.IP -ilike "10.*"} | Where-Object {($_.Page -ilike $page) -and ($_.Http -ilike $http) -and ($_.Browser -ilike $browser)}
}

$somethingTable = apacheLogs "/index.html" '304' "*Mozilla*" 
#$somethingTable