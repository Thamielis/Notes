function Sync-SageADGroups {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )
    
    #$FunctionName = $MyInvocation.MyCommand.Name
    #$Description = "Checking/Creating Sage AD Groups"
    #Invoke-Timer -FunctionName $FunctionName -Description $Description

    $NewSageADGroups = [System.Collections.ArrayList]::new()
    
    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
    }
    
    $AllSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'

    $SageADGroupNames | ForEach-Object {
        $GroupName = $_
        try {
            if ($AllSageGroups.Name -notcontains $GroupName) {
                if ($PSCmdlet.ShouldProcess("AD Group $GroupName", "Create")) {
                    $ADGroupParams.Name = $GroupName
                    New-ADGroup @ADGroupParams

                    $NewSageADGroups += $GroupName
                    Write-Log -Level INFO -Message "Successfully created AD Group: $GroupName"
                }
                
                Wait-Logging
            }
        }
        catch {
            Write-Log -Level 'ERROR' -Message "Error creating group: $GroupName"
        }
    }
    
    if ($NewSageADGroups.Count -gt 0) {
        $Message = "`nNeu angelegte Sage AD Gruppen: `n`t $($NewSageADGroups -join `",`n`t `")"
        $Body = Build-MailBody -NewSageADGroups $NewSageADGroups

        Send-Mail -Subject "Sage AD Groups" -Body $Body
        Write-Log -Level DEBUG -Message $Message
    }
    
    Wait-Logging
}
