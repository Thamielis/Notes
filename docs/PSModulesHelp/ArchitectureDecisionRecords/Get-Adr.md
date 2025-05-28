Get-Adr
-------

### Synopsis
Gets all ADRs or a single ADR from the ADR dir.

---

### Description

Gets all ADRs from the ADR dir, parsed as objects. If a number is specified, only that
ADR will be returned.

---

### Parameters
#### **Number**
Get a single ADR with the number given. If not specified, all ADRs will be returned.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

---

### Outputs
* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

---

### Syntax
```PowerShell
Get-Adr [[-Number] <Int32>] [<CommonParameters>]
```
