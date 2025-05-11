Remove-NcSecurityMultiAdminRequest
----------------------------------

### Synopsis
Deletes a multi-admin-verify request.

---

### Description

Deletes a multi-admin-verify request.This cmdlet is supported with Rest

---

### Related Links
* [Set-NcSecurityMultiAdminRequest](Set-NcSecurityMultiAdminRequest)

* [Get-NcSecurityMultiAdminRequest](Get-NcSecurityMultiAdminRequest)

* [New-NcSecurityMultiAdminRequest](New-NcSecurityMultiAdminRequest)

---

### Examples
> Example 1

```PowerShell
Remove-NcSecurityMultiAdminRequest -Index 1
```

---

### Parameters
#### **Index**
The Index.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: Security
Api: /security/multi-admin-verify/requests
Family: Controller

---

### Syntax
```PowerShell
Remove-NcSecurityMultiAdminRequest [-Index] <String> [<CommonParameters>]
```
