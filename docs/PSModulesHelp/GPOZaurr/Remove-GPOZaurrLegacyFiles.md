Remove-GPOZaurrLegacyFiles
--------------------------

### Synopsis
Removes legacy Group Policy Objects (GPO) files from specified domains.

---

### Description

The Remove-GPOZaurrLegacyFiles function removes legacy GPO files from specified domains. It can back up the files before removal and optionally remove empty folders.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GPOZaurrLegacyFiles -BackupPath "C:\GPOBackups" -BackupDated -RemoveEmptyFolders -Forest "Contoso" -IncludeDomains "Domain1", "Domain2" -ExcludeDomains "Domain3" -LimitProcessing 100
Removes legacy GPO files from the "Contoso" forest for "Domain1" and "Domain2", excluding "Domain3". Backs up files to "C:\GPOBackups" with timestamps and removes empty folders after deletion.
```

---

### Parameters
#### **BackupPath**
Specifies the path where backup files will be stored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **BackupDated**
Indicates whether backup files should be timestamped with the current date and time.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RemoveEmptyFolders**
Indicates whether empty folders should be removed after GPO files are deleted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Forest**
Specifies the forest where the GPO files are located.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |2       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from processing.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Specifies an array of domains to include for processing.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **LimitProcessing**
Specifies the maximum number of GPO files to process.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Remove-GPOZaurrLegacyFiles [[-BackupPath] <String>] [-BackupDated] [-RemoveEmptyFolders] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-LimitProcessing] <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
