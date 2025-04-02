Start-NcDiskZeroSpare
---------------------

### Synopsis
Set up all non-zeroed spares owned by the filer to start zeroing.

---

### Description

Set up all non-zeroed spares owned by the filer to start zeroing.  This operation is asynchronous and therefore returns no errors that might occur when the zeroing operation actually starts, which could be several seconds after this API operation completes.  Zeroing progress can be monitored via Get-NcDisk.

---

### Related Links
* [Get-NcDisk](Get-NcDisk)

* [Get-NcNode](Get-NcNode)

---

### Examples
> Example 1

```PowerShell
Start-NcDiskZeroSpare
Zero all unzeroed spare disks in the cluster.
```
> Example 2

```PowerShell
Get-NcNode VxeRubble-* | Start-NcDiskZeroSpare
Zero spares on all nodes with names matching 'VxeRubble-*'.
```

---

### Parameters
#### **Node**
The name of a node on which to zero spares.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |1       |true (ByPropertyName)|NodeName|

#### **UsePhysicalZeroing**
If set to true, the ZAPI will not use fast zeroing, even if the nodes(s) owning the disks have the feature enabled. This will usually lead to much longer completion times.
This parameter is available in ONTAP 9.3 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
* 

---

### Notes
Category: disk
API: disk-zero-spares
Family: cluster

---

### Syntax
```PowerShell
Start-NcDiskZeroSpare [[-Node] <String>] [-UsePhysicalZeroing <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
