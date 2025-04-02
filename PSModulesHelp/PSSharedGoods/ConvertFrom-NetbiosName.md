ConvertFrom-NetbiosName
-----------------------

### Synopsis
Converts a NetBIOS name to its corresponding domain name and object name.

---

### Description

This function takes a NetBIOS name in the format 'Domain\Object' and converts it to the corresponding domain name and object name.

---

### Examples
> EXAMPLE 1

```PowerShell
'TEST\Domain Admins', 'EVOTEC\Domain Admins', 'EVOTECPL\Domain Admins' | ConvertFrom-NetbiosName
Converts the NetBIOS names 'TEST\Domain Admins', 'EVOTEC\Domain Admins', and 'EVOTECPL\Domain Admins' to their corresponding domain names and object names.
```
> EXAMPLE 2

```PowerShell
ConvertFrom-NetbiosName -Identity 'TEST\Domain Admins', 'EVOTEC\Domain Admins', 'EVOTECPL\Domain Admins'
Converts the NetBIOS names 'TEST\Domain Admins', 'EVOTEC\Domain Admins', and 'EVOTECPL\Domain Admins' to their corresponding domain names and object names.
```

---

### Parameters
#### **Identity**
Specifies the NetBIOS name(s) to convert.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|

---

### Syntax
```PowerShell
ConvertFrom-NetbiosName [-Identity] <String[]> [<CommonParameters>]
```
