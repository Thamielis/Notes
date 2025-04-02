Get-VBRProtectionGroupUnixPackage
---------------------------------

### Synopsis
Returns Veeam Agents for Unix packages.

---

### Description

This cmdlet returns Veeam Agents for Unix packages.

---

### Examples
> Getting all Veeam Agents for Unix Packages

```PowerShell
Get-VBRProtectionGroupLinuxPackage
This command returns an array of all Veeam Agents for Unix packages.
```

---

### Parameters
#### **Name**
Specifies a name of the Veeam Agents for Unix package. The cmdlet will return Unix packages with this name.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRProtectionGroupUnixPackage [-Name <String>] [<CommonParameters>]
```
