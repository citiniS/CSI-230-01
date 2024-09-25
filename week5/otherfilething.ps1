.(Join-Path $PSScriptRoot champlainscraping.ps1)

$FullTable = gatherClasses
$FullTable = daystranslator $FullTable

#i                  
#$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | `
#             Where {$_."Instructor" -ilike "Furkan*" }
#ii
#$FullTable | Where-Object {($_.Location -ilike "Joyc 310") -and ($_.days -contains "Monday") } |
#             Sort-Object "Time Start" |
#             Select-Object "Time Start", "Time End", "Class Code"
#iii 
$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
                                              ($_."Class Code" -ilike "NET*") -or `
                                              ($_."Class Code" -ilike "SEC*") -or `
                                              ($_."Class Code" -ilike "FOR*") -or `
                                              ($_."Class Code" -ilike "CSI*") -or `
                                              ($_."Class Code" -ilike "DAT*") } `
                             | Select-Object "Instructor" `
                             | Sort-Object "Instructor" -Unique
#$ITSInstructors

#iv
$FullTable | Where { $_.Instructor -in $ITSInstructors.Instructor } `
           | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending