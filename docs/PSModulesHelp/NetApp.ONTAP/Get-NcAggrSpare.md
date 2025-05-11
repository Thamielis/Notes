Get-NcAggrSpare
---------------

### Synopsis
Get a list of spare disks.

---

### Description

Get a list of spare disks.

---

### Related Links
* [Get-NcDisk](Get-NcDisk)

---

### Examples
> Example 1

Get-NcAggrSpare
Get the spare disks on the cluster.

Disk                          TotalSize DiskType        IsDiskShared   IsDiskZeroed  IsDiskZeroing  OriginalOwner
----                          --------- --------        ------------   ------------  -------------  -------------
VMw-1.12                        88.9 MB vmdisk             False          False          False      beam-fs-ps-01
VMw-1.13                        88.9 MB vmdisk             False          False          False      beam-fs-ps-01
VMw-1.14                        88.9 MB vmdisk             False          False          False      beam-fs-ps-01

> Example 2

```PowerShell
Get-NcAggrSpare -Query @{IsDiskZeroed=$false} | Start-NcDiskZeroSpare
Get all of the non-zeroed spare disks and start zeroing them.
```

---

### Parameters
#### **Name**
The name of one or more spare disks to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Disk   |

#### **Owner**
The name of one or more owners of the spare disks to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|OriginalOwner|

#### **Attributes**
For improved scalability in large clusters, provide a AggrSpareDiskInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAggrSpare -Template" to get the initially empty AggrSpareDiskInfo object.  If not specified, all data is returned for each object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[AggrSpareDiskInfo]`|false   |named   |false        |

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
Specify to get an empty AggrSpareDiskInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AggrSpareDiskInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggrSpare -Template" to get the initially empty AggrSpareDiskInfo object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[AggrSpareDiskInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrSpareDiskInfo

---

### Notes
Category: aggr
API: aggr-spare-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrSpare [[-Name] <String[]>] [[-Owner] <String[]>] [-Attributes <AggrSpareDiskInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrSpare -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAggrSpare -Query <AggrSpareDiskInfo> [-Attributes <AggrSpareDiskInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
