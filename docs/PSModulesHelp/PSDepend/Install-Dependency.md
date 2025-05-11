Install-Dependency
------------------

### Synopsis
Install a specific dependency

---

### Description

Install a specific dependency.  Typically you would use Invoke-PSDepend rather than this.

Takes output from Get-Dependency

  * Runs dependency scripts depending on each dependencies type.
  * If a dependency is not found, we continue processing other dependencies.

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
Get-Dependency -Path C:\requirements.psd1 | Install-Dependency
Get dependencies from C:\requirements.psd1 and install them
```

---

### Parameters
#### **Dependency**
Dependency object from Get-Dependency.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|true    |1       |true (ByValue)|

#### **PSDependTypePath**
Specify a PSDependMap.psd1 file that maps DependencyTypes to their scripts.
This defaults to the PSDependMap.psd1 in the PSDepend module folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Tags**
Only invoke dependencies that are tagged with all of the specified Tags (-and, not -or)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **Force**
Force installation, skipping prompts and confirmation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Install-Dependency [-Dependency] <PSObject[]> [[-PSDependTypePath] <String>] [[-Tags] <String[]>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```
