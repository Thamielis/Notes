Get-PSDependScript
------------------

### Synopsis
Get dependency types and associated scripts

---

### Description

Get dependency types and associated scripts

Checks PSDependMap.psd1,
verifies dependency scripts exist,
returns a hashtable of these.

---

### Related Links
* [about_PSDepend](about_PSDepend)

* [about_PSDepend_Definitions](about_PSDepend_Definitions)

* [Get-Dependency](Get-Dependency)

* [Get-PSDependType](Get-PSDependType)

* [Install-Dependency](Install-Dependency)

* [Invoke-PSDepend](Invoke-PSDepend)

* [https://github.com/RamblingCookieMonster/PSDepend](https://github.com/RamblingCookieMonster/PSDepend)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSDependScript
# List PSDepend scripts available in the PSDependMap.psd1 in the PSDepend module root
```
> EXAMPLE 2

```PowerShell
Get-PSDependScript -Path \\Path\To\Central.DependencyMap.psd1
# List dependency types defined in a centralized dependency map
```

---

### Parameters
#### **Path**
Path to PSDependMap.psd1 defining dependency types
Defaults to PSDependMap.psd1 in the module root

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-PSDependScript [[-Path] <String>] [<CommonParameters>]
```
