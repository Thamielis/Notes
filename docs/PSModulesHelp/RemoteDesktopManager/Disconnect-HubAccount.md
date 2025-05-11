Disconnect-HubAccount
---------------------

### Synopsis
Disconnect to Hub

---

### Description

If ApplicationKey is provided, disconnect and remove PSHubContext from PowerShell session. If All is provided, disconnect and remove all PSHubContext from PowerShell session.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Disconnect-HubAccount -All
Disconnect all Hub Accounts and remove all PSHubContext.
```
> EXAMPLE 2

```PowerShell
PS C:\> Disconnect-HubAccount -ApplicationKey "24526a88-7f18-4356-95bd-11690f7bc59b;468ce2d5-ea4b-42ff-bc02-d93c71b4e554"
Disconnect the Hub account associated with the application key. The PSHubContext will also be removed.
```

---

### Parameters
#### **All**
Disconnect all Hub context

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **ApplicationKey**
Disconnect a particular connected Hub context

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Disconnect-HubAccount -detailed". For technical information, type "Get-Help Disconnect-HubAccount -full".

---

### Syntax
```PowerShell
Disconnect-HubAccount [[-ApplicationKey] <String>] [[-All]] [<CommonParameters>]
```
