

$RSP = [runspacefactory]::CreateRunspacePool(1, 2)
$RSP.Open()

$List = New-Object System.Collections.ArrayList

$Result = 1..6 | ForEach-Object {
    $PS = [powershell]::Create()
    $PS.RunspacePool = $RSP

    [void]$PS.AddScript({
            Param($i)
            While ($True) {
                Start-Sleep -Milliseconds 1000
                If ($i % 2) { BREAK }
            }
        }).AddArgument($_)

    $List.Add((
            [pscustomobject]@{
                Id         = $_
                PowerShell = $PS
                Handle     = $PS.BeginInvoke()
            }
        ))

}

Start-Sleep -Seconds 2

$Flag = 'static', 'nonpublic', 'instance'

0..5 | ForEach-Object {
    
    $_Worker = $list[0].PowerShell.GetType().GetField('worker', $Flag)
    $Worker = $_Worker.GetValue($list[$_].PowerShell)
    
    $_CRP = $worker.GetType().GetProperty('CurrentlyRunningPipeline', $Flag)
    $CRP = $_CRP.GetValue($Worker)

    $State = If ($list[$_].handle.IsCompleted -AND -NOT [bool]$CRP) {
        'Completed'
    } 
    ElseIf (-NOT $list[$_].handle.IsCompleted -AND [bool]$CRP) {
        'Running'
    }
    ElseIf (-NOT $list[$_].handle.IsCompleted -AND -NOT [bool]$CRP) {
        'NotStarted'
    }
    
    [pscustomobject]@{
        Id              = (([int]$_) + 1)
        HandleComplete  = $list[$_].handle.IsCompleted
        PipelineRunning = [bool]$CRP
        State           = $State
    }

}

