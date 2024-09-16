clear
#Q1
#Get-EventLog -LogName System -Source Microsoft-Windows-Winlogon
#Q2
#$loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-30)

#$loginoutsTable = @()
#for($i=0; $i -lt $loginouts.Count; $i++){

#$event = ""
#if($loginouts.InstanceId -eq 7001) {$event="Logon"}
#if($loginouts.InstanceId -eq 7002) {$event="Logoff"}


#$UID = New-Object System.Security.Principal.SecurityIdentifier($loginouts[$i].ReplacementStrings[1])
#$user = $UID.Translate([System.Security.Principal.NTAccount])

#$user = $loginouts[$i].ReplacementStrings[1]

#$loginoutsTable += [PSCustomObject] @{"Time" = $loginouts[$i].TimeGenerated
#                        "Id" = $loginouts[$i].InstanceId
#                      "Event" = $event
#                       "User" = $user
#                       }
#}

#$loginoutsTable
#Q3
#$UID = New-Object System.Security.Principal.SecurityIdentifier($loginouts[$i].ReplacementStrings[1])
#$user = $UID.Translate([System.Security.Principal.NTAccount])
#Q4
function loginfotable($numInput) {
    $loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays($numInput)

    $loginoutsTable = @()
    for($i=0; $i -lt $loginouts.Count; $i++){
    $event1 = ""
    if($loginouts.InstanceId -eq 7001) {$event1="Logon"}
    if($loginouts.InstanceId -eq 7002) {$event1="Logoff"}

    $UID = New-Object System.Security.Principal.SecurityIdentifier($loginouts[$i].ReplacementStrings[1])
    $user = $UID.Translate([System.Security.Principal.NTAccount])
    #$user = $loginouts[$i].ReplacementStrings[1]

    $loginoutsTable += [PSCustomObject] @{"Time" = $loginouts[$i].TimeGenerated
                             "Id" = $loginouts[$i].InstanceId
                        "Event" = $event1
                         "User" = $user
                         }
    }
    $loginoutsTable
}

function shutdowninfo($numInput){
    $shutdowns = Get-EventLog  System -After (Get-Date).AddDays($numInput)  | Where {$_.EventID -eq 6006} 

    $shutdownsTable = @()
    for($i=0; $i -lt $shutdowns.Count; $i++){

    $event = ""
    if($shutdowns.EventID -eq 6006) {$event = "Shutdown"}


    $user = "System"

    $shutdownsTable += [PSCustomObject] @{"Time" = $shutdowns[$i].TimeGenerated
                                    "Id" = $shutdowns[$i].EventID
                                 "Event" = $event
                                  "User" = $user
                                  }
    }

    $shutdownsTable
}

function startupinfo($numInput) {
$startups = Get-EventLog  System -After (Get-Date).AddDays($numInput) | Where {$_.EventID -eq 6005}

$startupsTable = @()
for($i=0; $i -lt $startups.Count; $i++){

$event = ""
if($startups.EventID -eq 6005) {$event="Startup"}

$user = "System"

$startupsTable += [PSCustomObject] @{"Time" = $startups[$i].TimeGenerated
                                "Id" = $startups[$i].EventID
                             "Event" = $event
                              "User" = $user
                              }
}

$startupsTable
}

#Q5
#$shutdowns = Get-EventLog  System -After (Get-Date).AddDays(-30)  | Where {$_.EventID -eq 6006}

#$shutdownsTable = @()
#for($i=0; $i -lt $shutdowns.Count; $i++){

#$event = ""
#if($shutdowns.EventID -eq 6006) {$event="Shutdown"}

#$user = "System"

#$shutdownsTable += [PSCustomObject] @{"Time" = $shutdowns[$i].TimeGenerated
#                                "Id" = $shutdowns[$i].EventID
#                             "Event" = $event
#                              "User" = $user
#                              }
#}

#$shutdownsTable

#$startups = Get-EventLog  System -After (Get-Date).AddDays(-30) | Where {$_.EventID -eq 6005}

#$startupsTable = @()
#for($i=0; $i -lt $startups.Count; $i++){

#$event = ""
#if($startups.EventID -eq 6005) {$event="Startup"}

#$user = "System"

#$startupsTable += [PSCustomObject] @{"Time" = $startups[$i].TimeGenerated
#                                "Id" = $startups[$i].EventID
#                             "Event" = $event
#                              "User" = $user
#                              }
#}

#$startupsTable
#Q6