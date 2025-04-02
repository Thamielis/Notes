New-DSFolder
------------

### Synopsis
Create a new folder in a vault

---

### Description

Create a new folder in the specified vault

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CheckOutCommentMode**
How the checkout comment mode is set.
Valid Values:

* Default
* True
* False
* Inherited

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CheckOutCommentMode]`|false   |9       |false        |

#### **CheckOutMode**
How the checkout mode is set.
Valid Values:

* Default
* NotSupported
* Automatic
* Manual
* Inherited
* Optional
* AutomaticWhenAvailable

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CheckOutMode]`|false   |8       |false        |

#### **Description**
Description of the folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Domain**
Domain of the folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Group**
Group where the folder will be created

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **Keywords**
Tags of the folder

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **Name**
Name of the folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Password**
Password of the folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Username**
Username of the folder

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **VaultID**
ID of the vault where the folder will be created

|Type    |Required|Position|PipelineInput|Aliases     |
|--------|--------|--------|-------------|------------|
|`[Guid]`|false   |named   |false        |RepositoryId|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSFolder -detailed". For technical information, type "Get-Help New-DSFolder -full".

---

### Syntax
```PowerShell
New-DSFolder [[-CheckOutCommentMode] <Default | True | False | Inherited>] [[-CheckOutMode] <Default | NotSupported | Automatic | Manual | Inherited | Optional | AutomaticWhenAvailable>] [[-Description] <String>] [[-Domain] <String>] [[-Group] <String>] [[-Keywords] <String[]>] [-Name] <String> [[-Password] <String>] [[-Username] <String>] [-VaultID <Guid>] [-AsLegacyResponse] [<CommonParameters>]
```
