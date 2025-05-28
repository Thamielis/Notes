Log-Warning
-----------

### Synopsis
Creates a warning message and prints the message to the log. 
You can optionally provide a filename, line number, and column number where the warning occurred.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Log-Warning -Message "Missing semicolon" -FileName "foo.js" -Line 10 -Column 5
```

---

### Parameters
#### **Message**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **FileName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Line**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **Column**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

---

### Syntax
```PowerShell
Log-Warning -Message <String> -FileName <String> -Line <Int32> -Column <Int32> [<CommonParameters>]
```
```PowerShell
Log-Warning -Message <String> [<CommonParameters>]
```
