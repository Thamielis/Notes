Get-NaToolkitVersion
--------------------

### Synopsis
Returns the executing version of the Data ONTAP PowerShell Toolkit.

---

### Description

Returns the executing version of the Data ONTAP PowerShell Toolkit.  This is intended primarily to allow a script to ensure the Toolkit version is new enough to support the contents of the script.

---

### Examples
> Example 1

Get-NaToolkitVersion
Get the Toolkit version.

Major  Minor  Build  Revision
-----  -----  -----  --------
1      2      0      24

---

### Inputs

---

### Outputs
* [Version](https://learn.microsoft.com/en-us/dotnet/api/System.Version)

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Get-NaToolkitVersion [<CommonParameters>]
```
