Get-PSMDTemplate
----------------

### Synopsis
Search for templates to create from.

---

### Description

Search for templates to create from.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDTemplate
Returns all templates
```
> EXAMPLE 2

```PowerShell
Get-PSMDTemplate -TemplateName module
Returns the latest version of the template named module.
```

---

### Parameters
#### **TemplateName**
The name of the template to search for.
Templates are filtered by this using wildcard comparison.
Defaults to "*" (everything).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Store**
The template store to retrieve tempaltes from.
By default, all stores are queried.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Path**
Instead of a registered store, look in this path for templates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Tags**
Only return templates with the following tags.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Author**
Only return templates by this author.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MinimumVersion**
Only return templates with at least this version.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |named   |false        |

#### **RequiredVersion**
Only return templates with exactly this version.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |named   |false        |

#### **All**
Return all versions found.
By default, only the latest matching version of a template will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-PSMDTemplate [[-TemplateName] <String>] [-Store <String>] [-Tags <String[]>] [-Author <String>] [-MinimumVersion <Version>] [-RequiredVersion <Version>] [-All] [-EnableException] [<CommonParameters>]
```
```PowerShell
Get-PSMDTemplate [[-TemplateName] <String>] -Path <String> [-Tags <String[]>] [-Author <String>] [-MinimumVersion <Version>] [-RequiredVersion <Version>] [-All] [-EnableException] [<CommonParameters>]
```
