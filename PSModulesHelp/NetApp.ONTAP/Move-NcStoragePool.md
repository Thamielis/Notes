Move-NcStoragePool
------------------

### Synopsis
Ressign capacity from one node to another node in storage pool.

---

### Description

Ressign capacity from one node to another node in storage pool.

A job will be spawned to operate on the storage-pool and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcStoragePool](Get-NcStoragePool)

* [Add-NcStoragePool](Add-NcStoragePool)

* [New-NcStoragePool](New-NcStoragePool)

* [Remove-NcStoragePool](Remove-NcStoragePool)

---

### Parameters
#### **Name**
The cluster-wide unique name of the shared storage pool.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|StoragePool|

#### **FromNode**
The node that owns the spare capacity which needs to be re-assigned.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ToNode**
The node to which the capacity will be assigned.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **AllocationUnits**
The spare capacity to be assigned in the form of count that is multiple of AllocationUnitSize.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |4       |true (ByPropertyName)|

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StoragePool.StoragePoolInfo

---

### Notes
Category: storage pool
API: storage-pool-reassign
Family: cluster

---

### Syntax
```PowerShell
Move-NcStoragePool [-Name] <String> [-FromNode] <String> [-ToNode] <String> [-AllocationUnits] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
