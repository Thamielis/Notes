Get-PSOneClipboardListenerStatus
--------------------------------

### Synopsis
Gets information from the background thread that monitors the clipboard

---

### Description

Outputs the current content of the shared hashtable that always returns the current state of the clipboard monitor
This information can be used for debugging and to better understand how the clipboard monitor works

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ClipboardListenerStatus
returns the current state of the clipboard monitor
```

---

### Syntax
```PowerShell
Get-PSOneClipboardListenerStatus [<CommonParameters>]
```
