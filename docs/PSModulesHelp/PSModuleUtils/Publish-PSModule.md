Publish-PSModule
----------------

### Synopsis
Publishes a PowerShell module to a repository.

---

### Description

Publishes a PowerShell module to a repository. Defaults to PSGallery.

---

### Examples
> EXAMPLE 1

```PowerShell
Publish-PSModule -Name 'MyModule' -OutputDirectory "$PWD/out" -Repository 'PSGallery'
```

---

### Parameters
#### **Name**
The name of the module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **OutputDirectory**
The build output directory used in Build-PSModule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Repository**
The repository to publish to. Defaults to PSGallery.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ApiKey**
The API key to use for publishing. Defaults to $env:PSGALLERYAPIKEY.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Notes
N/A

---

### Syntax
```PowerShell
Publish-PSModule [[-Name] <String>] [[-OutputDirectory] <String>] [[-Repository] <String>] [[-ApiKey] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
