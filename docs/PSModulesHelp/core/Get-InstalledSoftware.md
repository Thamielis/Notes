Get-InstalledSoftware
---------------------

### Synopsis
Get installed software on the local or remote computer.

---

### Description

Uses the uninstall path to capture installed software. This is safer than using the WMI query, which
checks the integrity upon query, and can often reconfigure, or reset application defaults. This 
function is built to scale, for quick inventory of software across your environment.

---

### Examples
> EXAMPLE 1

```PowerShell
$progs = Get-InstalledPrograms
```
> EXAMPLE 2

```PowerShell
Get-InstalledPrograms | Select-Object -Property DisplayName, Publisher, InstallDate, Version |FT -Auto
```
> EXAMPLE 3

```PowerShell
$swInventory = Get-InstalledSoftware -ComputerName 'cmp1','cmp2',sys3' -Credential $creds | 
Group-Object -Property PSComputerName -AsHashTable -AsString; $swInventory['cmp1']
This will return and object, with all listed computer's installed software. This makes it easy to 
inventory your computers, and verify them later (if you Expot-CliXml, and Compare-Object later). 
This can scale to very large networks
```

---

### Parameters
#### **ComputerName**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Credential**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-InstalledSoftware [[-ComputerName] <String[]>] [[-Credential] <PSCredential>] [<CommonParameters>]
```
