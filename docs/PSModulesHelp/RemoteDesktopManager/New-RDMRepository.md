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
|`[Switch]`|false   |4       |false        |SetVault|

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
New-RDMRepository [-Name] <String> [[-Description] <String>] [[-IsAllowedOffline] <Boolean>] [[-SetRepository]] [<CommonParameters>]
```
