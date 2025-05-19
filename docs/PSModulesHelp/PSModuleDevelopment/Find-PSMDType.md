Find-PSMDType
-------------

### Synopsis
Searches assemblies for types.

---

### Description

This function searches the currently imported assemblies for a specific type.
It is not inherently limited to public types however, and can search interna just as well.

Can be used to scan for dependencies, to figure out what libraries one needs for a given type and what dependencies exist.

---

### Examples
> EXAMPLE 1

```PowerShell
Find-PSMDType -Name "*String*"
Finds all types whose name includes the word "String"
(This will be quite a few)
```
> EXAMPLE 2

```PowerShell
Find-PSMDType -InheritsFrom System.Management.Automation.Runspaces.Runspace
Finds all types that inherit from the Runspace class
```

---

### Parameters
#### **Name**
Default: "*"
The name of the type to search for.
Accepts wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **FullName**
Default: "*"
The FullName of the type to search for.
Accepts wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Assembly**
Default: (Get-PSMDAssembly)
The assemblies to search. By default, all loaded assemblies are searched.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[Assembly[]]`|false   |3       |true (ByValue)|

#### **Public**
Whether the type to find must be public.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Enum**
Whether the type to find must be an enumeration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Static**
Whether the type to find must be static.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Implements**
Whether the type to find must implement this interface

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **InheritsFrom**
The type must directly inherit from this type.
Accepts wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Attribute**
The type must have this attribute assigned.
Accepts wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

---

### Syntax
```PowerShell
Find-PSMDType [[-Name] <String>] [[-FullName] <String>] [[-Assembly] <Assembly[]>] [-Public] [-Enum] [-Static] [[-Implements] <String>] [[-InheritsFrom] <String>] [[-Attribute] <String>] [<CommonParameters>]
```
