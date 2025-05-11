Get-HubContext
--------------

### Synopsis
Get the current context or all available contexts

---

### Description

If ListAvailable provided, list all PSHubContext set in PowerShell session. If ListAvailable not provided, get the current PSHubContext who will be used for all other Hub commands.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-HubContext
Obtain the current context
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-HubContext -ListAvailable
Obtain the available contexts
```

---

### Parameters
#### **ListAvailable**
List all Hub context

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Hub.PowerShell.Entities.PowerShell.PSHubContext

* [Collections.Generic.List`1[[Devolutions.Hub.PowerShell.Entities.PowerShell.PSHubContext, RemoteDesktopManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List`1[[Devolutions.Hub.PowerShell.Entities.PowerShell.PSHubContext, RemoteDesktopManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]])

---

### Notes
For more information, type "Get-Help Get-HubContext -detailed". For technical information, type "Get-Help Get-HubContext -full".

---

### Syntax
```PowerShell
Get-HubContext [[-ListAvailable]] [<CommonParameters>]
```
