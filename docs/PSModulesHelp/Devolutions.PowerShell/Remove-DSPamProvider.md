Remove-DSPamProvider
--------------------

### Synopsis

---

### Description

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ProviderID**
Provider's ID

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
For more information, type "Get-Help Remove-DSPamProvider -detailed". For technical information, type "Get-Help Remove-DSPamProvider -full".

---

### Syntax
```PowerShell
Remove-DSPamProvider -ProviderID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
