Start-NcAggrVerify
------------------

### Synopsis
Start RAID mirror verification on the named aggregate.

---

### Description

Start RAID mirror verification on the named aggregate. Verification compares the data in both plexes of a mirrored aggregate.  In the default case, any blocks that differ are logged and no changes are made. The FixPlex option is used to fix any mismatches. It specifies which plex to fix.

If no name is given, then mirror verification is started on all online aggregates.  Use the Get-NcAggrVerify cmdlet to check mirror verification status. If the FixPlex option is used, then a name must be specified.

---

### Related Links
* [Get-NcAggrVerify](Get-NcAggrVerify)

* [Suspend-NcAggrVerify](Suspend-NcAggrVerify)

* [Resume-NcAggrVerify](Resume-NcAggrVerify)

* [Stop-NcAggrVerify](Stop-NcAggrVerify)

---

### Examples
> Example 1

Start-NcAggrVerify -Name aggr0_mcc1
Start the aggregate mirror verification on the given aggregate.

Name                        IsSuspended       PercentageComplete
----                        -----------       ------------------
aggr0_mcc1                      True                          1%

---

### Parameters
#### **Name**
The name of the aggregate for which to start RAID mirror verification.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **FixPlex**
The plex to fix in case the two plexes do not match.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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
* DataONTAP.C.Types.Aggr.VerifyDetailInfo

---

### Notes
Category: aggr
API: aggr-verify-start
Family: cluster

---

### Syntax
```PowerShell
Start-NcAggrVerify [[-Name] <String>] [-FixPlex <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
