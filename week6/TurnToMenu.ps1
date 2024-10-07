#NOTE: IF 1 IS DISPLAYED 2 DOES NOT DISPLAY FOR SOME REASON. MAYBE FORMATTING ISSUE
 #clear
.'C:\Users\champuser\CSI-230-01\week2\Question 4 code.ps1'
. C:\Users\champuser\CSI-230-01\week6\Event-Logs.ps1
. C:\Users\champuser\CSI-230-01\week4\Apache-Logs.ps1



$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display Last 10 Apache Logs`n"
$Prompt += "2 - Display Last 10 Failed Log-In Logs`n"
$Prompt += "3 - List at Risk Users`n"
$Prompt += "4 - Open/Close Champlain College Chrome Tab`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){
 
    Write-Host $Prompt | Out-String
    $choice = Read-Host 

    if($choice -eq 1){
        $somethingTable = apacheLogs "/index.html" '304' "*Mozilla*" | Select-Object -Last 10
         Write-Host ($somethingTable | Format-Table | Out-String)  
    }

    elseif($choice -eq 2){
        $failedLoginsTable = getFailedLogins 100 | Select-Object -Last 10
        Write-Host ($failedLoginsTable | Format-Table | Out-String)
    }

    elseif($choice -eq 3){
        getAtRiskUser
    }

    elseif($choice -eq 4){
        $chromeTab = chromeOperation
        $chromeTab
    }


    elseif($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -ne '[1-5]'){
        Write-Host "`nIncorrect input, please try again"
    }

}


