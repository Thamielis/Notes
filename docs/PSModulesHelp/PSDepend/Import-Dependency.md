Import-Dependency
-----------------

### Synopsis
Import a specific dependency

---

### Description

Import a specific dependency, if that dependency supports it.

Takes output from Get-Dependency

  * Runs dependency scripts depending on each dependencies type.
  * Imports items if supported

See Get-Help about_PSDepend for more information.

---

### Related Links
* [about_PSDepend](about_PSDepend)

* [about_PSDepend_Definitions](about_PSDepend_Definitions)

* [Get-Dependency](Get-Dependency)

* [Get-PSDependType](Get-PSDependType)

* [Invoke-PSDepend](Invoke-PSDepend)

* [https://github.com/RamblingCookieMonster/PSDepend](https://github.com/RamblingCookieMonster/PSDepend)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Dependency -Path C:\requirements.psd1 | Import-Dependency
Get dependencies from C:\requirements.psd1 and import them
```

---

### Parameters
#### **Dependency**
Dependency object from Get-Dependency.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |named   |true (ByValue)|

#### **PSDependTypePath**
Specify a PSDependMap.psd1 file that maps DependencyTypes to their scripts.
This defaults to the PSDependMap.psd1 in the PSDepend module folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Tags**
Only test dependencies that are tagged with all of the specified Tags (-and, not -or)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Syntax
```PowerShell
Import-Dependency -Dependency <PSObject[]> [-PSDependTypePath <String>] [-Tags <String[]>] [<CommonParameters>]
```
