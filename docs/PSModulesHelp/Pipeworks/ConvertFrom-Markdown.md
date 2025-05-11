ConvertFrom-Markdown
--------------------

### Synopsis
Convert the contents of a string or a file to a MarkdownInfo object.

---

### Description

This cmdlet converts the specified content into a MarkdownInfo . When a file path is specified for the Path parameter, the contents on the file are converted. The output object has three properties:

- The Token property has the abstract syntax tree (AST) of the converted object - The Html property has the HTML conversion of the specified input - The VT100EncodedString property has the converted string with ANSI (VT100) escape sequences if   the AsVT100EncodedString parameter was specified

This cmdlet was introduced in PowerShell 6.1.

---

### Related Links
* [Online Version:](https://learn.microsoft.com/powershell/module/microsoft.powershell.utility/convertfrom-markdown?view=powershell-7.3&WT.mc_id=ps-gethelp)

* [Markdown Parser](https://github.com/lunet-io/markdig)

* [ANSI escape code](https://wikipedia.org/wiki/ANSI_escape_code)

---

### Examples
> Example 1: Convert a file containing Markdown content to HTML

```PowerShell
ConvertFrom-Markdown -Path .\README.md
The MarkdownInfo object is returned. The Tokens property has the AST of the converted content of the `README.md` file. The Html property has the HTML converted content of the `README.md` file.
```
> Example 2: Convert a file containing Markdown content to a VT100-encoded string

```PowerShell
ConvertFrom-Markdown -Path .\README.md -AsVT100EncodedString
The MarkdownInfo object is returned. The Tokens property has the AST of the converted content of the `README.md` file. The VT100EncodedString property has the VT100-encoded string converted content of the `README.md` file.
```
> Example 3: Convert input object containing Markdown content to a VT100-encoded string

```PowerShell
Get-Item .\README.md | ConvertFrom-Markdown -AsVT100EncodedString
The MarkdownInfo object is returned. The FileInfo object from `Get-Item` is converted to a VT100-encoded string. The Tokens property has the AST of the converted content of the `README.md` file. The VT100EncodedString property has the VT100-encoded string converted content of the `README.md` file.
```
> Example 4: Convert a string containing Markdown content to a VT100-encoded string

```PowerShell
"**Bold text**" | ConvertFrom-Markdown -AsVT100EncodedString
The MarkdownInfo object is returned. The specified string ` Bold text ` is converted to a VT100-encoded string and available in VT100EncodedString property.
```

---

### Parameters
#### **AsVT100EncodedString**
Specifies if the output should be encoded as a string with VT100 escape codes.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

#### **InputObject**
Specifies the object to be converted. When an object of type System.String is specified, the string is converted. When an object of type System.IO.FileInfo is specified, the contents of the file specified by the object are converted. Objects of any other type result in an error.

|Type                                     |Required|Position|PipelineInput |
|-----------------------------------------|--------|--------|--------------|
|`[System.Management.Automation.PSObject]`|true    |named   |True (ByValue)|

#### **LiteralPath**
Specifies a path to the file to be converted.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[System.String[]]`|true    |named   |False        |

#### **Path**
Specifies a path to the file to be converted.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[System.String[]]`|true    |0       |False        |

---

### Inputs
System.Management.Automation.PSObject

---

### Outputs
* Microsoft.PowerShell.MarkdownRender.MarkdownInfo

---

### Notes

---

### Syntax
```PowerShell
ConvertFrom-Markdown [-AsVT100EncodedString] -InputObject <System.Management.Automation.PSObject> [<CommonParameters>]
```
```PowerShell
ConvertFrom-Markdown [-AsVT100EncodedString] -LiteralPath <System.String[]> [<CommonParameters>]
```
```PowerShell
ConvertFrom-Markdown [-Path] <System.String[]> [-AsVT100EncodedString] [<CommonParameters>]
```
