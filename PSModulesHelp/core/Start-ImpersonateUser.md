Start-ImpersonateUser
---------------------

### Synopsis
Start-ImpersonateUser [-ScriptBlock] <scriptblock> [-Username] <string> [[-ComputerName] <string>] [[-Credential] <pscredential>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **ComputerName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Credential**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[Pscredential]`|false   |named   |False        |

#### **ScriptBlock**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Scriptblock]`|false   |named   |False        |

#### **Username**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
Start-ImpersonateUser [-ScriptBlock] <Scriptblock> [-Username] <String> [[-ComputerName] <String>] [[-Credential] <Pscredential>] [<CommonParameters>]
```
