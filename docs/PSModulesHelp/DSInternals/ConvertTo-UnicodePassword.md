ConvertTo-UnicodePassword
-------------------------

### Synopsis
Converts a password to the format used in unattend.xml or *.ldif files.

---

### Description

{{Fill in the Description}}

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/ConvertTo-UnicodePassword.md)

---

### Examples
> Example 1

```PowerShell
PS C:\> {{ Add example code here }}
{{ Add example description here }}
```

---

### Parameters
#### **IsUnattendPassword**
Indicates that the result should be in the format for unattend.xml instead of *.ldif.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies a password that will be converted to the specifiet format.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |0       |False        |

---

### Inputs
None

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
ConvertTo-UnicodePassword [-Password] <SecureString> [-IsUnattendPassword] [<CommonParameters>]
```
