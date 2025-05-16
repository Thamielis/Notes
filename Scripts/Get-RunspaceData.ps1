Function Get-RunspaceData {
    [cmdletbinding()]
    param (
        [switch]$Wait
    )

    Do {
        $more = $false   
        
        Foreach ($runspace in $runspaces) {

            If ($runspace.Runspace.isCompleted) {
                $runspace.powershell.EndInvoke($runspace.Runspace)
                $runspace.powershell.dispose()
                $runspace.Runspace = $null
                $runspace.powershell = $null                 
            }
            ElseIf ($null -ne $runspace.Runspace) {
                $more = $true
            }
        }
        
        If ($more -AND $PSBoundParameters['Wait']) {
            Start-Sleep -Milliseconds 100
        }   
        
        #Clean out unused runspace jobs
        $temphash = $runspaces.clone()
        $temphash | Where-Object {
            $Null -eq $_.runspace
        } | ForEach-Object {
            Write-Verbose ("Removing {0}" -f $_.computer)
            $Runspaces.remove($_)
        }

        [console]::Title = ("Remaining Runspace Jobs: {0}" -f ((@($runspaces | Where-Object { $Null -ne $_.Runspace }).Count)))

    } while ($more -AND $PSBoundParameters['Wait'])
}

$ScriptBlock = {
    Param ($computer, $hash)

    $hash[$Computer] = ([int]$computer * 10)
}

$Script:runspaces = [System.Collections.ArrayList]::new()

$Computername = 1, 2, 3, 4, 5

$hash = [hashtable]::Synchronized(@{})

$sessionstate = [system.management.automation.runspaces.initialsessionstate]::CreateDefault()
$runspacepool = [runspacefactory]::CreateRunspacePool(1, 10, $sessionstate, $Host)
$runspacepool.Open()

ForEach ($Computer in $Computername) {
    #Create the powershell instance and supply the scriptblock with the other parameters 
    $powershell = [powershell]::Create().AddScript($scriptBlock).AddArgument($computer).AddArgument($hash)
    
    # Add the runspace into the powershell instance
    $powershell.RunspacePool = $runspacepool
    
    #Create a temporary collection for each runspace
    $temp = "" | Select-Object PowerShell, Runspace, Computer
    $Temp.Computer = $Computer
    $temp.PowerShell = $powershell
    
    #Save the handle output when calling BeginInvoke() that will be used later to end the runspace
    $temp.Runspace = $powershell.BeginInvoke()
    
    Write-Verbose ("Adding {0} collection" -f $temp.Computer)
    
    $runspaces.Add($temp) | Out-Null               
}

