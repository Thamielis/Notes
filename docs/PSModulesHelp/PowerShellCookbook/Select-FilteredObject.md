Select-FilteredObject
---------------------

### Synopsis
Provides an inteactive window to help you select complex sets of objects.
To do this, it takes all the input from the pipeline, and presents it in a
notepad window.  Keep any lines that represent objects you want to retain,
delete the rest, then save the file and exit notepad.

The script then passes the original objects that you kept along the
pipeline.

---

### Description

---

### Examples
> EXAMPLE 1

Get-Process | Select-FilteredObject | Stop-Process -WhatIf
Gets all of the processes running on the system, and displays them to you.
After you've selected the ones you want to stop, it pipes those into the
Stop-Process cmdlet.

---

### Syntax
```PowerShell
Select-FilteredObject [<CommonParameters>]
```
