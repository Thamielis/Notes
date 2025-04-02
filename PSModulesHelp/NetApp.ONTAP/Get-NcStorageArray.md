Get-NcStorageArray
------------------

### Synopsis
Retrieves a list of all array profiles known to the controller.

---

### Description

Retrieves a list of all array profiles known to the controller.

---

### Related Links
* [Set-NcStorageArray](Set-NcStorageArray)

* [Rename-NcStorageArray](Rename-NcStorageArray)

---

### Examples
> Example 1

Get-NcStorageArray
Get all storage arrays attached to this cluster

Array Name                     Prefix     Model                Vendor                 Options
----------                     ------     -----                ------                 -------
EMC_SYMMETRIX_1                EMC-1      SYMMETRIX            EMC
VMware_Virtualdisk_1           VMw-1      Virtualdisk          VMware

---

### Parameters
#### **ArrayName**
Specify to get only the named array profile record.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|Name   |

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
* DataONTAP.C.Types.StorageArray.StorageArrayProfile

---

### Notes
Category: storage array
API: storage-array-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageArray [-ArrayName <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
