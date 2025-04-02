Get-DSFolder
------------

### Synopsis
Return a folder by ID

---

### Description

Return a folder by ID, with possibility of including advanced folder properties

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-DSFolder -FolderId $folderId -IncludeAdvancedProperties
Fetch a specific folder, including its advanced properties
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FolderId**
Folder's ID

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **IncludedAdvancedProperties**
Used to select if advanced properties should be included

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSFolder -detailed". For technical information, type "Get-Help Get-DSFolder -full".

---

### Syntax
```PowerShell
Get-DSFolder -FolderId <Guid> [[-IncludedAdvancedProperties]] [-AsLegacyResponse] [<CommonParameters>]
```
