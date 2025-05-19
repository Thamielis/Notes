Invoke-PSMDTemplate
-------------------

### Synopsis
Creates a project/file from a template.

---

### Description

This function takes a template and turns it into a finished file&folder structure.
It does so by creating the files and folders stored within, replacing all parameters specified with values provided by the user.

Missing parameters will be prompted for.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-PSMDTemplate -TemplateName "module"
Creates a project based on the module template in the current folder, asking for all details.
```
> EXAMPLE 2

```PowerShell
Invoke-PSMDTemplate -TemplateName "module" -Name "MyModule"
Creates a project based on the module template with the name "MyModule"
```
> EXAMPLE 3

```PowerShell
Invoke-PSMDTemplate MiniModule -Parameters @{ Author = 'Fred' }
Creates a new project based on the template MiniModule and predefines the value for the "Author" placeholder.
```

---

### Parameters
#### **TemplateName**
The name of the template to build from.
Warning: This does wildcard interpretation, don't specify '*' unless you like answering parameter prompts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Template**
The template object to build from.
Accepts objects returned by Get-PSMDTemplate.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[TemplateInfo[]]`|true    |named   |true (ByValue)|

#### **Store**
The template store to retrieve tempaltes from.
By default, all stores are queried.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Path**
Instead of a registered store, look in this path for templates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **OutPath**
The path in which to create the output.
By default, it will create in the current directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Name**
The name of the produced output.
Automatically inserted for any name parameter specified on creation.
Also used for creating a root folder, when creating a project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Encoding**
The encoding to apply to text files.
The default setting for this can be configured by updating the 'PSFramework.Text.Encoding.DefaultWrite' configuration setting.
The initial default value is utf8 with BOM.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[EncodingParameter]`|false   |named   |false        |

#### **NoFolder**
Skip automatic folder creation for project templates.
By default, this command will create a folder to place files&folders in when creating a project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Parameters**
A Hashtable containing parameters for use in creating the template.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **Raw**
By default, all parameters will be replaced during invocation.
In Raw mode, this is skipped, reproducing mostly the original template input (dynamic scriptblocks will now be named scriptblocks)).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GenerateObjects**
By default, Invoke-PSMDTemplate generates files.
In GenerateObjects mode, no file but objects are created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
If the target path the template should be written to (filename or folder name within $OutPath), then overwrite it.
By default, this function will fail if an overwrite is required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Silent**
This places the function in unattended mode, causing it to error on anything requiring direct user input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoConfigFile**
By default, this command will look in the execution path and above for files named "PSMDConfig.psd1" to populate template parameters from.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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

### Outputs
* PSModuleDevelopment.Template.TemplateResult

---

### Syntax
```PowerShell
Invoke-PSMDTemplate [-TemplateName] <String> -Path <String> [[-OutPath] <String>] [[-Name] <String>] [-Encoding <EncodingParameter>] [-NoFolder] [-Parameters <Hashtable>] [-Raw] [-GenerateObjects] [-Force] [-Silent] [-NoConfigFile] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-PSMDTemplate [-TemplateName] <String> [-Store <String>] [[-OutPath] <String>] [[-Name] <String>] [-Encoding <EncodingParameter>] [-NoFolder] [-Parameters <Hashtable>] [-Raw] [-GenerateObjects] [-Force] [-Silent] [-NoConfigFile] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-PSMDTemplate -Template <TemplateInfo[]> [[-OutPath] <String>] [[-Name] <String>] [-Encoding <EncodingParameter>] [-NoFolder] [-Parameters <Hashtable>] [-Raw] [-GenerateObjects] [-Force] [-Silent] [-NoConfigFile] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```
