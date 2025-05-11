Get-PrivateProfileString
------------------------

### Synopsis
Retrieves an element from a standard .INI file

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PrivateProfileString c:\windows\system32\tcpmon.ini `
    "<Generic Network Card>" Name
Generic Network Card
```

---

### Parameters
#### **Path**
The INI file to retrieve

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Category**
The section to retrieve from

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Key**
The item to retrieve

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
Get-PrivateProfileString [[-Path] <Object>] [[-Category] <Object>] [[-Key] <Object>] [<CommonParameters>]
```
