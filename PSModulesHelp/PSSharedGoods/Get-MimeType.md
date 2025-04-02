Get-MimeType
------------

### Synopsis
Get-MimeType function returns the MIME type of a file based on its extension.

---

### Description

This function takes a file name as input and returns the corresponding MIME type based on the file extension.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-MimeType -FileName "example.jpg"
Returns "image/jpeg" as the MIME type for the file "example.jpg".
```
> EXAMPLE 2

```PowerShell
Get-MimeType -FileName "example.png"
Returns "image/png" as the MIME type for the file "example.png".
```

---

### Parameters
#### **FileName**
Specifies the name of the file for which the MIME type needs to be determined.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-MimeType [-FileName] <String> [<CommonParameters>]
```
