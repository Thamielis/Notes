Get-PSDependType
----------------

### Synopsis
Get dependency types and related information

---

### Description

Get dependency types and related information

Checks PSDependMap.psd1 for dependency types,
verifies dependency scripts exist,
gets help content for dependency scripts,
returns various info on each dependency type

---

### Related Links
* [about_PSDepend](about_PSDepend)

* [about_PSDepend_Definitions](about_PSDepend_Definitions)

* [Get-Dependency](Get-Dependency)

* [Get-PSDependScript](Get-PSDependScript)

* [Install-Dependency](Install-Dependency)

* [Invoke-PSDepend](Invoke-PSDepend)

* [https://github.com/RamblingCookieMonster/PSDepend](https://github.com/RamblingCookieMonster/PSDepend)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSDependType -DependencyType PSGalleryModule -ShowHelp
Show help for the PSGalleryModule dependency type.
```
> EXAMPLE 2

```PowerShell
Get-PSDependType
# List dependency types defined in PSDependMap.psd1 in the root of your PSDepend module folder
```
> EXAMPLE 3

```PowerShell
Get-PSDependType -Path \\Path\To\Central.DependencyMap.psd1
# List dependency types defined in a centralized dependency map
```

---

### Parameters
#### **DependencyType**
Optionally limited to this DependencyType
Accepts wildcards

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Path**
Path to PSDependMap.psd1 defining dependency types
Defaults to PSDependMap.psd1 in the module root

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **ShowHelp**
Show help content for specified dependency types

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipHelp**
Skip retreieving help. Mainly for internl use when it is not required

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-PSDependType [[-DependencyType] <String>] [[-Path] <String>] [-ShowHelp] [-SkipHelp] [<CommonParameters>]
```
