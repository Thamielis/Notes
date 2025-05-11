Copy-Module
-----------

### Synopsis
Copies a PowerShell module to a different location on the file system.

---

### Description

Copies a PowerShell module either to the standard system repository location
or copies it to a custom location.
Using the standard system repository (the default action)
makes cmdlets automatically available in a PowerShell session,
as well as making the cmdlets available for explicit import with just the name
of the module, e.g. "Import-Module Your.PowerShell.Module.

* The module manifest (.psd1) specifies which files will be installed.
* All files required by the module must sit in the same directory as the module manifest and DLL (if a compiled module).
* The module directory must be the same name as the module manifest base name.

---

### Examples
> EXAMPLE 1

```PowerShell
Copy-Module Acme.Admin.PowerShell
Copies module to C:\Windows\System32\WindowsPowerShell\v1.0\Modules.
```
> EXAMPLE 2

```PowerShell
Copy-Module -Name Acme.Admin.PowerShell -Dest C:\temp
Copies module to specified directory.
```

---

### Parameters
#### **Name**
Name of the PowerShell module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Destination**
Specifies the path to the new location if supplied. Otherwise,
uses the standard system location.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Inputs
None.

---

### Outputs
* None.

---

### Syntax
```PowerShell
Copy-Module [-Name] <String> [[-Destination] <String>] [<CommonParameters>]
```
