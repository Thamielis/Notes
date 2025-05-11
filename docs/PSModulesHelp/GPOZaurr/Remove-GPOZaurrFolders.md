Remove-GPOZaurrFolders
----------------------

### Synopsis
Removes specified GPOZaurr folders and backs them up to a specified path.

---

### Description

This function removes specified GPOZaurr folders based on the provided criteria and backs them up to a specified path. It allows for filtering by folder type, domain, and other parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GPOZaurrFolders -BackupPath "C:\Backups" -BackupDated -Type 'All' -FolderType 'NTFRS' -FolderName "Folder1" -LimitProcessing 10 -Forest "ExampleForest" -ExcludeDomains "Domain1" -IncludeDomains "Domain2" -ExtendedForestInformation $info
Removes GPOZaurr folders of type 'NTFRS' named "Folder1" from all domains in the forest "ExampleForest", backs them up to "C:\Backups" with a timestamp, and limits processing to 10 folders.
```

---

### Parameters
#### **BackupPath**
The path where the GPOZaurr folders will be backed up.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **BackupDated**
Indicates whether the backup path should include a timestamp.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Type**
Specifies the type of folders to remove. Options are 'All', 'Netlogon', or 'Sysvol'.
Valid Values:

* All
* Netlogon
* Sysvol

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **FolderType**
Specifies the type of folders to remove. Options are 'NTFRS' or 'Empty'.
Valid Values:

* NTFRS
* Empty

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **FolderName**
Specifies the name of the folder to remove.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **LimitProcessing**
Limits the number of folders to process.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

#### **Forest**
Specifies the forest to target.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |6       |false        |ForestName|

#### **ExcludeDomains**
Specifies domains to exclude from processing.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |7       |false        |

#### **IncludeDomains**
Specifies domains to include in processing.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |8       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional forest information.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |9       |false        |

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
Remove-GPOZaurrFolders [[-BackupPath] <String>] [-BackupDated] [[-Type] <String[]>] [-FolderType] <String> [[-FolderName] <String[]>] [[-LimitProcessing] <Int32>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
