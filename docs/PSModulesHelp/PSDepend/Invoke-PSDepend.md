Invoke-PSDepend
---------------

### Synopsis
Invoke PSDepend

---

### Description

Invoke PSDepend

Searches for and runs *.depend.psd1 and requirements.psd1 files in the current and nested paths

See Get-Help about_PSDepend for more information.

---

### Related Links
* [about_PSDepend](about_PSDepend)

* [about_PSDepend_Definitions](about_PSDepend_Definitions)

* [Get-Dependency](Get-Dependency)

* [Install-Dependency](Install-Dependency)

* [https://github.com/RamblingCookieMonster/PSDepend](https://github.com/RamblingCookieMonster/PSDepend)

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-PSDepend
# Search for and run *.deploy.psd1 and requirements.psd1 files under the current path
```
> EXAMPLE 2

```PowerShell
Invoke-PSDepend -Path C:\Path\To\require.psd1
# Install dependencies from require.psd1
```
> EXAMPLE 3

```PowerShell
Invoke-PSDepend -Path C:\Requirements -Recurse $False
# Find and run *.depend.psd1 and requirements.psd1 files under C\Requirements (but not subfolders)
```

---

### Parameters
#### **Path**
Path to a specific depend.psd1 file, or to a folder that we recursively search for *.depend.psd1 files
Defaults to the current path

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |1       |true (ByValue, ByPropertyName)|

#### **InputObject**
If specified instead of Path, treat this hashtable as the contents of a dependency file.
For example:
    -InputObject @{
        BuildHelpers = 'latest'
        PSDeploy = 'latest'
        InvokeBuild = 'latest'
    }

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[Hashtable[]]`|false   |1       |true (ByValue, ByPropertyName)|

#### **PSDependTypePath**
Specify a PSDependMap.psd1 file that maps DependencyTypes to their scripts.
This defaults to the PSDependMap.psd1 in the PSDepend module folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Tags**
Only invoke dependencies that are tagged with all of the specified Tags (-and, not -or)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Recurse**
If path is a folder, whether to recursively search for *.depend.psd1 and requirements.psd1 files under that folder
Defaults to $True

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Test**
Run tests for dependencies we find.
Appends a 'DependencyExists' property indicating whether the dependency exists by default
Specify Quiet to simply return $true or $false depending on whether all dependencies exist

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Quiet**
If specified along with Test, we return $true, or $false depending on whether all dependencies were met

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Import**
If the dependency supports it, import it

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Install**
Run the install for a dependency
Default behavior

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
Force dependency, skipping prompts and confirmation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Target**
If specified, override the target in the PSDependOptions or Dependency.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Credentials**
Specifies a hashtable of PSCredentials to use for each dependency that is served from a private feed. The key of the hashtable must match the Credential property value in the dependency.
For example:
@{
    dependency_name = @{
        ...
        Credential = 'PrivatePackage'
        ...
    }
}
-Credentials @{
        PrivatePackage = $privateCredentials
        AnotherPrivatePackage = $morePrivateCredenials
}

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

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
Invoke-PSDepend [[-Path] <String[]>] [-PSDependTypePath <String>] [-Tags <String[]>] [-Recurse <Boolean>] [-Import] [-Install] [-Force] [-Target <String>] [-Credentials <Hashtable>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-PSDepend [[-Path] <String[]>] [-PSDependTypePath <String>] [-Tags <String[]>] [-Recurse <Boolean>] [-Test] [-Quiet] [-Force] [-Target <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-PSDepend [[-InputObject] <Hashtable[]>] [-PSDependTypePath <String>] [-Tags <String[]>] [-Test] [-Quiet] [-Force] [-Target <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-PSDepend [[-InputObject] <Hashtable[]>] [-PSDependTypePath <String>] [-Tags <String[]>] [-Import] [-Install] [-Force] [-Target <String>] [-Credentials <Hashtable>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
