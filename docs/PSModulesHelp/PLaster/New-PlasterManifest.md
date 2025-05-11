New-PlasterManifest
-------------------

### Synopsis
Creates a new Plaster template manifest file.

---

### Description

The New-PlasterManifest command creates a new Plaster manifest file, populates its values, and saves the manifest file in the specified path.

Template authors can use this command to create a manifest for their template. A template manifest is a file named plasterManifest.xml or plasterManifest_<culture-name>.xml. The information stored in the manifest is used to scaffold files and folders.

The metadata section of the manifest is used to supply information about the template e.g. a unique id, name, version, title, author and tags.

The parameters section of the manifest is used to describe choices the template user can choose from. Those choices are then used to conditionally create files and folders and modify existing files under the specified destination path.

The content section is used to specify what actions the template will perform under the user's chosen destination directory. This includes copying files to the destination, copy & expanding template files, modifying files, verifying required modules are installed and displaying messages to the user.

See the help topic about_Plaster_CreatingAManifest for more details on authoring a Plaster manifest file.

---

### Related Links
* [Online Version:](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/New-PlasterManifest.md)

* [Invoke-Plaster](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/Invoke-Plaster.md)

* [Test-PlasterManifest](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/Test-PlasterManifest.md)

---

### Examples
> EXAMPLE 1

```PowerShell
New-PlasterManifest -TemplateName NewPowerShellItem -TemplateType Item
Creates a basic plasterManifest.xml file in the current directory.
```
> EXAMPLE 2

```PowerShell
New-PlasterManifest -TemplateName NewPowerShellItem -TemplateType Item -TemplateVersion 0.1.0 -Description "Some description." -Tags Module, Publish,Build
Creates a plasterManifest.xml file in the current directory with the version set to 0.1.0 and with the Description and Tags elements populated.
```
> EXAMPLE 3

```PowerShell
New-PlasterManifest -TemplateName NewPowerShellItem -TemplateType Item -AddContent
Creates a plasterManifest.xml file in the current directory with the content element filled in with all the files (except for any plasterManifest files) in and below the specified directory which defaults to the current directory.
```

---

### Parameters
#### **AddContent**
If specified, the contents of the directory the manifest is being created in will be added to the manifest's content element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Author**
Specifies the author of the template.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **Description**
Description of the Plaster template. This describes what the the template is for. It is typically used in an editor like VSCode when displaying additional information about a Plaster template. A typical title might be "Creates files required for a PowerShell module with optional support for Pester tests, building with psake and publishing to the PowerShell Gallery."

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |False        |

#### **Id**
Unique identifier for all versions of this template. The id is a GUID. Use the same id for each version of your template. This will prevent editor environments from listing multiple, installed versions of your template. When you keep your template id the same, the editor will list only the latest version of your template.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |3       |False        |

#### **Path**
Specifies the path and file name of the new Plaster manifest. Enter a path and file name with a .xml extension, such as $pshome\Modules\MyPlasterTemplate\plasterManifest.xml. NOTE: Plaster requires the manifest file be named either plasterManifest.xml OR plasterManifest_<culture-name>.xml e.g. plasterManifest_fr-FR.xml. The default, if no value is provided is to create plasterManifest.xml in the current directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |False        |

#### **Tags**
Specifies an array of tags for the template. Users can search for templates based on these tags.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |7       |False        |

#### **TemplateName**
Specifies the name of the template. A template name is required. For localized manifests, this value should not be localized. The name is limited to the characters: aA-zZ0-9_-.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |False        |

#### **TemplateType**
Defines the type of template.  Valid values are: Project and Item.  This value is used by editor extensions like the PowerShell extension for Visual Studio Code to determine if the template expects to create a whole new project in an empty workspace or if it adds an item to an existing workspace.
Valid Values:

* Item
* Project

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **TemplateVersion**
Specifies the version of the template.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |False        |

#### **Title**
Title of the Plaster template. This string is typically used in an editor like VSCode when displaying a list of Plaster templates. A typical title might be "New DSC Resource" or "New PowerShell Module".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |False        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

You cannot pipe input to this cmdlet.

---

### Outputs
* None

---

### Notes

---

### Syntax
```PowerShell
New-PlasterManifest [[-Path] <String>] [-TemplateName] <String> [-TemplateType] {Item | Project} [[-Id] <Guid>] [[-TemplateVersion] <String>] [[-Title] <String>] [[-Description] <String>] [[-Tags] <String[]>] [[-Author] <String>] [-AddContent] [-Confirm] [-WhatIf] [<CommonParameters>]
```
