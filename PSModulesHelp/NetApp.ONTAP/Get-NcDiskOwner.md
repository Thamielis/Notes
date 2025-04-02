Get-NcDiskOwner
---------------

### Synopsis
Get disk ownership information.

---

### Description

Get disk ownership information.

---

### Related Links
* [Get-NcDisk](Get-NcDisk)

* [Get-NcNode](Get-NcNode)

* [Get-NcDiskOwnerFiler](Get-NcDiskOwnerFiler)

---

### Examples
> Example 1

Get-NcDiskOwner -Node VxeRubble-01
Get disk ownership info for node 'VxeRubble-01.

Name            SerialNumber              Owner           OwnerId
----            ------------              -----           -------
1a.02.0         6SJ0ZQWH0000N1347AG2      VxeRubble-01    151764873
1a.02.1         6SJ0ZY8C0000N133FUYG      VxeRubble-01    151764873
1a.02.10        6SJ12P8N0000N1363FDZ      VxeRubble-01    151764873
1a.02.11        6SJ0ZYHH0000N13403V9      VxeRubble-01    151764873
1a.02.12        6SJ17CZW0000N136BMBH      VxeRubble-01    151764873
1a.02.13        6SJ10YXB0000N1358UW1      VxeRubble-01    151764873
1a.02.14        6SJ0YWSB0000N134AF8H      VxeRubble-01    151764873
...

> Example 2

Get-NcDisk | Get-NcDiskOwner
Get-NcNode | Get-NcDiskOwner
Both of these examples will return disk ownership info for all disks in the cluster, although the second form is much faster.

Name            SerialNumber              Owner           OwnerId
----            ------------              -----           -------
1a.02.0         6SJ0ZQWH0000N1347AG2      VxeRubble-01    151764873
1a.02.1         6SJ0ZY8C0000N133FUYG      VxeRubble-01    151764873
1a.02.10        6SJ12P8N0000N1363FDZ      VxeRubble-01    151764873
1a.02.11        6SJ0ZYHH0000N13403V9      VxeRubble-01    151764873
1a.02.12        6SJ17CZW0000N136BMBH      VxeRubble-01    151764873
1a.02.13        6SJ10YXB0000N1358UW1      VxeRubble-01    151764873
1a.02.14        6SJ0YWSB0000N134AF8H      VxeRubble-01    151764873
1a.02.15        6SJ13KQ70000N135DE1Y      VxeRubble-01    151764873
1a.02.16        6SJ17EDH0000N1357FPM      VxeRubble-01    151764873
...

> Example 3

```PowerShell
Get-NcDiskOwner VxeRubble-01:1a.02.0
Get-NcDiskOwner 1a.02.0 -Node VxeRubble-01
Get-NcDisk VxeRubble-01:1a.02.0 | Get-NcDiskOwner
Each of these examples returns the ownership info for disk '1a.02.0' on node 'VxeRubble-01'.

Name       : 1a.02.0
SerialNo   : 6SJ0ZQWH0000N1347AG2
Owner      : VxeRubble-01
OwnerId    : 151764873
Home       : VxeRubble-01
HomeId     : 151764873
Pool       : 0
ReservedBy : 151764873
IsFailed   : False
Checksum   :
Type       : SAS

```

---

### Parameters
#### **Node**
The name of a node to query for disk ownership.  This parameter may also be specified if the Name parameter is not of the format "<Node Name>:<Disk Name>".

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|NodeName|

#### **OwnershipType**
Possible values:
'all' will list all disks.
'unowned' will list all disks without owners.
'owned' will list all disks with owners.
'visible' will list all disks belonging to the local and partner filer.
Default is 'all'.  If specific disk is specified, OwnershipType will be ignored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **Name**
The name of the disk to query.  The disk name should use the format "<Node Name>:<Disk Name>", such as "VxeRubble-01:1a.02.23".

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Disk<br/>DiskName|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Disk.DiskSanownDetailInfo

---

### Notes
Category: disk
API: disk-sanown-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcDiskOwner -Node <String> [-OwnershipType <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiskOwner [-Name] <String> -Node <String> [-OwnershipType <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
