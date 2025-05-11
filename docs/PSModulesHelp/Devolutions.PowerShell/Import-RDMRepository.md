Import-RDMRepository
--------------------

### Synopsis
Import vaults contained in a rdx file in the current data source

---

### Description

Import vaults contained in a rdx file in the current data source. If the file is protected, the parameter Password must be used to unlock the data contained. By default, all entries will have their ID changedd. This is to avoid unwanted behaviors, such as moving an entry if imported in the same database. The Duplicate parameter indicates the action (ignore, overwrite, add) to apply in presence of duplicated entries.
    A limitation of the command is the inability to map the imported vaults to a specific one. Each vault will be assigned to an existing one with the same ID or the same name, or a new one if none are found.
    This command is only available for an administrator on an advanced data source.

---

### Related Links
* [Export-RDMRepository](Export-RDMRepository)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $pwd = Read-Host -AsSecureString;
    Import-RDMRepository -Path myFile.rdx -Password $pwd
Import all vaults in 'myFile.rdx'. The protected file is unlocked with the parameter $pwd.
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
#### **Duplicate**
Action to apply to the imported entries in case of a duplicate. If the KeepID switch is not present, no duplicate will be found. By default, all duplicates will be ignored.
Valid Values:

* Cancel
* Ignore
* IgnoreAll
* Overwrite
* OverwriteAll
* Add
* AddAll

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[DuplicateAction]`|false   |named   |false        |

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

#### **KeepID**
Keep all imported connections' ID. This is can cause unwanted behaviors, such as moving an entry if imported in the same database.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Password**
Unlock the data contained in the protected file.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|false   |named   |false        |

#### **Path**
Path where the file containing the exported vaults will be saved. The extension must be '.rdx'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Import-RDMRepository -detailed". For technical information, type "Get-Help Import-RDMRepository -full".

---

### Syntax
```PowerShell
Import-RDMRepository [-Path] <String> [-Password <SecureString>] [-Duplicate <IgnoreAll | OverwriteAll | AddAll>] [-KeepID] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
