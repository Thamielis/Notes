New-ESCSSettingsFile
--------------------

### Synopsis
Create a new settings file for the current workspace.

---

### Description

The New-ESCSSettingsFile function creates a settings file in the current workspace. This file contains settings used by this module for determining where to find specific files.

---

### Related Links
* [Online Version:](https://github.com/SeeminglyScience/EditorServicesCommandSuite/docs/en-US/New-ESCSSettingsFile.md)

---

### Examples
> EXAMPLE 1

```PowerShell
New-ESCSSettingsFile
Creates the file ESCSSettings.psd1 in the base of the current workspace with default values.
```

---

### Parameters
#### **Path**
Specifies the path to save the settings file to. If this parameter is not specified a settings file will be created in the base of the current workspace.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |False        |

#### **Force**
If specified indicates that an existing settings file should be overridden without prompting.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
None

This function does not accept value from the pipeline.

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
New-ESCSSettingsFile [[-Path] <String>] [-Force] [<CommonParameters>]
```
