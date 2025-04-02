Get-LoggedOnUser
----------------

### Synopsis
Get-LoggedOnUser [-ComputerName] <string[]> [[-Credential] <pscredential>] [-ShowEmpty] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ComputerName**

|Type               |Required|Position|PipelineInput|Aliases           |
|-------------------|--------|--------|-------------|------------------|
|`[System.String[]]`|false   |named   |False        |Name<br/>IPAddress|

#### **Credential**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[Pscredential]`|false   |named   |False        |

#### **ShowEmpty**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
Get-LoggedOnUser [-ComputerName] <System.String[]> [[-Credential] <Pscredential>] [-ShowEmpty <Switch>] [<CommonParameters>]
```
