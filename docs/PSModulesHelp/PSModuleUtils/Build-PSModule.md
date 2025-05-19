Build-PSModule
--------------

### Synopsis
Builds a PowerShell module formatted like the ones located at github.com/thisjustin816.

---

### Description

Builds a PowerShell module formatted like the ones located at github.com/thisjustin816.
- Moves all public functions to a single .psm1 file and all private functions to a private folder.
- Removes any init blocks outside of the function.
- Formats the private function dot sources for the expected folder structure.
- Creates a module manifest.

---

### Examples
> EXAMPLE 1

```PowerShell
$BuildPSModule = @{
    Name        = 'MyModule'
    Version     = '1.0.0'
    Description = 'A PowerShell module.'
    Tags        = ('PSEdition_Desktop', 'PSEdition_Core')
}
Build-PSModule @BuildPSModule
```

---

### Parameters
#### **Name**
The name of the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Version**
The version of the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Description**
The description of the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Guid**
The GUID of the module. If not provided it will look for the GUID in the PSGallery, or generate it.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Tags**
The tags for the module.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **LicenseUri**
The URL for the repo's license.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **SourceDirectory**
The source directory of the module. Should be a nested directory that doesn't contain and build scripts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **OutputDirectory**
The directory to output the .psm1 module and .psd1 manifest.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **FixScriptAnalyzer**
Whether to fix the ScriptAnalyzer issues.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
N/A

---

### Syntax
```PowerShell
Build-PSModule [[-Name] <String>] [[-Version] <String>] [[-Description] <String>] [[-Guid] <String>] [[-Tags] <String[]>] [[-LicenseUri] <String>] [[-SourceDirectory] <String>] [[-OutputDirectory] <String>] [-FixScriptAnalyzer] [<CommonParameters>]
```
