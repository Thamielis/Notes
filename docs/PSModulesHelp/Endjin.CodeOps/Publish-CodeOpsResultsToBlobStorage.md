Publish-CodeOpsResultsToBlobStorage
-----------------------------------

### Synopsis

Publish-CodeOpsResultsToBlobStorage -StorageAccountName <string> -ContainerName <string> -BlobPath <string> -SasToken <string> -JsonFilePath <string> -Timestamp <string> [-WhatIf] [<CommonParameters>]

Publish-CodeOpsResultsToBlobStorage -StorageAccountName <string> -ContainerName <string> -BlobPath <string> -JsonFilePath <string> -Timestamp <string> [-UseConnectedAccount] [-GeneratedSasTokenLifetimeMinutes <int>] [-WhatIf] [<CommonParameters>]

---

### Description

---

### Parameters
#### **BlobPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **ContainerName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **GeneratedSasTokenLifetimeMinutes**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Named   |false        |

#### **JsonFilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **SasToken**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **StorageAccountName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **Timestamp**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |Named   |false        |

#### **UseConnectedAccount**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Publish-CodeOpsResultsToBlobStorage; CommonParameters=True; parameter=System.Object[]}, @{name=Publish-CodeOpsResultsToBlobStorage; CommonParameters=True; parameter=System.Object[]}}
```
