ConvertTo-ModuleService
-----------------------

### Synopsis
Export a PowerShell module as a series of ASP.NET Handlers

---

### Description

Exports a Powershell module as a series of ASP.NET handlers

---

### Related Links
* [Invoke-WebCommand](Invoke-WebCommand)

---

### Examples
> EXAMPLE 1

```PowerShell
Import-Module Pipeworks -Force -PassThru | ConvertTo-ModuleService -Force -Allowdownload
```

---

### Parameters
#### **Name**
|Options Get-Module | Select-Object -ExpandProperty Name
 The name of the module to export

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **CommandOrder**
The order in which to display the commands

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **AnalyticsId**
The Google Analytics ID used for the module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OutputDirectory**
The directory where the generated module will be stored.  
If no directory is specified, the module will be put in Inetpub\wwwroot\ModuleName

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Force**
If set, will overwrite files found in the output directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowDownload**
If set, will allow the module to be downloaded

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **AsIntranetSite**
If set, will make changes to the web.config file to work for Intranet sites (anonymous authentication will be disabled, and windows authentication will be enabled).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Realm**
The Kerberos realm to use for authentication.      
Only works with -AsIntranetSite.  
If provided, Kerberos authentication will be used instead of NTLM.  
This is both faster, and more secure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AppPoolCredential**
If provided, will run the site under an app pool with the credential

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **Port**
The port an intranet site should run on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **DownloadUrl**
If a download URL is present, a download link will redirect to that URL.

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **AsBlog**
If set, the blog page will become the homepage of the module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AcceptAnyUrl**
If set, will add a URL rewriter rule to accept any URL that is not a real file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ModuleUrl**
If this is set, will use this module URL as the module service URL.

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **Style**
If set, will render a CSS style

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **ConfigSetting**
If set, will create appSettings in a web.config file.  This can be used to store common settings, like connection data.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **MarginPercent**
The margin on either side of the module content.  Defaults to 7.5%.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **MarginPercentLeft**
The margin on the left side of the module content. Defaults to 7.5%.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **MarginPercentRight**
The margin on the left side of the module content. Defaults to 7.5%.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **UseSchematic**
The schematics used to produce the module service.  
Schematics let you quickly and easily give a look or feel around data or commands, and let you parameterize your deployment with the pipeworks manifest.

|Type        |Required|Position|PipelineInput|Aliases  |
|------------|--------|--------|-------------|---------|
|`[String[]]`|false   |named   |false        |Schematic|

#### **IsolateRunspace**
If set, will run commands in a runspace for each user.  If not set, users will run in a pool

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PoolSize**
The size of the runspace pool that will handle request.  The more runspaces in the pool, the more concurrent users

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **IISReset**
If set, will reset IIS

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExecutionTimeout**
The maximum amount of that a page can run before it times out.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **MaximumRequestLength**
The maximum request length.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Show**
If set, will show the default browser when the conversion is complete

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Do**
If provided, will visit this URL after the conversion is complete.

|Type   |Required|Position|PipelineInput|Aliases          |
|-------|--------|--------|-------------|-----------------|
|`[Uri]`|false   |named   |false        |Page<br/>ShowPage|

#### **AsJob**
If set, will run as a background job

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Throttle**
If provided, will run as a background job, with the throttle being the maximum number of background jobs

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **CacheStaticContentFor**
The amount of time static content will be cached for.  By default, one week.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **DoNotClean**
If set, will not clean the output directory.  If you are trying to nest multiple pipeworks sites, this would be the way to go.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsNested**
If set, the module will be assumed to be nested beneath another module, and no DefaultDocument will be added to the web.config

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
ConvertTo-ModuleService [-Name] <String> [[-CommandOrder] <String[]>] [-AnalyticsId <String>] [-OutputDirectory <String>] [-Force] [[-AllowDownload]] [-AsIntranetSite] [-Realm <String>] [-AppPoolCredential <PSCredential>] [-Port <UInt32>] [-DownloadUrl <Uri>] [-AsBlog] [-AcceptAnyUrl] [-ModuleUrl <Uri>] [-Style <Hashtable>] [-ConfigSetting <Hashtable>] [-MarginPercent <Double>] [-MarginPercentLeft <Double>] [-MarginPercentRight <Double>] [-UseSchematic <String[]>] [-IsolateRunspace] [-PoolSize <UInt16>] [-IISReset] [-ExecutionTimeout <TimeSpan>] [-MaximumRequestLength <UInt32>] [-Show] [-Do <Uri>] [-AsJob] [-Throttle <UInt32>] [-CacheStaticContentFor <TimeSpan>] [-DoNotClean] [-IsNested] [<CommonParameters>]
```
