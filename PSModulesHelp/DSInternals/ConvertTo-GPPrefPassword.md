ConvertTo-GPPrefPassword
------------------------

### Synopsis
Converts a password to the format used by Group Policy Preferences.

---

### Description

{{Fill in the Description}}

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/ConvertTo-GPPrefPassword.md)

---

### Examples
> Example 1

```PowerShell
PS C:\> {{ Add example code here }}
{{ Add example description here }}
```

---

### Parameters
#### **Password**
Provide a password in the form of a SecureString.

|Type            |Required|Position|PipelineInput |Aliases|
|----------------|--------|--------|--------------|-------|
|`[SecureString]`|true    |0       |True (ByValue)|p      |

---

### Inputs
System.Security.SecureString

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
ConvertTo-GPPrefPassword [-Password] <SecureString> [<CommonParameters>]
```
