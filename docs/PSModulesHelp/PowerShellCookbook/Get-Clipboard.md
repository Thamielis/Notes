Get-Clipboard
-------------

### Synopsis
Gets the contents of the clipboard.

---

### Description

> This cmdlet is not supported on macOS. The `Get-Clipboard` cmdlet gets the contents of the clipboard as text. Multiple lines of text are returned as an array of strings similar to `Get-Content`.

> [!NOTE] > On Linux, this cmdlet requires the `xclip` utility to be in the path.

---

### Related Links
* [Online Version:](https://learn.microsoft.com/powershell/module/microsoft.powershell.management/get-clipboard?view=powershell-7.3&WT.mc_id=ps-gethelp)

* [Set-Clipboard](Set-Clipboard)

---

### Examples
> Example 1: Get the content of the clipboard and display it to the command-line

```PowerShell
Get-Clipboard

hello
```

---

### Parameters
#### **Raw**
Gets the entire contents of the clipboard. Multiline text is returned as a single multiline string rather than an array of strings.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

---

### Inputs
None

You can't pipe objects to this cmdlet.

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
PowerShell includes the following aliases for `Get-Clipboard`:

- All platforms:   - `gcb`

---

### Syntax
```PowerShell
Get-Clipboard [-Raw] [<CommonParameters>]
```
