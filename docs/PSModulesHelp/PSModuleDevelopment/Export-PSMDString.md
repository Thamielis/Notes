Export-PSMDString
-----------------

### Synopsis
Parses a module that uses the PSFramework localization feature for strings and their value.

---

### Description

Parses a module that uses the PSFramework localization feature for strings and their value.
This command can be used to generate and update the language files used by the module.
It is also used in automatic tests, ensuring no abandoned string has been left behind and no key is unused.

---

### Examples
> EXAMPLE 1

```PowerShell
Export-PSMDString -ModuleRoot 'C:\Code\Github\MyModuleProject\MyModule'
Generates the strings data for the MyModule module.
```

---

### Parameters
#### **ModuleRoot**
The root of the module to process.
Must be the root folder where the psd1 file is stored in.

|Type      |Required|Position|PipelineInput                 |Aliases   |
|----------|--------|--------|------------------------------|----------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|ModuleBase|

---

### Syntax
```PowerShell
Export-PSMDString [-ModuleRoot] <String> [<CommonParameters>]
```
