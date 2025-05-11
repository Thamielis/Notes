New-DynamicVariable
-------------------

### Synopsis
Creates a variable that supports scripted actions for its getter and setter

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
.\New-DynamicVariable GLOBAL:WindowTitle `
     -Getter { $host.UI.RawUI.WindowTitle } `
     -Setter { $host.UI.RawUI.WindowTitle = $args[0] }
PS > $windowTitle
Administrator: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
PS > $windowTitle = "Test"
PS > $windowTitle
Test
```

---

### Parameters
#### **Name**
The name for the dynamic variable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Getter**
The scriptblock to invoke when getting the value of the variable

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |2       |false        |

#### **Setter**
The scriptblock to invoke when setting the value of the variable

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-DynamicVariable [-Name] <Object> [-Getter] <ScriptBlock> [[-Setter] <ScriptBlock>] [<CommonParameters>]
```
