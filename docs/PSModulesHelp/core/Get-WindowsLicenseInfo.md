Get-WindowsLicenseInfo
----------------------

### Synopsis
Get the license status of a Windows computer

---

### Description

Gets the license details via SLMGR.vbs /dlv

---

### Examples
> EXAMPLE 1

```PowerShell
Get-WindowsLicenseInfo
Returns the license details of the local computer
```
> EXAMPLE 2

```PowerShell
Get-WindowsLicenseInfo -ComputerName computer01.domain.com
Returns the license details of the computer
```

---

### Parameters
#### **ComputerName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Credential**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-WindowsLicenseInfo [[-ComputerName] <String>] [[-Credential] <PSCredential>] [<CommonParameters>]
```
