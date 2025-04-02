Remove-NcSecurityAuthPublickey
------------------------------

### Synopsis
Removes the public keys configured for user accounts

---

### Description

Removes the public keys configured for user accounts. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityAuthPublicKey](Get-NcSecurityAuthPublicKey)

* [New-NcSecurityAuthPublicKey](New-NcSecurityAuthPublicKey)

* [Set-NcSecurityAuthPublicKey](Set-NcSecurityAuthPublicKey)

---

### Examples
> Example 1

```PowerShell
Remove-NcSecurityAuthPublickey -OwnerName vs1 -AccountName pstk -Index 0
```

---

### Parameters
#### **OwnerName**
The Name of the Owner

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **AccountName**
The Name of the User Account

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Index**
Index Number for the public key

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|true    |2       |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: Security
Api: api/security/authentication/publickeys/{owner.uuid}/{account.name}/{index}
Family: Cluster

---

### Syntax
```PowerShell
Remove-NcSecurityAuthPublickey [-OwnerName] <String> [-AccountName] <String> [-Index] <long> [<CommonParameters>]
```
