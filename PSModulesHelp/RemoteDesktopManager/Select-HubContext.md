Select-HubContext
-----------------

### Synopsis
Select another PSHubContext to change the current PSHubContext

---

### Description

Select another PSHubContext to change the current PSHubContext who will be used for all Hub commands.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $availCtxs = Get-HubContext; Select-HubContext -ApplicationKey $availCtxs[2].ApplicationKey
The user fetches all available contexts and set the third one as the new current context.
```

---

### Parameters
#### **ApplicationKey**
Select a connected Hub context to current session

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Select-HubContext -detailed". For technical information, type "Get-Help Select-HubContext -full".

---

### Syntax
```PowerShell
Select-HubContext [-ApplicationKey] <String> [<CommonParameters>]
```
