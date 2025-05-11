Get-NcStorageAdapterInfo
------------------------

### Synopsis
Display the information about a specified host adapter.

---

### Description

Display the information about a specified host adapter.  The information is displayed base on the controller interface type: ATA, Parallel SCSI, SAS, FC.

---

### Related Links
* [Get-NcStorageAdapter](Get-NcStorageAdapter)

* [Enable-NcStorageAdapter](Enable-NcStorageAdapter)

---

### Examples
> Example 1

(Get-NcStorageAdapterInfo 1a).AdapterDetailInfo.AdapterSas.AdapterSasInfo
List the details of SAS adapter '1a'.

NcController                  : VxeRubble
AdapterBoardRevision          : MP V4.1
AdapterDateCode               : 20110315
AdapterFamily                 : PM8001
AdapterManufacturer           : USI
AdapterManufacturerPartNumber : 6086-000010-00
AdapterModel                  : PMC-Sierra PM8001
AdapterPartNumber             : 111-00341
AdapterSerialNumber           : ST078B3F09X
AdapterSlot                   : 1
AdapterState                  : up
AdapterVendor                 : pmc_sierra
BaseWwn                       : 5:00e004:000155c:c8
FirmwareRev                   : 01.11.00.00
HardwareRev                   : C
IsEnabled                     : True
IsInUse                       : True
IsRedundant                   : False
SasPhy                        : {DataONTAP.C.Types.StorageAdapter.PhyStateInfo, DataONTAP.C.Types.StorageAdapter.PhyStateInfo, DataONTAP.C.Types.StorageAdapter.PhyStateInfo, DataONTAP.C.Types.StorageAdapter.PhyStateInfo}
SasQsfpCable                  : DataONTAP.C.Types.StorageAdapter.SasQsfpCable

---

### Parameters
#### **Name**
The adapter name is either a slot number, or, if a port letter is also presented, a slot number and port letter concatenated into a single name, for example '8a' or '11b'.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|AdapterName|

#### **Node**
The node this command will be executed on.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |2       |true (ByPropertyName)|NodeName|

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
* DataONTAP.C.Types.StorageAdapter.AdapterDetails

---

### Notes
Category: storage adapter
API: storage-adapter-get-adapter-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageAdapterInfo [-Name] <String> [[-Node] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
