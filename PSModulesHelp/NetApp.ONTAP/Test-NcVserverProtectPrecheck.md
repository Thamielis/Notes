Test-NcVserverProtectPrecheck
-----------------------------

### Synopsis
Check source vserver for creating svmdr Relationship

---

### Description

Check source vserver for creating svmdr Relationship

---

### Examples
> Example 1

Test-NcVserverProtectPrecheck -Cluster 6abf7fc6-d1d5-11e8-a254-005056a71fce -VserverName C1_sti48-vsim-ucs523i_1539759404 -VserverUuid 75629140-d1d5-11e8-a254-005056a71fce
Checks source vserver for creating svdmr relationship

NcController                                                    PreCheckSuccess SvdmrPreCheckErrorCodes
------------                                                    --------------- -----------------------
10.236.50.235                                                              True {13001}

---

### Parameters
#### **Cluster**
Specifies Uuid of the peer Cluster.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **VserverName**
Vserver

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **VserverUuid**
Vserver UUID

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Vserver.VserverProtectPreCheckInfo

---

### Notes
Category: vserver
API: vserver-protect-precheck
Family: ontap-cluster

---

### Syntax
```PowerShell
Test-NcVserverProtectPrecheck [-Cluster] <String> [-VserverName] <String> [-VserverUuid] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
