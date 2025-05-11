Watch-Daemon
------------

### Synopsis
Watches the output from a Daemon

---

### Description

Watches the output from a PowerShell Daemon created with Out-Daemon

---

### Related Links
* [Out-Daemon](Out-Daemon)

* [Remove-Daemon](Remove-Daemon)

---

### Examples
> EXAMPLE 1

```PowerShell
Watch-Daemon "MyDaemon"
```

---

### Parameters
#### **Name**
The name of the daemon.  Can be either the short name or the display name.  Can include wildcards.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **Constant**
If set, will watch the daemon's results constantly

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |Constantly|

#### **Keep**
If set, will keep the results of the daemon.  Otherwise, the daemon's output will be cleared.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Watch-Daemon [-Name] <String> [-Constant] [-Keep] [<CommonParameters>]
```
