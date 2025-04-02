Add-NcStoragePool
-----------------

### Synopsis
Add disks to a storage pool.

---

### Description

Add disks to a storage pool.  

A job will be spawned to operate on the storage-pool and the job id will be returned.  The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcStoragePool](Get-NcStoragePool)

* [New-NcStoragePool](New-NcStoragePool)

* [Move-NcStoragePool](Move-NcStoragePool)

* [Remove-NcStoragePool](Remove-NcStoragePool)

---

### Parameters
#### **Name**
Name of the Shared Storage Pool to which the spare disks will be added.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|StoragePool|

#### **Disks**
List of spare disks that need to be added to the shared storage pool. They should be of the same size as the existing disks in the shared storage pool. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[Object[]]`|false   |named   |true (ByPropertyName)|DiskList|

#### **AutoGrowAggregates**
If specified, automatically grow the existing aggregates that are eligible for growing. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Nodes**
The list of nodes in which the storage pool resides.
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Simulate**
If specified, simulates the addition of disks to the given shared storage pool. Addition of disks won't happen but returns a list of aggregates that would auto-grow and the size of the aggregate prior to grow and also after the auto-grow.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **DiskCount**
The number of disks that should be added to the storage pool.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: storage pool
API: storage-pool-add
Family: cluster

---

### Syntax
```PowerShell
Add-NcStoragePool [-Name] <String> [-Disks <Object[]>] [-AutoGrowAggregates] [-Nodes <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcStoragePool [-Name] <String> [-Disks <Object[]>] [-AutoGrowAggregates] -Simulate [-Nodes <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcStoragePool [-Name] <String> [-AutoGrowAggregates] -Simulate [-DiskCount <Int64>] [-Nodes <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcStoragePool [-Name] <String> [-AutoGrowAggregates] [-DiskCount <Int64>] [-Nodes <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
