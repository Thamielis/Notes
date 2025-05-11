Read-Clipboard
--------------

### Synopsis
Read text from clipboard and pass to either ConvertFrom-Csv or ConvertFrom-Json.
Check out the how to video - https://youtu.be/dv2GOH5sbpA

---

### Description

Read text from clipboard. It can read CSV or JSON. Plus, you can specify the delimiter and headers.

---

### Examples
> EXAMPLE 1

```PowerShell
Read-Clipboard # Detects if the clipboard contains CSV, JSON, or Tab delimited data.
```
> EXAMPLE 2

```PowerShell
Read-Clipboard -Delimiter '|' # Converts data using a pipe delimiter
```
> EXAMPLE 3

```PowerShell
Read-Clipboard -Header 'P1', 'P2', 'P3' # Specify the header columns to be used
```

---

### Parameters
#### **Delimiter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Header**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Syntax
```PowerShell
Read-Clipboard [[-Delimiter] <Object>] [[-Header] <Object>] [<CommonParameters>]
```
