Get-RDMRepository
-----------------

### Synopsis
Retrieve the list of available repositories.

---

### Description

Retrieve the list of available repositories for the current selected data source.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMRepository
Retrieves the list of available repository.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMRepository; $list[0]
Retrieves the list of available repositories and displays the first item.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMRepository; $list[1].Name = "New Name";Set-RDMRepository $list[1]
Retrieves the list of available respositories, modify the name of the second role, update the repository.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Name**
Repository name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
System.String

Repository name

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMRepository -detailed". For technical information, type "Get-Help Get-RDMRepository -full".

---

### Syntax
```PowerShell
Get-RDMRepository [-CaseSensitive] [[-Name] <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
