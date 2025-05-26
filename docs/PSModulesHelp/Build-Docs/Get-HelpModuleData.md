Get-HelpModuleData
------------------

### Synopsis
Returns an object representation of the help available for the given module.

---

### Description

Returns an object representation of the help available for the given module. This includes the help for each command in the module.

---

### Related Links
* [New-HelpDoc](New-HelpDoc)

---

### Examples
> EXAMPLE 1

Get-HelpModuleData build-docs
Name            : build-docs
Commands        : {@{Name=Add-HelpDocText; Synopsis=
                Add-HelpDocText [-Text] <string> [-HelpDoc] <psobject> [<CommonParameters>]
                Add-HelpDocText [-Text] <string> [-HelpDoc] <psobject> [-H3] [<CommonParameters>]
                Add-HelpDocText [-Text] <string> [-HelpDoc] <psobject> [-H2] [<CommonParameters>]
                …
Returns an object representation of the help available for the given module.

---

### Parameters
#### **Name**
The name of the module to interrogate for help data.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

---

### Syntax
```PowerShell
Get-HelpModuleData [-Name] <String> [<CommonParameters>]
```
