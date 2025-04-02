Get-VBRFreeAgentInstanceConsumptionStatus
-----------------------------------------

### Synopsis
Returns a state of the instance consumption by non-licensed Veeam Agents.

---

### Description

This cmdlet returns a state of the instance consumption by non-licensed Veeam Agents.
- False - indicates that the instance consumption by non-licensed Veeam Agents option is disabled.
- True - indicates that the instance consumption by non-licensed Veeam Agents option is enabled.

---

### Examples
> Getting State of Instance Consumption

```PowerShell
Get-VBRFreeAgentInstanceConsumptionStatus
False
This command returns a state of the instance consumption by non-licensed Veeam Agents.
```

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRFreeAgentInstanceConsumptionStatus [<CommonParameters>]
```
