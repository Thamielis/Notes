Set-NcStorageArray
------------------

### Synopsis
Update an array profile with new or changed information.

---

### Description

Update an array profile with new or changed information.

---

### Related Links
* [Get-NcStorageArray](Get-NcStorageArray)

* [Rename-NcStorageArray](Rename-NcStorageArray)

---

### Examples
> Example 1

Set-NcStorageArray -ArrayName EMC_SYMMETRIX_1 -Options a
Set options on an array

Array Name                     Prefix     Model                Vendor                 Options
----------                     ------     -----                ------                 -------
EMC_SYMMETRIX_1                EMC-1      SYMMETRIX            EMC                    a

---

### Parameters
#### **ArrayName**
The name of the array profile to update.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **AllPathFailDelay**
The time delay to hold IO during All Path Failure Event. Format <number><units>, eg 2s, 2m and 2h.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsUpgradePending**
Used to indicate that the specified array will under go an upgrade in the near future.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **LunQueueDepth**
The queue depth assigned to array LUNs from this array.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **MaxQueueDepth**
The target port queue depth for all target ports on this array.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Model**
The model of the array.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Options**
Array profile specific options.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PathFailoverTime**
The time delay before switching the I/O path when the path is deleted. Format <number><units>, eg 2s, 2m and 2h

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Prefix**
A short label used to refer to this array.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vendor**
The name of the array's manufacturer.

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
* DataONTAP.C.Types.StorageArray.StorageArrayProfile

---

### Notes
Category: storage array
API: storage-array-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcStorageArray [-ArrayName] <String> [-AllPathFailDelay <String>] [-IsUpgradePending <Boolean>] [-LunQueueDepth <Int64>] [-MaxQueueDepth <Int64>] [-Model <String>] [-Options <String>] 
```
```PowerShell
[-PathFailoverTime <String>] [-Prefix <String>] [-Vendor <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
