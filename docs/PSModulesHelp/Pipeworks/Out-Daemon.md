Out-Daemon
----------

### Synopsis
Creates small services that run PowerShell

---

### Description

Creates small services that run PowerShell on a regular basis

---

### Related Links
* [Watch-Daemon](Watch-Daemon)

* [Remove-Daemon](Remove-Daemon)

---

### Examples
> EXAMPLE 1

```PowerShell
Out-Daemon -ScriptBlock {    
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
```

---

### Parameters
#### **Name**
The short name of the service.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **DisplayName**
The display name of the service.  If no displayname is provided, it will be set to the name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **ScriptBlock**
A list of scripts the deamon will run.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ScriptBlock[]]`|true    |3       |false        |

#### **Interval**
The interval the scripts will use to run.  If no interval is provided, the scripts will run constantly.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TimeSpan[]]`|false   |4       |false        |

#### **ServicePath**
Where the service will be stored. If not provided, the service will be stored in $env:AppData\PowerShellDaemons\

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Out-Daemon [-Name] <String> [[-DisplayName] <String>] [-ScriptBlock] <ScriptBlock[]> [[-Interval] <TimeSpan[]>] [[-ServicePath] <String>] [<CommonParameters>]
```
