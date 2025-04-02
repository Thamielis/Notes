Get-NcStorageArrayConfig
------------------------

### Synopsis
Obtain a high level summary of array LUN pathing (connectivity) information.

---

### Description

Obtain a high level summary of array LUN pathing (connectivity) information.

---

### Related Links
* [Get-NcStorageArray](Get-NcStorageArray)

---

### Examples
> Example 1

Get-NcStorageArrayConfig
Get a summary of storage array configurations

Array Name                      Lun Count  Lun Group Array Target Port                           Initiator
----------                      ---------  --------- -----------------                           ---------
EMC_SYMMETRIX_1                        13          0 50060480000001a0                            v2
EMC_SYMMETRIX_1                        13          0 50060480000001a1                            v0
EMC_SYMMETRIX_1                        13          0 50060480000001a0                            v2
EMC_SYMMETRIX_1                        13          0 50060480000001a1                            v0

---

### Parameters
#### **Node**
Specify to obtain array LUN pathing information for a specified node.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|NodeName|

#### **OwnershipType**
Specify to filter by ownership type.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageArray.StorageArrayConfigSummary

---

### Notes
Category: storage array
API: storage-array-get-config-summary
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageArrayConfig [-Node <String>] [-OwnershipType <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
