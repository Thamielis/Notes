Add-ObjectCollector
-------------------

### Synopsis
Adds a new Out-Default command wrapper to store up to 500 elements from
the previous command. This wrapper stores output in the $ll variable.

---

### Description

---

### Examples
> EXAMPLE 1

Get-Command $pshome\powershell.exe
CommandType     Name                          Definition
-----------     ----                          ----------
Application     powershell.exe                C:\Windows\System32\Windo...

PS > $ll.Definition
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe

---

### Notes
This command builds on New-CommandWrapper, also included in the Windows
PowerShell Cookbook.

---

### Syntax
```PowerShell
Add-ObjectCollector [<CommonParameters>]
```
