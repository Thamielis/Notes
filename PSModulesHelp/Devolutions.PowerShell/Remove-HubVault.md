Remove-HubVault
---------------

### Synopsis

---

### Description

---

### Parameters
#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **Permanently**
If remove Hub and this is set to true, the vault will be permanently deleted. If not, the vault will be soflty deleted

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultId**
Id of the Hub vault you want to remove

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-HubVault -detailed". For technical information, type "Get-Help Remove-HubVault -full".

---

### Syntax
```PowerShell
Remove-HubVault -VaultId <Guid> [-Permanently] [-HubContext <HubContext>] [<CommonParameters>]
```
