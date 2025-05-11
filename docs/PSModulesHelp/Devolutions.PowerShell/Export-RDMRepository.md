Export-RDMRepository
--------------------

### Synopsis
Export vaults of the current data source in a rdx file.

---

### Description

Export vaults of the current data source in a rdx file. To protect the file, the parameter Password must be used. By default, if the file exists in the specified path, it will be overwritten. The NoClobber switch must be used to avoid this behavior.
    This command is only available for an administrator on an advanced data source.

---

### Related Links
* [Import-RDMRepository](Import-RDMRepository)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $pwd = Read-Host -AsSecureString;
    Export-RDMRepository -Name Vault* -Path myFile.rdx -Password $pwd -RemoveAllFolders
Export all vaults whose name start with 'Vault' in 'myFile.rdx'. The file is protected with the parameter $pwd. All folders are not exported. The entries will all be at the root level.
```
> EXAMPLE 2

```PowerShell
PS C:\> $filePath = 'C:\my\path\filename.rdx';
    Export-RDMRepository -Name VaultA, VaultB, VaultC -Path $path -IncludeAttachments -IncludeCredentials -IncludeDocumentation;
    Get-RDMDataSource -Name AnotherOne | Set-RDMCurrentDataSource;
    Import-RDMSession -Path myFile.rdx -KeepID -Duplicate IgnoreAll
Export VaultA, VaultB, and VaultC of the current data source in the file specified by $path. Change the current data source to 'AnotherOne' and import all vaults recently exported. With the KeepID switch present, all imported entries will keep their ID. As long as the new data source does not use the same database, no unexpected behaviors will happen.
```

---

### Parameters
#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **ID**
Specifies the ID of the vaults to be exported.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |1       |false        |

#### **IncludeAttachments**
Include attachements and documents in the export

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeCredentials**
Include credentials in the export.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeDocumentation**
Include entry documentation in the export.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeFavorite**
Keep the favorite status.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InputObject**
Specifies the vaults to be exported.

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[PSRepositoryInfo[]]`|true    |1       |true (ByValue)|

#### **LiteralName**
Specifies the name of the vaults to be exported. No characters are interpreted as wildcards.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **Name**
Specifies the name of the vaults to be exported.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **NoClobber**
NoClobber prevents an existing file from being overwritten and displays a message that the file already exists. By default, if a file exists in the specified path, it is overwritten.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Password**
Protect the data with a master key.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |false        |

#### **Path**
Path where the file containing the exported vaults will be saved. The extension must be '.rdx'. If it is not the case, it will be modified to it.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **RemoveAllFolders**
Remove all folders. All other entries will have their group set at the root level.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Export-RDMRepository -detailed". For technical information, type "Get-Help Export-RDMRepository -full".

---

### Syntax
```PowerShell
Export-RDMRepository [-ID] <Guid[]> [-Path] <String> [-Password <SecureString>] [-IncludeAttachments] [-IncludeCredentials] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders] [-NoClobber] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Export-RDMRepository [-InputObject] <PSRepositoryInfo[]> [-Path] <String> [-Password <SecureString>] [-IncludeAttachments] [-IncludeCredentials] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders] [-NoClobber] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Export-RDMRepository [-Name] <String[]> [-Path] <String> [-Password <SecureString>] [-IncludeAttachments] [-IncludeCredentials] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders] [-NoClobber] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Export-RDMRepository [-LiteralName] <String[]> [-Path] <String> [-Password <SecureString>] [-IncludeAttachments] [-IncludeCredentials] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders] [-NoClobber] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
