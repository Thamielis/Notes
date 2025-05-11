ConvertFrom-GPPrefPassword
--------------------------

### Synopsis
Decodes a password from the format used by Group Policy Preferences.

---

### Description

{{Fill in the Description}}

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/ConvertFrom-GPPrefPassword.md)

---

### Examples
> Example 1

```PowerShell
PS C:\> {{ Add example code here }}
{{ Add example description here }}
```

---

### Parameters
#### **EncryptedPassword**
Provide an encrypted password from a Group Policy Preferences XML file.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |0       |True (ByValue)|

---

### Inputs
System.String

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
ConvertFrom-GPPrefPassword [-EncryptedPassword] <String> [<CommonParameters>]
```
