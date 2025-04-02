Remove-NcSecurityIpSecPolicy
----------------------------

### Synopsis
Delete an IPsec policy.

---

### Description

Delete an IPsec policy.This cmdlet is supported with Rest.

---

### Related Links
* [New-NcSecurityIpSecPolicy](New-NcSecurityIpSecPolicy)

* [Get-NcSecurityIpSecPolicy](Get-NcSecurityIpSecPolicy)

* [Set-NcSecurityIpSecPolicy](Set-NcSecurityIpSecPolicy)

---

### Examples
> Example 1

```PowerShell
Remove-NcSecurityIpSecPolicy -Name
Remove the IPsec policy.
```

---

### Parameters
#### **Name**
IPsec policy name.

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
Category:  IPsec policy.
API: api/security/ipsec/policies
Family: Security

---

### Syntax
```PowerShell
Remove-NcSecurityIpSecPolicy [-Name] <String> [<CommonParameters>]
```
