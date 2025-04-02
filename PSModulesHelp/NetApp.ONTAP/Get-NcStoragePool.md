Get-NcStoragePool
-----------------

### Synopsis
Get storage pool attributes.

---

### Description

Get storage pool attributes.

---

### Related Links
* [New-NcStoragePool](New-NcStoragePool)

* [Add-NcStoragePool](Add-NcStoragePool)

* [Move-NcStoragePool](Move-NcStoragePool)

* [Remove-NcStoragePool](Remove-NcStoragePool)

---

### Parameters
#### **Name**
Name of one or more shared storage pools.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |named   |true (ByPropertyName)|StoragePool|

#### **Node**
One or more nodes in which the storage pool resides.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **StorageType**
One or more storage types.
                   
Possible values:
'ata'       - Advanced Technology Attachment,
'bsas'      - Bridged Serial Attached SCSI (bridged from SATA),
'fcal'      - Fibre Channel Arbitrated Loop,
'fsas'      - High-Capacity (Fat) Serial Attached SCSI,
'lun'       - SCSI Logical Unit Number (e.g. Array),
'msata'     - Multiple bridged SATA disks in a single carrier,
'sas'       - Serial Attached SCSI,
'sata'      - Serial Advanced Technology Attachment,
'ssd'       - Solid-State Disk,
'vmdisk'    - Hypervisor Virtual Disk

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a StoragePoolInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcStoragePool -Template" to get the initially empty StoragePoolInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[StoragePoolInfo]`|false   |named   |false        |

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
Specify to get an empty StoragePoolInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a StoragePoolInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcStoragePool -Template" to get the initially empty StoragePoolInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[StoragePoolInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StoragePool.StoragePoolInfo

---

### Notes
Category: storage pool
API: storage-pool-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStoragePool [-Name <String[]>] [-Node <String[]>] [-StorageType <String[]>] [-Attributes <StoragePoolInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStoragePool -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcStoragePool -Query <StoragePoolInfo> [-Attributes <StoragePoolInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
