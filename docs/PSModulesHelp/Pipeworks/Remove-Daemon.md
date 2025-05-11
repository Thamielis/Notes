Remove-Daemon
-------------

### Synopsis
Removes a Daemon in the system

---

### Description

Removes a Daemon (Service) registered on the system

---

### Related Links
* [Out-Daemon](Out-Daemon)

* [Watch-Daemon](Watch-Daemon)

---

### Examples
> EXAMPLE 1

```PowerShell
Out-Deamon -ScriptBlock {    
        Write-Warning "Warning"
        Write-Error "Error"
        $VerbosePreference = 'continue'
        Write-Verbose "Verbose"
        $debugPreference = 'continue'
        Write-Debug "Debug"
        Write-Progress "a" "b" -PercentComplete 1
        1
        New-Object PSObject -Property @{"A" = "b";"c" = "d" }
} -Interval "00:00:15" -Name streamtest
Remove-Daemon -Name streamtest
```

---

### Parameters
#### **Name**
The name of the daemon.  Can be either the short name or the display name.  Can include wildcards.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **RemoveContent**
If set, will remove the executable and the output files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Remove-Daemon [-Name] <String> [-RemoveContent] [-WhatIf] [-Confirm] [<CommonParameters>]
```
