Use-Schematic
-------------

### Synopsis
Uses a schematic to put things together

---

### Description

Uses a schematic to automate the deployment

---

### Related Links
* [ConvertTo-ModuleService](ConvertTo-ModuleService)

---

### Parameters
#### **SchematicName**
The name of the schematic

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ModuleName**
The name of the module that the schematic will be used on.  
This will also determine the default input and output directories

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |2       |true (ByPropertyName)|Name   |

#### **Parameter**
Parameters to the schematic.  
These will be merged with any parameters provided from the module.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |3       |true (ByPropertyName)|

#### **Manifest**
A complete pipeworks manifest.
This will be merged with the pipeworks manifest from the module, if a module is provided

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |4       |true (ByPropertyName)|

#### **InputDirectory**
A custom output directory.  
This will override the default module output directory (the module path).
If no module is provided, the current directory will be used as the input directory.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **OutputDirectory**
A custom output directory.  
This will override the default module output directory (\inetpub\wwwroot\ModuleName)
If no module is provided, the output directory will default to \inetpub\wwwroot

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

---

### Syntax
```PowerShell
Use-Schematic [-SchematicName] <String> [[-ModuleName] <String>] [[-Parameter] <Hashtable>] [[-Manifest] <Hashtable>] [[-InputDirectory] <String>] [[-OutputDirectory] <String>] [<CommonParameters>]
```
