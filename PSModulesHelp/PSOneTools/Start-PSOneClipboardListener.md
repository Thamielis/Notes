Start-PSOneClipboardListener
----------------------------

### Synopsis
Monitors the clipboard, and when new valid PowerShell code is detected, opens the code in an editor

---

### Description

Uses a background thread to monitor the clipboard. If new valid PowerShell code is detected, an action is invoked. The action depends on the editor used, and opens the clipboard code in an editor window

---

### Related Links
* [https://powershell.one](https://powershell.one)

---

### Examples
> EXAMPLE 1

```PowerShell
Start-PSOneClipboardListener
Starts the background clipboard monitor
```

---

### Notes
Anything that is copied to the clipboard can trigger the monitor, so make sure you turn off the monitor once you are done.

---

### Syntax
```PowerShell
Start-PSOneClipboardListener [<CommonParameters>]
```
