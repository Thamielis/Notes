Get-NcStoragePoolDisk
---------------------

### Synopsis
Get disks in a storage pool.

---

### Description

Get disks in a storage pool.

---

### Related Links
* [Get-NcStoragePool](Get-NcStoragePool)

* [Get-NcDisk](Get-NcDisk)

---

### Parameters
#### **StoragePool**
Name of one or more shared storage pools.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Disk**
Name of one or more shared storage pool disks.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a StoragePoolDiskInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcStoragePoolDisk -Template" to get the initially empty StoragePoolDiskInfo object.  If not specified, all data is returned for each object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[StoragePoolDiskInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty StoragePoolDiskInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a StoragePoolDiskInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcStoragePoolDisk -Template" to get the initially empty StoragePoolDiskInfo object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[StoragePoolDiskInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StoragePool.StoragePoolDiskInfo

---

### Notes
Category: storage pool
API: storage-pool-disk-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStoragePoolDisk [[-StoragePool] <String[]>] [[-Disk] <String[]>] [-Attributes <StoragePoolDiskInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStoragePoolDisk -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcStoragePoolDisk -Query <StoragePoolDiskInfo> [-Attributes <StoragePoolDiskInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
