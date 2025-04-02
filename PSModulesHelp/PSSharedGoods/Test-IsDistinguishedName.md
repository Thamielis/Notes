Test-IsDistinguishedName
------------------------

### Synopsis
Determines whether a given string is a valid Distinguished Name (DN) format.

---

### Description

This function checks if the provided string matches the format of a Distinguished Name (DN) in Active Directory. It validates the structure of a DN which typically consists of Common Name (CN), Organizational Unit (OU), and Domain Component (DC) components.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-IsDistinguishedName -Identity "CN=John Doe,OU=Users,DC=example,DC=com"
This example checks if the given string is a valid Distinguished Name format.
```

---

### Parameters
#### **Identity**
Specifies the string to be tested as a Distinguished Name (DN).

|Type      |Required|Position|PipelineInput                 |Aliases                 |
|----------|--------|--------|------------------------------|------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|DN<br/>DistinguishedName|

---

### Notes
Original source: https://github.com/PsCustomObject/IT-ToolBox/blob/master/Public/Test-IsValidDn.ps1

---

### Syntax
```PowerShell
Test-IsDistinguishedName [-Identity] <String> [<CommonParameters>]
```
