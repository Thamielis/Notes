Test-NcVserverProtectPrecheckVgeSupport
---------------------------------------

### Synopsis
Check source cluster for creating svmdr Relationship of type Vge

---

### Description

Check source cluster for creating svmdr Relationship of type Vge

---

### Examples
> Example 1

Test-NcVserverProtectPrecheckVgeSupport -Cluster 6abf7fc6-d1d5-11e8-a254-005056a71fce
Check source cluster for creating svmdr Relationship of type Vge

NcController                                                                                                  IsEnabled
------------                                                                                                  ---------
10.236.50.235                                                                                                     False

---

### Parameters
#### **Cluster**
Specifies Uuid of the peer Cluster.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverProtectPreCheckVgeSupportInfo

---

### Notes
Category: vserver
API: vserver-protect-precheck-vge-support
Family: ontap-cluster

---

### Syntax
```PowerShell
Test-NcVserverProtectPrecheckVgeSupport [-Cluster] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
