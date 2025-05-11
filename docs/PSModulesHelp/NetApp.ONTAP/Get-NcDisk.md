Get-NcDisk
----------

### Synopsis
Get disk information about one or more disks.

---

### Description

Get disk information about one or more disks.

---

### Related Links
* [Get-NcDiskOwner](Get-NcDiskOwner)

---

### Examples
> Example 1

Get-NcDisk
List all disks in the cluster.

Name                      Shelf Bay Position     Capacity  RPM  FW
----                      ----- --- --------     --------  ---  --
VxeRubble-01:1a.02.0        2    0  dparity        278 GB  15k  NA00
VxeRubble-01:1a.02.1        2    1  parity         278 GB  15k  NA00
VxeRubble-01:1a.02.10       2   10  data           278 GB  15k  NA00
VxeRubble-01:1a.02.11       2   11  data           278 GB  15k  NA00
VxeRubble-01:1a.02.12       2   12  data           278 GB  15k  NA00
VxeRubble-01:1a.02.13       2   13  dparity        278 GB  15k  NA00
VxeRubble-01:1a.02.14       2   14  parity         278 GB  15k  NA00
VxeRubble-01:1a.02.15       2   15  data           278 GB  15k  NA00
VxeRubble-01:1a.02.16       2   16  data           278 GB  15k  NA00
VxeRubble-01:1a.02.17       2   17  data           278 GB  15k  NA00
VxeRubble-01:1a.02.18       2   18  data           278 GB  15k  NA00
VxeRubble-01:1a.02.19       2   19  data           278 GB  15k  NA00
VxeRubble-01:1a.02.2        2    2  data           278 GB  15k  NA00
VxeRubble-01:1a.02.20       2   20  data           278 GB  15k  NA00
VxeRubble-01:1a.02.21       2   21  data           278 GB  15k  NA00
VxeRubble-01:1a.02.22       2   22  data           278 GB  15k  NA00
VxeRubble-01:1a.02.23       2   23  present        278 GB  15k  NA00
VxeRubble-01:1a.02.3        2    3  dparity        278 GB  15k  NA00
VxeRubble-01:1a.02.4        2    4  parity         278 GB  15k  NA00
VxeRubble-01:1a.02.5        2    5  data           278 GB  15k  NA00
VxeRubble-01:1a.02.6        2    6  data           278 GB  15k  NA00
VxeRubble-01:1a.02.7        2    7  data           278 GB  15k  NA00
VxeRubble-01:1a.02.8        2    8  data           278 GB  15k  NA00
VxeRubble-01:1a.02.9        2    9  data           278 GB  15k  NA00
VxeRubble-02:1a.01.0        1    0  dparity        278 GB  15k  NA00
VxeRubble-02:1a.01.1        1    1  parity         278 GB  15k  NA00

---

### Parameters
#### **Name**
The name of one or more disks to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Disk<br/>DiskName|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a StorageDiskInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDisk -Template" to get the initially empty StorageDiskInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[StorageDiskInfo]`|false   |named   |false        |

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
Specify to get an empty StorageDiskInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a StorageDiskInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcDisk -Template" to get the initially empty StorageDiskInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[StorageDiskInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageDisk.StorageDiskInfo

---

### Notes
Category: disk
API: storage-disk-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDisk [[-Name] <String[]>] [-VserverContext <String>] [-Attributes <StorageDiskInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDisk [-VserverContext <String>] -Template [-Fill] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDisk [-VserverContext <String>] -Query <StorageDiskInfo> [-Attributes <StorageDiskInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
