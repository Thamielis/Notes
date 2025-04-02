New-NcStoragePool
-----------------

### Synopsis
Create a storage pool.

---

### Description

Create a storage pool. Capacity can be allocated to aggregates from these storage pools using Add-NcAggr.

---

### Related Links
* [Add-NcStoragePool](Add-NcStoragePool)

* [Move-NcStoragePool](Move-NcStoragePool)

* [Get-NcStoragePool](Get-NcStoragePool)

* [Remove-NcStoragePool](Remove-NcStoragePool)

---

### Examples
> Example 1

```PowerShell
New-NcStoragePool -Name test_storage -Disks NET-1.1,NET-1.2,NET-1.3,NET-1.4,NET-1.5 -Simulate
Simulate creating a new storage pool with the given disks.

NcController               : 10.63.10.37
SelectedAllocationUnitSize : 736100352

```
> Example 2

```PowerShell
New-NcStoragePool -Name test_storage -Disks NET-1.1,NET-1.2,NET-1.3,NET-1.4,NET-1.5
Create the storage pool with the given disks.

NcController : 10.63.10.37
ErrorCode    : 0
ErrorMessage :
JobId        : 16
JobVserver   :
Status       : running

```

---

### Parameters
#### **Name**
Name of the shared storage pool to be created.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|StoragePool|

#### **Disks**
List of spare disks that should be used to create the shared storage pool.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[Object[]]`|true    |named   |true (ByPropertyName)|DiskList|

#### **Nodes**
The list of nodes in which the storage pool resides.
This parameter is available in ONTAP 8.4 and later.

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
If specified, the creation of shared storage pool. The new shared storage pool won't be created but returns the minimum allocation unit size of the shared storage pool that would have been created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **DiskCount**
The number of disks that should be added to the storage pool.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **DiskSize**
Usable size of the disk. Format <number>b|kb|mb|gb|tb.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StoragePool.StoragePoolInfo

---

### Notes
Category: storage pool
API: storage-pool-create
Family: cluster

---

### Syntax
```PowerShell
New-NcStoragePool [-Name] <String> -Disks <Object[]> [-Nodes <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcStoragePool [-Name] <String> -Disks <Object[]> -Simulate [-Nodes <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcStoragePool [-Name] <String> -Simulate [-DiskCount <Int64>] [-DiskSize <String>] [-Nodes <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcStoragePool [-Name] <String> [-DiskCount <Int64>] [-DiskSize <String>] [-Nodes <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
