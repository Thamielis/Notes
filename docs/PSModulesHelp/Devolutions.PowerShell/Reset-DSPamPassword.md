Reset-DSPamPassword
-------------------

### Synopsis
Reset the password of a PAM account

---

### Description

Reset the password of a PAM account.

---

### Related Links
* [Get-DSPamAccount](Get-DSPamAccount)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Reset-DSPamPassword -AccountID 'my-pam-account-id'
Reset the password of the PAM account whose ID is 'my-pam-account-id'
```

---

### Parameters
#### **AccountID**
ID of the pam account containing the password

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |named   |true (ByValue)|

---

### Inputs
System.Guid

ID of the PAM account whose password will be reset.

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Reset-DSPamPassword -detailed". For technical information, type "Get-Help Reset-DSPamPassword -full".

---

### Syntax
```PowerShell
Reset-DSPamPassword -AccountID <Guid> [<CommonParameters>]
```
