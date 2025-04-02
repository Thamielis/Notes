New-DSPamScanConfiguration
--------------------------

### Synopsis

---

### Description

---

### Parameters
#### **Container**
Domain containers.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DatabaseName**
Database name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Domain**
Domain names. The provider's domains are added by default if none are specified.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ExcludedAccounts**
Excluded accounts from the scan. By default, the value 'DefaultExcludedWindowsAccount' is present.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FrequencyUnits**
Frequecy unit for the recurrence
Valid Values:

* Minutes
* Hours
* Days
* Weeks
* Months
* Years

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[InventoryScanFrequencyUnits]`|false   |named   |false        |

#### **FrequencyValue**
Frequecy value for the recurrence

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IgnoreSystemUsers**
Ignore system users

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Name**
Name of the scan

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **PassThru**
Obtain the scan configuration object

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Provider**
Provider obtained from Get-DSPamProvider

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PamProvider]`|true    |3       |false        |

#### **ScanNow**
Start scan on save

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SearchMode**
Search mode

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[AzureSearchMode]`|true    |named   |false        |

#### **Start**
Start date time of the scan for the recurrence

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Type**
Scan configuration type
Valid Values:

* Deep
* Full
* OSDetection
* Ping
* Domain
* LocalAccounts
* SQL
* Windows
* AzureAD
* Custom

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[InventoryScanType]`|true    |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-DSPamScanConfiguration -detailed". For technical information, type "Get-Help New-DSPamScanConfiguration -full".

---

### Syntax
```PowerShell
New-DSPamScanConfiguration [-Name] <String> -Type <AzureAD> -SearchMode <Groups | Roles> [-Provider] <PamProvider> [-FrequencyUnits <Minutes | Hours | Days | Weeks | Months | Years>] [-FrequencyValue <Int32>] [-Start <DateTime>] [-ScanNow] [-PassThru] [<CommonParameters>]
```
```PowerShell
New-DSPamScanConfiguration [-Name] <String> -Type <Domain> [-Domain <String[]>] [-Container <String[]>] [-Provider] <PamProvider> [-FrequencyUnits <Minutes | Hours | Days | Weeks | Months | Years>] [-FrequencyValue <Int32>] [-Start <DateTime>] [-ScanNow] [-PassThru] [<CommonParameters>]
```
```PowerShell
New-DSPamScanConfiguration [-Name] <String> -Type <LocalAccounts> [-IgnoreSystemUsers] [-Provider] <PamProvider> [-FrequencyUnits <Minutes | Hours | Days | Weeks | Months | Years>] [-FrequencyValue <Int32>] [-Start <DateTime>] [-ScanNow] [-PassThru] [<CommonParameters>]
```
```PowerShell
New-DSPamScanConfiguration [-Name] <String> -Type <SQL> -DatabaseName <String> [-Provider] <PamProvider> [-FrequencyUnits <Minutes | Hours | Days | Weeks | Months | Years>] [-FrequencyValue <Int32>] [-Start <DateTime>] [-ScanNow] [-PassThru] [<CommonParameters>]
```
```PowerShell
New-DSPamScanConfiguration [-Name] <String> -Type <Windows> [-ExcludedAccounts <String[]>] [-Provider] <PamProvider> [-FrequencyUnits <Minutes | Hours | Days | Weeks | Months | Years>] [-FrequencyValue <Int32>] [-Start <DateTime>] [-ScanNow] [-PassThru] [<CommonParameters>]
```
