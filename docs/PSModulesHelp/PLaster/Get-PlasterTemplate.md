Get-PlasterTemplate
-------------------

### Synopsis
Retrieves a list of available Plaster templates that can be used with the Invoke-Plaster cmdlet.

---

### Description

Retrieves a list of available Plaster templates from the specified path or from the set of templates that are shipped with Plaster.  Specifying no arguments will cause only the built-in Plaster templates to be returned.  Using the -IncludeInstalledModules switch will also search the PSModulePath for PowerShell modules that advertise Plaster templates that they include. By default, this retrieves the latest version available for each module. Using the -ListAvailable parameter will return all templates from all module versions installed on this computer. Using the -Name parameter limits the results based on name. Using the -Tag parameter limits the results based on the template tags.

The objects returned from this cmdlet will provide details about each individual template that was retrieved.  Use the TemplatePath property of a template object as the input to Invoke-Plaster's -TemplatePath parameter.

---

### Related Links
* [Online Version:](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/Get-PlasterTemplate.md)

* [Invoke-Plaster](https://github.com/PowerShell/Plaster/blob/master/docs/en-US/Invoke-Plaster.md)

---

### Examples
> Example 1

```PowerShell
PS C:\> $templates = Get-PlasterTemplate

PS C:\> Invoke-Plaster -TemplatePath $templates[0].TemplatePath -DestinationPath ~\GitHub\NewModule
This will get the list of built-in Plaster templates.  The first template returned is then used to create a new module at the specifed path.
```
> Example 2

```PowerShell
PS C:\> $templates = Get-PlasterTemplate -IncludeInstalledModules

PS C:\> Invoke-Plaster -TemplatePath $templates[0].TemplatePath -DestinationPath ~\GitHub\NewModule
This will get a list of Plaster templates, both built-in and included with installed modules.  The first template returned is then used to create a new module at the specifed path.
```
> Example 3

```PowerShell
PS C:\> $templates = Get-PlasterTemplate -Path c:\MyPlasterTemplates -Recurse

PS C:\> Invoke-Plaster -TemplatePath $templates[0].TemplatePath -DestinationPath ~\GitHub\NewModule
This will get a list of Plaster templates found recursively under c:\MyPlasterTemplates The first template returned is then used to create a new module at the specifed path.
```
> Example 4

```PowerShell
PS C:\> $template = Get-PlasterTemplate -Name NewPowerShellScriptModule

PS C:\> Invoke-Plaster -TemplatePath $template.TemplatePath -DestinationPath ~\GitHub\NewModule
This will get the built-in Plaster template with the name NewPowerShellScriptModule. It will then use that template to create a new module at the specified path.
```
> Example 5

```PowerShell
PS C:\> $templates = Get-PlasterTemplate -IncludeInstalledModules -Name new*

PS C:\> Invoke-Plaster -TemplatePath $templates[0].TemplatePath -DestinationPath ~\GitHub\NewModule
This will get a list of Plaster templates, both built-in and included with installed modules, where the name matches 'new*'. It will then use the first template found to create a new module at the specified path.
```
> Example 6

```PowerShell
PS C:\> $templates = Get-PlasterTemplate -IncludeInstalledModules -tag module*

PS C:\> $templates[0].InvokePlaster()
This will get a list of Plaster templates, both built-in and included with installed modules, where the name matches 'module*'. It will then use the first template found to create a new module at the specified path using the InvokePlaster script method that is available on the returned object.
```

---

### Parameters
#### **IncludeInstalledModules**
Initiates a search for Plaster templates inside of installed modules.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|true    |0       |False        |IncludeModules|

#### **ListAvailable**
If specified, searches for Plaster templates inside of all installed module versions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Limits the templates returned to those that match the template name. Wildcard characters are permitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |False        |

#### **Path**
Specifies a path to a folder containing a Plaster template or multiple template folders. Can also be a path to plasterManifest.xml.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |False        |

#### **Recurse**
Indicates that this cmdlet gets the items in the specified locations and in all child items of the locations.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Tag**
Limits the templates returned to those that match the template tags. Wildcard characters are permitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
System.String

The first positional parameter is a filesystem path under which templates might be found.  The -Recurse switch will cause this path to be searched recursively.

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-PlasterTemplate [-IncludeInstalledModules] [[-Name] <String>] [-ListAvailable] [-Tag <String>] [<CommonParameters>]
```
```PowerShell
Get-PlasterTemplate [[-Path] <String>] [[-Name] <String>] [-Recurse] [-Tag <String>] [<CommonParameters>]
```
