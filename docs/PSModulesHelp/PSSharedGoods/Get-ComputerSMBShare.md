Get-ComputerSMBShare
--------------------

### Synopsis
Retrieves SMB shares information from specified computers.

---

### Description

The Get-ComputerSMBShare function retrieves SMB share information from the specified computers. It can return basic share details or detailed information based on the 'Translated' switch.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerSMBShare -ComputerName "Server01" -Translated
Retrieves detailed translated information about SMB shares from Server01.
```
> EXAMPLE 2

```PowerShell
Get-ComputerSMBShare -ComputerName "Server01", "Server02"
Retrieves basic SMB share information from Server01 and Server02.
```

---

### Parameters
#### **ComputerName**
Specifies the names of the computers from which to retrieve SMB share information.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Translated**
Indicates whether to return detailed translated information about the SMB shares.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerSMBShare [[-ComputerName] <String[]>] [-Translated] [<CommonParameters>]
```
