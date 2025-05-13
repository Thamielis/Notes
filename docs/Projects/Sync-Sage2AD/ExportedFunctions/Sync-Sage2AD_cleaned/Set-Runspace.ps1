function Set-Runspace {

    #region    Sync - Runspace
    $global:SyncHash.Runspace = [hashtable]::Synchronized(@{})
    $global:SyncHash.Runspace.ThreadId = [System.Threading.Thread]::CurrentThread.ManagedThreadId
    $Global:SyncHash.Runspace.Jobs = [System.Collections.ArrayList]::Synchronized([Collections.ArrayList]::new())

    $global:SyncHash.Runspace | Add-Member -MemberType ScriptMethod -Name GetFunctions -Value { 
        $Global:SyncHash.Runspace.Functions = $global:SyncHash.Config.Imports.Functions | ForEach-Object { 
            Get-FunctionsFromScript $_
        }
    }

    $global:SyncHash.Runspace | Add-Member -MemberType ScriptMethod -Name NewPool -Value {
        $this.Modules = $global:SyncHash.Config.Imports.Names.Modules
        $global:SyncHash.Runspace.GetFunctions()
        $this.Pool = New-RunspacePool -Functions $this.Functions -Modules $this.Modules -Variables "SyncHash" -MTA
        #$this.Add('Runspaces', $Global:Runspaces)
    }

    $global:SyncHash.Runspace.NewPool()
    $global:SyncHash.Runspace.Runspaces = $Global:Runspaces
    $global:SyncHash.Errors = $global:SyncHash.Runspace.Runspaces.Runspace.Streams.Error

    $ISS = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
    $ISS.Variables.Add(
        ([System.Management.Automation.Runspaces.SessionStateVariableEntry]::new('SyncHash', $global:SyncHash, $null))
    )
    $ISS.Variables.Add(
        ([System.Management.Automation.Runspaces.SessionStateVariableEntry]::new('Data', $global:Data, $null))
    )
    
    foreach ($Module in $global:SyncHash.Runspace.Modules) {

        try {
            $ISS.ImportPSModule($Module) | Out-Null
            Write-Verbose "Imported $Module to Initial Session State"
        }
        catch {
            Write-Warning $_.Exception.Message
        }
    }
    
    foreach ($Script in $global:SyncHash.Config.Imports.Classes) {
        try {
            $ISS.ImportPSModulesFromPath($Script) | Out-Null
            Write-Verbose "Imported $Script to Initial Session State"
        }
        catch {
            Write-Warning $_.Exception.Message
        }
    }
    
    foreach ($Func in $global:SyncHash.Runspace.Functions) {

        try {
            $thisFunction = Get-Item -LiteralPath "function:$func"
            [String]$functionName = $thisFunction.Name
            [ScriptBlock]$functionCode = $thisFunction.ScriptBlock

            $ISS.Commands.Add([System.Management.Automation.Runspaces.SessionStateFunctionEntry]::new($FunctionName, $FunctionCode))
            
            Write-Verbose "Imported $func to Initial Session State"
            Remove-Variable thisFunction, functionName, functionCode
        }
        catch {
            Write-Warning $_.Exception.Message
        }
    }

    $RunspacePool = [System.Management.Automation.Runspaces.RunspaceFactory]::CreateRunspacePool(1, 10, $ISS, $Host)
    $RunspacePool.ApartmentState = 'MTA'
    $RunspacePool.ThreadOptions = 'ReuseThread'
    $RunspacePool.Open()

    $global:SyncHash.Runspace.RunspacePool = $RunspacePool
}
