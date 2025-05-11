Get-Dependency
--------------

### Synopsis
Read a dependency psd1 file

---

### Description

Read a dependency psd1 file

The resulting object contains these properties
    DependencyFile : Path to psd1 file this dependency is defined in
    DependencyName : Unique dependency name (the key in the psd1 file).  We reserve PSDependOptions for global options.
    DependencyType : Type of dependency.  See Get-PSDependType
    Name           : Name for the dependency
    Version        : Version for the dependency
    Parameters     : Hash table of parameters to pass to dependency script
    Source         : Source for the dependency
    Target         : Target for the dependency
    AddToPath      : If specified and dependency type supports it, add dependency to path (e.g. a module is added to PSModulePath)
    Tags           : One or more tags to categorize or filter dependencies
    DependsOn      : Dependency that must be installed before this
    PreScripts     : One or more paths to PowerShell scripts to run before the dependency
    PostScripts    : One or more paths to PowerShell scripts to run after the dependency
    PSDependOptions: Hash table of global PSDepend options
    Raw            : Raw output for this dependency from the PSD1. May include data outside of standard items above.

These are parsed from dependency PSD1 files as follows:

Simple syntax, intepreted:
    @{
        DependencyName = 'Version'
    }

    With the simple syntax using interpretation:
       * The DependencyName (key) is used as the Name
       * If no DependencyType is specified, we parse the DependencyName to pick a default:
         * We default to GitHub if the DependencyName has a single / (e.g. aaa/bbb)
         * We default to git if the DependencyName has more than one / (e.g. https://gitlab.fqdn/org/some.git)
         * We default to PSGalleryModule in all other cases
       * The Version (value) is a string, and is used as the Version
       * Other properties are set to $null

Simple syntax, with helpers:
    @{
        DependencyType::DependencyName = 'Version'
    }

    With the simple syntax using helpers:
       * The dependency type and dependency name are included in the key (DependencyType::DependencyName, e.g. PSGalleryModule::Pester)
       * The version (value) is a string, and is used as the Version
       * Other properties are set to $null

Advanced syntax:
    @{
        DependencyName = @{
            DependencyType = 'TypeOfDependency'.  # See Get-PSDependType
            Name = 'NameForThisDependency'
            Version = '0.1.0'
            Parameters = @{ Example = 'Value' }  # Optional parameters for the dependency script.
            Source = 'Some source' # Usually optional
            Target = 'Some target' # Usually optional
            AddToPath = $True # Whether to add new dependency to path, if dependency type supports it.
            Tags = 'prod', 'local' # One or more tags to categorize or filter dependencies
            DependsOn = 'Some_Other_DependencyName' # DependencyName that must run before this
            PreScripts = 'C:\script.ps1' # Script(s) to run before this dependency
            PostScripts = 'C:\script2.ps1' # Script(s) to run after this dependency
        }
    }

We use the same default DependencyTypes for this advanced syntax

Global options:
   @{
       PSDependOptions = @{
           Target = 'C:\temp'
       }
       # Supported for:
       #    Parameters
       #    Source
       #    Target
       #    AddToPath
       #    Tags
       #    DependsOn
       #    PreScripts
       #    PostScripts

       # Dependencies use these values as a default, unless you specify them explicitly for a dependency
   }

Note that you can mix these syntax together in the same psd1.

---

### Related Links
* [about_PSDepend](about_PSDepend)

* [about_PSDepend_Definitions](about_PSDepend_Definitions)

* [Get-PSDependScript](Get-PSDependScript)

* [Get-PSDependType](Get-PSDependType)

* [Install-Dependency](Install-Dependency)

* [Invoke-PSDepend](Invoke-PSDepend)

* [https://github.com/RamblingCookieMonster/PSDepend](https://github.com/RamblingCookieMonster/PSDepend)

---

### Parameters
#### **Path**
Path to project root or dependency file.
If a folder is specified, we search for and process *.depend.psd1 and requirements.psd1 files.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Tags**
Limit results to one or more tags defined in the Dependencies

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Recurse**
If specified and path is a container, search for *.depend.psd1 and requirements.psd1 files recursively under $Path

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InputObject**
If specified instead of Path, treat this hashtable as the contents of a dependency file.
For example:
    -InputObject @{
        BuildHelpers = 'latest'
        PSDeploy = 'latest'
        InvokeBuild = 'latest'
}

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Hashtable[]]`|false   |named   |false        |

#### **Credentials**
Specifies a hashtable of PSCredentials to use for each dependency that is served from a private feed.
For example:
	-Credentials @{
		PrivatePackage = $privateCredentials
		AnotherPrivatePackage = $morePrivateCredenials
	}

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-Dependency [-Path <String[]>] [-Tags <String[]>] [-Recurse] [-Credentials <Hashtable>] [<CommonParameters>]
```
```PowerShell
Get-Dependency [-Tags <String[]>] [-InputObject <Hashtable[]>] [-Credentials <Hashtable>] [<CommonParameters>]
```
