Publish-PSMDScriptFile
----------------------

### Synopsis
Packages a script with all dependencies and "publishes" it as a zip package.

---

### Description

Packages a script with all dependencies and "publishes" it as a zip package.
By default, it will be published to the user's desktop.
All modules it uses will be parsed from the script:
- Commands that cannot be resolved will trigger a warning.
- Modules that are installed in the Windows folder (such as the ActiveDirectory module or other modules associated with server roles) will be ignored.
- PSSnapins will be ignored
- All other modules determined by the commands used will be provided from a repository, packaged in a subfolder and included in the zip file.

If needed, the scriptfile will be modified to add the new modules folder to its list of known folders.
(The source file itself will never be modified)

Use Set-PSMDStagingRepository to create / use a local path for staging modules to provide that way.
This gives you better control over the versions used and better performance.
Also the ability to use this with non-public modules.
Use Publish-PSMDStagedModule to transfer modules from path or another repository into your registered staging repository.

---

### Examples
> EXAMPLE 1

```PowerShell
Publish-PSMDScriptFile -Path 'C:\scripts\logrotate.ps1'
Creates a delivery package for the logrotate.ps1 scriptfile and places it on the desktop
```

---

### Parameters
#### **Path**
Path to the scriptfile to publish.
The scriptfile is expected to be UTF8 encoded with BOM, otherwise some characters may end up broken.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **OutPath**
The path to the folder where the output zip file will be created.
Defaults to the user's desktop.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **EnableException**
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Publish-PSMDScriptFile [-Path] <String> [[-OutPath] <String>] [-EnableException] [<CommonParameters>]
```
