Publish-Website
---------------

### Synopsis
Publishes one or more modules as websites

---

### Description

Publishes one or more modules as websites, according to the DomainSchematic found in the Pipeworks manifest

---

### Related Links
* [ConvertTo-ModuleService](ConvertTo-ModuleService)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Module Pipeworks | 
    Publish-WebSite
```

---

### Parameters
#### **Name**
The name of the module

|Type        |Required|Position|PipelineInput                 |Aliases|
|------------|--------|--------|------------------------------|-------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|Module |

#### **AsJob**
If set, will publish items in a background job

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Wait**
If set, will wait for all jobs to complete

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Throttle**
The throttle for background jobs.  By default, 10

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Buffer**
The buffer between jobs.  By default, 3 seconds

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Authorization**
If set, will change the authorization mechanism used for the web site.
Valid Values:

* Anonymous
* Windows

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)

---

### Syntax
```PowerShell
Publish-Website [-Name] <String[]> [-AsJob] [-Wait] [-Throttle <UInt32>] [-Buffer <TimeSpan>] [-Authorization <String>] [<CommonParameters>]
```
