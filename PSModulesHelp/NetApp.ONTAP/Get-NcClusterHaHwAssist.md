Get-NcClusterHaHwAssist
-----------------------

### Synopsis
Get useful information about the status of hw_assist functionality.

---

### Description

Get useful information about the status of hw_assist functionality.

---

### Related Links
* [Get-NcClusterHaHwAssistStats](Get-NcClusterHaHwAssistStats)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterHaHwAssist -Node sfp-cmode-02-01
Get the status of the hw assist functionality.

NoStatus                                :
LocalHwAssistStatus                     : active
LocalHwAssistIpaddr                     : 10.63.165.54
LocalHwAssistPort                       : 4444
LocalHwAssistInactiveReason             :
LocalHwAssistInactiveCorrectiveAction   :
PartnerHwAssistStatus                   : active
PartnerHwAssistIpaddr                   : 10.63.165.56
PartnerHwAssistPort                     : 4444
PartnerHwAssistInactiveReason           :
PartnerHwAssistInactiveCorrectiveAction :
KeepAliveStatus                         : healthy

```

---

### Parameters
#### **Node**
Node name for which the API is requested.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cf.ClusterHaHwAssistStatus

---

### Notes
Category: cf
API: cf-hwassist-status
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterHaHwAssist [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
