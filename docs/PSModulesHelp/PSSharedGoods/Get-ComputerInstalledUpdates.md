Get-ComputerInstalledUpdates
----------------------------

### Synopsis
This function retrieves the history of updates installed on a computer or multiple computers.

---

### Description

The `Get-ComputerInstalledUpdates` function uses the Windows Update Agent API to query the history of updates installed on a computer. It returns a list of updates with details such as the KB number, installation date, update type, version, and more.

---

### Examples
Get all updates installed on the current computer

```PowerShell
Get-ComputerInstalledUpdates
```
Get all 'Windows Update' type updates installed on the computer 'Computer1'

```PowerShell
Get-ComputerInstalledUpdates -ComputerName 'Computer1' -IncludeType 'WindowsUpdate'
```
Get all updates except 'Antivirus' type updates installed on the computers 'Computer1' and 'Computer2'

```PowerShell
Get-ComputerInstalledUpdates -ComputerName 'Computer1', 'Computer2' -ExcludeType 'Antivirus'
```
Search for a specific KB number on the current computer

```PowerShell
Get-ComputerInstalledUpdates -SearchKB 'KB123456'
```

---

### Parameters
#### **ComputerName**
An array of computer names. The default value is the name of the current computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **IncludeType**
An array of update types to include in the results. Valid values are 'Antivirus', 'CumulativeUpdate', 'WindowsUpdate', 'ServicingStackUpdate', and 'Other'.
Valid Values:

* Antivirus
* CumulativeUpdate
* WindowsUpdate
* ServicingStackUpdate
* Other

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ExcludeType**
An array of update types to exclude from the results. Valid values are the same as for `IncludeType`.
Valid Values:

* Antivirus
* CumulativeUpdate
* WindowsUpdate
* ServicingStackUpdate
* Other

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **SearchKB**
A string to search for in the KB numbers of the updates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Credential**
A PSCredential object to use when connecting to the computers.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |5       |false        |

---

### Notes
This function uses the COM interface of the Windows Update Agent API, which requires administrative privileges. If you run this function without administrative privileges, it may not return all updates.

---

### Syntax
```PowerShell
Get-ComputerInstalledUpdates [[-ComputerName] <String[]>] [[-IncludeType] <String[]>] [[-ExcludeType] <String[]>] [[-SearchKB] <String>] [[-Credential] <PSCredential>] [<CommonParameters>]
```
