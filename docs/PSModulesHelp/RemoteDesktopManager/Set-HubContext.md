Set-HubContext
--------------

### Synopsis
Set the current PSHubContext

---

### Description

Set the current PSHubContext to the one provided

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $availCtxs = Get-HubContext; Set-HubContext -PSHubContext $availCtxs[2]
The user fetches all available contexts and set the third one as the new current context.
```

---

### Parameters
#### **PSHubContext**
Set Hub context to current session

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSHubContext]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-HubContext -detailed". For technical information, type "Get-Help Set-HubContext -full".

---

### Syntax
```PowerShell
Set-HubContext [-PSHubContext] <PSHubContext> [<CommonParameters>]
```
