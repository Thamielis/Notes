Get-ChangelogData
-----------------

### Synopsis
Takes a changelog in Keep a Changelog 1.0.0 format and parses the data into a PowerShell object.

---

### Description

Takes a changelog in Keep a Changelog 1.0.0 format and parses the data into a PowerShell object.

---

### Related Links
* [https://github.com/natescherer/ChangelogManagement](https://github.com/natescherer/ChangelogManagement)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChangelogData
Returns an object containing Header, Unreleased, Released, Footer, and LastVersion properties.
```

---

### Parameters
#### **Path**
Path to the changelog; defaults to ".\CHANGELOG.md"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
This cmdlet does not accept pipeline input.

---

### Outputs
* This cmdlet outputs a PSCustomObject containing the changelog data.

---

### Syntax
```PowerShell
Get-ChangelogData [[-Path] <String>] [<CommonParameters>]
```
