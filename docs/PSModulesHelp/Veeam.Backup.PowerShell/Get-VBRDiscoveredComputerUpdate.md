Get-VBRDiscoveredComputerUpdate
-------------------------------

### Synopsis
Returns available Veeam Agent private fixes.

---

### Description

This cmdlet returns the list of available Veeam Agent private fixes.
You can get all available private fixes or search for instances directly by the issue number or version.

---

### Examples
> Example 1. Returning All Available Private Fixes

```PowerShell
Get-VBRDiscoveredComputerUpdate
This command returns all available private fixes.
```
> Example 2. Returning Private Fixes by Issue Number

```PowerShell
Get-VBRProtectionGroup -Id 188235
This command returns private fixes by the issue number.
```
> Example 3. Returning Private Fixes by Version Number

```PowerShell
Get-VBRProtectionGroup -AgentVersion 2.1
This command returns private fixes by the major and minor version numbers.
```
> Example 4. Returning Private Fixes by Version, Build and Revision Numbers

```PowerShell
Get-VBRProtectionGroup -AgentVersion 2.1.10.304
This command returns private fixes by the major and minor version numbers, the build number and the revision number.
```

---

### Parameters
#### **AgentVersion**
Specifies the version of the private fix.
The cmdlet will return private fixes of this version.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Version]`|false   |named   |True (ByPropertyName)|

#### **Id**
Specifies the issue number of the private fix. The cmdlet will return private fixes with this number.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[UInt64]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.UInt64

System.Version

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRDiscoveredComputerUpdate [-AgentVersion <Version>] [-Id <UInt64>] [<CommonParameters>]
```
