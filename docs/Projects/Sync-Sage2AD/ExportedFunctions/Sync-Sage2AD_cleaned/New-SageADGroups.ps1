function New-SageADGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $NewSageADGroupNames
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Creating Sage AD Groups"
    Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    $CreatedSuccess = [System.Collections.ArrayList]::new()
    $CreatedFailed = [System.Collections.ArrayList]::new()

    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = $Script:Config.ADGroups.SageGroups.Path
        ErrorAction   = 'SilentlyContinue'
    }

    try {
        $NewSageADGroupNames | ForEach-Object {
            $ADGroupParams.Name = $_

            try {
                New-ADGroup @ADGroupParams
                $CreatedSuccess.Add($_)
                Write-Log -Level DEBUG -Message "[$($_)] Successfully created AD Group."
            }
            catch {
                $ErrorInfo = $_
                $ErrorMessage = $_.Exception.Message
                $CreatedFailed.Add($_)
                Write-Log -Level ERROR -Message "[$($_)] Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
            }
            
        }
    }
    catch {
        $ErrorInfo = $_
        $ErrorMessage = $_.Exception.Message
        Write-Log -Level ERROR -Message "Error creating ADGroups: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
    }
    
    if ($CreatedSuccess.Count -gt 0) {
        #$CreatedMessage = $CreatedSuccess -join ",`r`n`t"
        #$Message = "Neu angelegte Sage AD Gruppen: `r`n`t$CreatedMessage"
        #Send-Mail -Subject "Sage AD Gruppen Neu" -Body $Message -Ticket
        #Write-Log -Level DEBUG -Message $Message

        $Message = "`nNeu angelegte Sage AD Gruppen: `n`t $($CreatedSuccess -join `",`n`t `")"
        $Body = Build-MailBody -NewSageADGroups $CreatedSuccess

        Send-Mail -Subject "New Sage AD Groups Created" -Body $Body
        Write-Log -Level DEBUG -Message $Message
    }

    if ($CreatedFailed.Count -gt 0) {
        #$FailedMessage = $CreatedFailed -join ",`r`n`t"
        #$Message = "Fehler bei der Erstellung der Sage AD Gruppen: `r`n`t$FailedMessage"
        #Send-Mail -Subject "Sage AD Gruppen Fehlgeschlagen" -Body $Message
        #Write-Log -Level ERROR -Message $Message

        $Message = "`nFehler bei der Erstellung der Sage AD Gruppen: `n`t $($CreatedFailed -join `",`n`t `")"
        $Body = Build-MailBody -NewSageADGroups $CreatedFailed

        Send-Mail -Subject "Create Sage AD Groups Failed" -Body $Body
        Write-Log -Level DEBUG -Message $Message
    }
    
    $global:SyncHash.AD.SageGroups.Created = [PSCustomObject]@{
        Success = $CreatedSuccess
        Failed  = $CreatedFailed
    }

    Wait-Logging

    Invoke-Timer -FunctionName $FunctionName
    
}
