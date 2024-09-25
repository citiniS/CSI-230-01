clear
function gatherClasses(){

    $page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.33/Courses-1.html

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr") 

    $Fulltable = @()
    for($i = 1; $i -lt $trs.length; $i++){
        $tds = $trs[$i].getElementsByTagName("td")

        $Times = $tds[5].outerText.Split("-")

        $FullTable += [PSCustomObject]@{"Class Code"  = $tds[0].outerText;
                                         "Title"      = $tds[1].outerText;
                                         "Days"       = $tds[4].outerText;
                                         "Time Start" = $Times[0];
                                         "Time End"   = $Times[1];
                                         "Instructor" = $tds[6].outerText;
                                         "Location"   = $tds[9].outerText;
                                }
    }
    return $Fulltable
}

function daysTranslator($Fulltable){
    for($i=0; $i -lt $Fulltable.Count; $i++){
        
        $Days = @()

        if($Fulltable[$i].Days -ilike "M*"){ $Days += "Monday" }

        if($Fulltable[$i].Days -ilike "*T[TWF]*"){ $Days += "Tuesday" }
        ElseIf($Fulltable[$i].Days -ilike "T"){ $Days += "Tuesday" }

        if($Fulltable[$i].Days -ilike "W*"){ $Days += "Wednesday" }

        if($Fulltable[$i].Days -ilike "TH*"){ $Days += "Thursday" }

        if($Fulltable[$i].Days -ilike "F*"){ $Days += "Friday" }

        $FullTable[$i].Days = $Days
    }
    return $Fulltable
}