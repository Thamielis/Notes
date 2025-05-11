Add-VBRWANAccelerator
---------------------

### Synopsis
Creates a new WAN accelerator.

---

### Description

This cmdlet creates a new WAN accelerator.
WAN accelerator is an architecture component that optimizes file transfer via WAN by means of data deduplication. The role of a WAN accelerator can be assigned to a dedicated Windows-based machine (physical or virtual). For best performance you should set a WAN accelerator on both source and target sides.

---

### Examples
> Example

Get-VBRLocalhost | Add-VBRWANAccelerator -Description "WAN Accelerator 01" -CachePath "c:\WAN" -CacheSize 100 -CacheSizeUnit GB
This example shows how to create a new WAN accelerator on the Veeam backup server.

Perform the following steps:
1. Run the Get-VBRLocalhost cmdlet.
2. Pipe the cmdlet output to the Add-VBRWANAccelerator cmdlet. Specify the following settings:
- Specify the Description parameter value.
- Specify the CachePath parameter value.
- Specify the CacheSize and the CacheSizeUnit parameter values.
> Example 2

$server = Get-VBRServer -Name "server01.tech.global"
Add-VBRWANAccelerator -Server $server -Description "WAN Accelerator 02" -CachePath "c:\WAN" -CacheSize 150 -CacheSizeUnit GB
This command creates a new WAN accelerator using variables.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRWANAccelerator cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Description parameter value.
- Specify the CachePath parameter value.
- Specify the CacheSize and the CacheSizeUnit parameter values.

---

### Parameters
#### **CachePath**
Specifies the path to the folder where WAN accelerator will be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CacheSize**
Specifies the cache folder capacity value.
Permitted values: 1 to 65535.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |False        |

#### **CacheSizeUnit**
Specifies the measure unit for the cache folder capacity.
Permitted values: GB or TB.
Valid Values:

* B
* KB
* MB
* GB
* TB
* PB

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[ESizeUnit]`|false   |named   |False        |

#### **Description**
Specifies the description of the WAN accelerator.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableHighBandwidthMode**
Enables the High bandwidth mode option.
For more information on the option, see the Choose Server step of the Adding WAN Accelerators wizard in the Veeam Backup & Replication User Guide.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the server where WAN accelerator will be created.
Please note that you can create WAN accelerator on Microsoft Windows servers only.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
WAN optimization is available only in Veeam Backup & Replication Enterprise Plus Edition.

---

### Syntax
```PowerShell
Add-VBRWANAccelerator [-CachePath <String>] [-CacheSize <UInt32>] [-CacheSizeUnit {B | KB | MB | GB | TB | PB}] [-Description <String>] [-EnableHighBandwidthMode] -Server <CHost> [<CommonParameters>]
```
