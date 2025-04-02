Get-RDMTemplate
---------------

### Synopsis
Retrieve the list of available templates.

---

### Description

Retrieve the list of available templates. The current selected template is marked with an "X".

---

### Related Links
* [Set-RDMDataSource](Set-RDMDataSource)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMTemplate
Retrieves the list of available templates.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMTemplate; $list[0]
Retrieves the list of available templates and displays the first item.
```

---

### Parameters
#### **Type**
Type of templates
Valid Values:

* Both
* Local
* Shared

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-RDMTemplate -detailed". For technical information, type "Get-Help Get-RDMTemplate -full".

---

### Syntax
```PowerShell
Get-RDMTemplate [[-Type] <String>] [<CommonParameters>]
```
