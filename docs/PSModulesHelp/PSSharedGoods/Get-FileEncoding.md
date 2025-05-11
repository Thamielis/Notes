Get-FileEncoding
----------------

### Synopsis
Get the encoding of a file (ASCII, UTF8, UTF8BOM, Unicode, BigEndianUnicode, UTF7)

---

### Description

Get the encoding of a file (ASCII, UTF8, UTF8BOM, Unicode, BigEndianUnicode, UTF7).
Encoding is determined by the first few bytes of the file or by the presence of non-ASCII characters.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FileEncoding -Path 'C:\Users\pklys\Desktop\test.txt'
```

---

### Parameters
#### **Path**
Path to the file to check

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-FileEncoding [-Path] <String> [<CommonParameters>]
```
