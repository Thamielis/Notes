ConvertTo-OperatingSystem
-------------------------

### Synopsis
Allows easy conversion of OperatingSystem, Operating System Version to proper Windows 10 naming based on WMI or AD

---

### Description

Allows easy conversion of OperatingSystem, Operating System Version to proper Windows 10 naming based on WMI or AD

---

### Examples
> EXAMPLE 1

```PowerShell
$Computers = Get-ADComputer -Filter * -Properties OperatingSystem, OperatingSystemVersion | ForEach-Object {
    $OPS = ConvertTo-OperatingSystem -OperatingSystem $_.OperatingSystem -OperatingSystemVersion $_.OperatingSystemVersion
    Add-Member -MemberType NoteProperty -Name 'OperatingSystemTranslated' -Value $OPS -InputObject $_ -Force
    $_
}
$Computers | Select-Object DNS*, Name, SamAccountName, Enabled, OperatingSystem*, DistinguishedName | Format-Table
```
> EXAMPLE 2

```PowerShell
$Registry = Get-PSRegistry -ComputerName 'AD1' -RegistryPath 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
ConvertTo-OperatingSystem -OperatingSystem $Registry.ProductName -OperatingSystemVersion $Registry.CurrentBuildNumber
```

---

### Parameters
#### **OperatingSystem**
Operating System as returned by Active Directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **OperatingSystemVersion**
Operating System Version as returned by Active Directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertTo-OperatingSystem [[-OperatingSystem] <String>] [[-OperatingSystemVersion] <String>] [<CommonParameters>]
```
