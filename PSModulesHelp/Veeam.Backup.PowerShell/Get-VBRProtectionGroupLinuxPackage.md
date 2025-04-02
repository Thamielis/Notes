Get-VBRProtectionGroupLinuxPackage
----------------------------------

### Synopsis
Returns Veeam Agents for Linux and Unix packages.

---

### Description

This cmdlet returns Veeam Agents for Linux and Unix packages.

---

### Examples
> Example 1. Getting all Veeam Agents for Linux Packages

```PowerShell
Get-VBRProtectionGroupLinuxPackage
This command returns an array of all Veeam Agent for Linux packages.
```
> Example 2. Getting Veeam Agent for Linux Packages

```PowerShell
Get-VBRProtectionGroupLinuxPackage -LinuxDistributionName "debian", "ubuntu" -LinuxPackageBitness X64
This command returns an array of Debian and Ubuntu packages with the X64 operating system version.
```

---

### Parameters
#### **LinuxDistributionName**
Specifies an array of Veeam Agents for Linux packages that you specify for this parameter. The cmdlet will return Linux packages with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **LinuxPackageBitness**
Specifies an operating system version of Veeam Agent for Linux packages. You can specify one of the following types of operating systems:
* X86
* X64
* Unknown
Valid Values:

* X86
* X64
* PPC64le
* Unknown

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[EOSPlatform]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies a name of the Veeam Agent for a Linux package. The cmdlet will return Linux packages with this name.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Type**
Specifies one of the following Linux packages type:
* Standard
* Nosnap
Valid Values:

* Standard
* Nosnap

|Type                        |Required|Position|PipelineInput                 |
|----------------------------|--------|--------|------------------------------|
|`[VBRLinuxAgentPackageType]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

System.String[]

Veeam.Backup.Common.EOSPlatform

Veeam.Backup.PowerShell.Infos.VBRLinuxAgentPackageType

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRProtectionGroupLinuxPackage [-LinuxDistributionName <String[]>] [-LinuxPackageBitness {X86 | X64 | PPC64le | Unknown}] [-Name <String>] [-Type {Standard | Nosnap}] [<CommonParameters>]
```
