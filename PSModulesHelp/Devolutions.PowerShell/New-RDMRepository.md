New-RDMRepository
-----------------

### Synopsis
Create a new repository instance.

---

### Description

Create a repository instance. The instance has not yet been saved. Assign the result to a variable then call "Set-RDMRepository $s" to save the repository.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $role = New-RDMRepository -Name "New Repository" ;Set-RDMRepository $role
Create & save new repository.
```

---

### Parameters
#### **Description**
Repository description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

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

#### **IsAllowedOffline**
Is repository allowed offline. Default value: True

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |3       |false        |

#### **Name**
New repository name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetRepository**
Save the new repository.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Switch]`|false   |named   |false        |SetVault|

#### **VaultContentType**
Specify the vault content type. Except for Default and Everything, it will restrict which type of entries allowed in the vault.
Valid Values:

* Default
* Everything
* Secrets
* Credentials
* BusinessInformation

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VaultContentType]`|false   |4       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo

---

### Notes
For more information, type "Get-Help New-RDMRepository -detailed". For technical information, type "Get-Help New-RDMRepository -full".

---

### Syntax
```PowerShell
New-RDMRepository [[-Description] <String>] [[-IsAllowedOffline] <Boolean>] [-Name] <String> [[-VaultContentType] <Default | Everything | Secrets | Credentials | BusinessInformation>] [-SetRepository] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
