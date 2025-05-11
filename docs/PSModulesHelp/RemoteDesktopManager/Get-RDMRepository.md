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
|`[Switch]`|false   |1       |false        |

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
Get-RDMRepository [[-CaseSensitive]] [[-Name] <String>] [<CommonParameters>]
```
