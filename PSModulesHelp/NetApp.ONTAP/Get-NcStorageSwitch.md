Get-NcStorageSwitch
-------------------

### Synopsis
Iterate over a list of storage-switch objects.

---

### Description

Iterate over a list of storage-switch objects.

---

### Parameters
#### **Name**
Name of the storage switch(es) for which information is to be retrieved.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|SwitchName|

#### **Vendor**
Restrict results by vendor.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |named   |true (ByPropertyName)|VendorName|

#### **IPAddress**
Restrict results to switches with specific IPs.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Status**
Restrict results to switches in particular state(s): unknown, ok, error.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|State  |

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[StorageSwitchInfo]`|false   |named   |false        |

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

#### **Template**
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[StorageSwitchInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageSwitch.StorageSwitchInfo

---

### Notes
Category: storage switch
API: storage-switch-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageSwitch [[-Name] <String[]>] [-Vendor <String[]>] [-IPAddress <String[]>] [-Status <String[]>] [-Attributes <StorageSwitchInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageSwitch -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcStorageSwitch -Query <StorageSwitchInfo> [-Attributes <StorageSwitchInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
