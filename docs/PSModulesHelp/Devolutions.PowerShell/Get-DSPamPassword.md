Get-DSPamPassword
-----------------

### Synopsis

---

### Description

---

### Related Links
* [Get-DSPamCheckout](Get-DSPamCheckout)

* [Invoke-DSPamCheckin](Invoke-DSPamCheckin)

* [Invoke-DSPamCheckout](Invoke-DSPamCheckout)

* [Invoke-DSPamCheckoutPending](Invoke-DSPamCheckoutPending)

---

### Parameters
#### **AccountID**
ID of the pam account containing the password

|Type    |Required|Position|PipelineInput|Aliases        |
|--------|--------|--------|-------------|---------------|
|`[Guid]`|true    |named   |false        |PamCredentialID|

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-DSPamPassword -detailed". For technical information, type "Get-Help Get-DSPamPassword -full".

---

### Syntax
```PowerShell
Get-DSPamPassword -AccountID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
