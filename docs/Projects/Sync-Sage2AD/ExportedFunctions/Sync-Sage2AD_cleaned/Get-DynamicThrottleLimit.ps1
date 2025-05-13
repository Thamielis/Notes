function Get-DynamicThrottleLimit {
    [CmdletBinding()]
    param (
        [int]$MaxLimit = 16
    )

    $ProcTime = '\Processor(_Total)\% Processor Time'     # enUS
    $ProcTime = '\prozessor(_total)\prozessorzeit (%)'    # deAT
    

    $CPUUsage = (Get-Counter $ProcTime).CounterSamples[0].CookedValue
    $CPUUsage = [math]::Round($CPUUsage, 2)

    $ThrottleLimit = if ($CPUUsage -lt 50) { 
        $MaxLimit 
    }
    else { 
        [math]::Max([math]::Floor($MaxLimit / 2), 1) 
    }
    
    Write-Log -Level INFO -Message "Throttle limit set to: $ThrottleLimit (CPU Usage: $CPUUsage%)"
    
    return $ThrottleLimit
}
