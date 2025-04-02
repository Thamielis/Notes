Invoke-Elevate
--------------

### Synopsis
Invoke-Elevate [-ScriptBlock] <scriptblock> [-Command <string>] [-NoProfile] [-Persist] [<CommonParameters>]

Invoke-Elevate [-Command] <string> [-ScriptBlock <scriptblock>] [-NoProfile] [-Persist] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Command**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NoProfile**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Persist**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ScriptBlock**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Scriptblock]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
Invoke-Elevate [-ScriptBlock] <Scriptblock> [-Command <String>] [-NoProfile <Switch>] [-Persist <Switch>] [<CommonParameters>]
```
```PowerShell
Invoke-Elevate [-ScriptBlock <Scriptblock>] [-Command] <String> [-NoProfile <Switch>] [-Persist <Switch>] [<CommonParameters>]
```
