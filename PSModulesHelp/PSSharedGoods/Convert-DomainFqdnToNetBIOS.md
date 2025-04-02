Convert-DomainFqdnToNetBIOS
---------------------------

### Synopsis
Converts FQDN to NetBIOS name for Active Directory Domain

---

### Description

Converts FQDN to NetBIOS name for Active Directory Domain

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-DomainFqdnToNetBIOS -Domain 'ad.evotec.xyz'
```
> EXAMPLE 2

```PowerShell
Convert-DomainFqdnToNetBIOS -Domain 'ad.evotec.pl'
```

---

### Parameters
#### **DomainName**
DomainName for current forest or trusted forest

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-DomainFqdnToNetBIOS [[-DomainName] <String>] [<CommonParameters>]
```
