function Sync-SageADGroups {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )
    
    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Checking/Creating Sage AD Groups"
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    $NewSageADGroups = [System.Collections.ArrayList]::new()
    $AllSageGroups = Get-SageADGroups
    
    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = $Script:Config.ADGroups.SageGroups.Path
    }
    #$DistinguishedGroupName = "CN=$($SageGroupName),$($Script:Config.ADGroups.SageGroups.Path)"
    #$AllSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'
    
    
    $SageADGroupNames | ForEach-Object -Parallel {
        param($GroupName)
        try {
            if ($AllSageGroups.Name -notcontains $GroupName) {
                if ($PSCmdlet.ShouldProcess("AD Group $GroupName", "Create")) {
                    $ADGroupParams.Name = $GroupName
                    New-ADGroup @ADGroupParams

                    Write-Log -Level WARNING -Message "Successfully created AD Group: $GroupName"
                    $NewSageADGroups.Add($GroupName)
                }
                
            }
        }
        catch {
            Write-Log -Level 'ERROR' -Message "Error creating group: $GroupName"
        }
    } -ThrottleLimit 5

    Invoke-Timer -FunctionName $FunctionName

    $Message = "Neu angelegte Sage AD Gruppen: $($NewSageADGroups -join ', ')"

    if ($NewSageADGroups.Count -gt 0) {
        Send-Mail -Subject "Sage AD Groups" -Body $Message
        Write-Log -Level DEBUG -Message $Message
    }
    
    Wait-Logging
}
