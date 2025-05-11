Get-ClassBasedResourceName
--------------------------

### Synopsis
Get the Names of the Class-based DSC Resources defined in a file using AST.

---

### Description

This command returns all Class-based Resource Names in a file,
by parsing the file and looking for classes with the [DscResource()] attribute.

For MOF-based DSC Resources, look at the `Get-MofSchemaName` function.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ClassBasedResourceName -Path source/Classes/MyDscResource.ps1
Get-ClassBasedResourceName -Path (Join-Path -Path (Get-Module MyResourceModule).ModuleBase -ChildPath (Get-Module MyResourceModule).RootModule)
```

---

### Parameters
#### **Path**
Path of the file to parse and search the Class-Based DSC Resources.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |1       |false        |FilePath|

---

### Outputs
* [String[]](https://learn.microsoft.com/en-us/dotnet/api/System.String[])

---

### Syntax
```PowerShell
Get-ClassBasedResourceName [-Path] <String> [<CommonParameters>]
```
