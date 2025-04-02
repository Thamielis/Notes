New-PSAdapter
-------------

### Synopsis
Creates a new PowerShell Adapter

---

### Description

Creates a new PowerShell Adapter.

Adapters allow you to adapt anything into a PowerShell command.

---

### Parameters
#### **Template**
The template name, or a command.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |1       |true (ByPropertyName)|

#### **TemplateArgument**
Any arguments to pass to the template

|Type          |Required|Position|PipelineInput        |Aliases                           |
|--------------|--------|--------|---------------------|----------------------------------|
|`[PSObject[]]`|false   |2       |true (ByPropertyName)|TemplateArguments<br/>TemplateArgs|

#### **TemplateParameter**
Any parameters to pass to the template

|Type           |Required|Position|PipelineInput        |Aliases           |
|---------------|--------|--------|---------------------|------------------|
|`[IDictionary]`|false   |3       |true (ByPropertyName)|TemplateParameters|

#### **Namespace**
The namespace for the adapter.
If this is not provided, it will use the name of the current repository.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **OutputPath**
The output path for the adapter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

---

### Syntax
```PowerShell
New-PSAdapter [[-Template] <PSObject>] [[-TemplateArgument] <PSObject[]>] [[-TemplateParameter] <IDictionary>] [[-Namespace] <String>] [[-OutputPath] <String>] [<CommonParameters>]
```
