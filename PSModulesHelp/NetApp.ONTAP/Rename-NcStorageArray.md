Rename-NcStorageArray
---------------------

### Synopsis
Rename an array profile on the controller.

---

### Description

Rename an array profile on the controller.

---

### Related Links
* [Get-NcStorageArray](Get-NcStorageArray)

* [Set-NcStorageArray](Set-NcStorageArray)

---

### Examples
> Example 1

Rename-NcStorageArray -ArrayName EMC_SYMMETRIX_1 -NewName Test
Rename an array

Array Name                     Prefix     Model                Vendor                 Options
----------                     ------     -----                ------                 -------
Test                           EMC-1      SYMMETRIX            EMC

---

### Parameters
#### **ArrayName**
The name of the array profile to update.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Name<br/>OldName|

#### **NewName**
The new name to assign to this array profile.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
API: storage-array-rename
Family: cluster

---

### Syntax
```PowerShell
Rename-NcStorageArray [-ArrayName] <String> [-NewName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
