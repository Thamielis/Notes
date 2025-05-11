Get-FileEncoding
----------------

### Synopsis
Gets the encoding of a file

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FileEncoding.ps1 .\UnicodeScript.ps1
BodyName          : unicodeFFFE
EncodingName      : Unicode (Big-Endian)
HeaderName        : unicodeFFFE
WebName           : unicodeFFFE
WindowsCodePage   : 1200
IsBrowserDisplay  : False
IsBrowserSave     : False
IsMailNewsDisplay : False
IsMailNewsSave    : False
IsSingleByte      : False
EncoderFallback   : System.Text.EncoderReplacementFallback
DecoderFallback   : System.Text.DecoderReplacementFallback
IsReadOnly        : True
CodePage          : 1201
```

---

### Parameters
#### **Path**
The path of the file to get the encoding of.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-FileEncoding [[-Path] <Object>] [<CommonParameters>]
```
