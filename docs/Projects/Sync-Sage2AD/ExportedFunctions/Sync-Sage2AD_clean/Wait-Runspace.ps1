function Wait-Runspace {
    param (
        [Parameter(Mandatory)]
        [System.Collections.ArrayList]$Runspaces
    )
    foreach ($Runspace in $Runspaces) {
        while (-not $Runspace.Runspace.IsCompleted) {
            Start-Sleep -Milliseconds 200
        }
    }
}
