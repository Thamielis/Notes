Start-NcDiskUpdate
------------------

### Synopsis
Start disk firmware download process to update firmware on disks.

---

### Description

Start disk firmware download process to update firmware on disks.  This operation is asynchronous and therefore returns no errors that might occur during the download process.  This operation will only update firmware on disks that do not have the latest firmware revision.  The firmware revision on the disk can be monitored via Get-NcDisk.

---

### Related Links
* [Get-NcDisk](Get-NcDisk)

* [Get-NcNode](Get-NcNode)

---

### Examples
> Example 1

```PowerShell
Start-NcDiskUpdate -Node VxeRubble-01
Update all disks on node 'VxeRubble-01'.
```
> Example 2

```PowerShell
Start-NcDiskUpdate VxeRubble-01:1a.02.23
Get-NcDisk VxeRubble-01:1a.02.23 | Start-NcDiskUpdate
Start-NcDiskUpdate 1a.02.23 -Node VxeRubble-01
These three commands all behave identically: update disk '1a.02.23' on node 'VxeRubble-01'.
```
> Example 3

```PowerShell
Get-NcNode VxeRubble-* | Start-NcDiskUpdate
Update all disks on nodes with names matching 'VxeRubble-*'.
```

---

### Parameters
#### **Node**
The name of a node on which to update all disks.  This parameter may also be specified if the Name parameter is not of the format "<Node Name>:<Disk Name>".

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|NodeName|

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
The name of the disk to update.  The disk name should use the format "<Node Name>:<Disk Name>", such as "VxeRubble-01:1a.02.23".

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Disk<br/>DiskName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: disk
API: disk-update-disk-fw
Family: cluster

---

### Syntax
```PowerShell
Start-NcDiskUpdate -Node <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Start-NcDiskUpdate [-Name] <String> -Node <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
