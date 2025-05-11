Get-NcLunMapByInitiator
-----------------------

### Synopsis
List all the LUNs mapped to an initiator.

---

### Description

List all the LUNs mapped to an initiator.

---

### Related Links
* [Get-NcLunMap](Get-NcLunMap)

---

### Examples
> Example 1

```PowerShell
Get-NcLunMapByInitiator iqn.1991-05.com.microsoft:x3550rre7.rtprre.testdomain
Get map info for LUNs mapped to the initiator on server 'x3550rre7'.

NcController       : costea01
Vserver            : costea01
InitiatorGroup     : x3550rre7
InitiatorGroupUuid : 992400dc-f673-11e0-a7a0-123478563412
LunId              : 0
LunUuid            : 5af624c3-f673-11e0-a7a0-123478563412
Path               : /vol/testvol/testlun

```

---

### Parameters
#### **Initiator**
The initiator to check.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |1       |true (ByPropertyName)|InitiatorName|

#### **SupportsIgroups**
Specify supports_igroups. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Protocol**
Specify protocol. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PortsetName**
Specify PortsetName. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Comment**
Specify Comment. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParentIgroupsComment**
Specify ParentIgroupsComment. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParentIgroupsName**
Specify ParentIgroupsName. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParentIgroupsUuid**
Specify ParentIgroupsUuid. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InitiatorsIgroupName**
Specify InitiatorsIgroupName. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InitiatorsIgroupUuid**
Specify InitiatorsIgroupUuid. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IgroupName**
Specify IgroupName. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IgroupUuid**
Specify IgroupUuid. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **InitiatorsComments**
Specify InitiatorsComments. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Initiators_Connectivity_tracking_Connection_state**
Specify Initiators_Connectivity_tracking_Connection_state. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PortsetUuid**
Specify PortsetUuid. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TargetFirmwareRevision**
Specify TargetFirmwareRevision. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TargetProductId**
Specify TargetProductId. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TargetVendorId**
Specify TargetVendorId. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OsType**
Specify OsType. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LunMaplogicalunitnumber**
Specify LunMaplogicalunitnumber. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LunMapLunName**
Specify LunMapLunName. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LunMapLunUuid**
Specify LunMapLunUuid. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LunMapNodeName**
Specify LunMapNodeName. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LunMapNodeUuid**
Specify LunMapNodeUuid. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectivityTracking_ConnectionState**
Specify ConnectivityTracking_ConnectionState. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectivityTracking_Alerts_Summary_Code**
Specify ConnectivityTracking_Alerts_Summary_Code. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectivityTracking_Alerts_Summary_Arguments_Message**
Specify ConnectivityTracking_Alerts_Summary_Arguments_Message. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectivityTracking_Alerts_Summary_Arguments_Code**
Specify ConnectivityTracking_Alerts_Summary_Arguments_Code. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectivityTracking_Alerts_Summary_Target**
Specify ConnectivityTracking_Alerts_Summary_Target. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectivityTracking_Alerts_Summary_Message**
Specify ConnectivityTracking_Alerts_Summary_Message. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectivityTracking_RequiredNodes_Uuid**
Specify ConnectivityTracking_RequiredNodes_Uuid. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectivityTracking_RequiredNodes_Name**
Specify ConnectivityTracking_RequiredNodes_Name. This parameter is supported with Rest only

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
* DataONTAP.C.Types.Lun.LunMapInfo

---

### Notes
Category: lun
API: lun-initiator-list-map-info
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLunMapByInitiator [-Initiator] <String> [-SupportsIgroups <String>] [-Protocol <String>] [-PortsetName <String>] [-Comment <String>] [-ParentIgroupsComment <String>] [-ParentIgroupsName 
```
```PowerShell
<String>] [-ParentIgroupsUuid <String>] [-InitiatorsIgroupName <String>] [-InitiatorsIgroupUuid <String>] [-IgroupName <String>] [-IgroupUuid <String>] [-InitiatorsComments <String>] 
```
```PowerShell
[-Initiators_Connectivity_tracking_Connection_state <String>] [-PortsetUuid <String>] [-TargetFirmwareRevision <String>] [-TargetProductId <String>] [-TargetVendorId <String>] [-OsType 
```
```PowerShell
<String>] [-LunMaplogicalunitnumber <String>] [-LunMapLunName <String>] [-LunMapLunUuid <String>] [-LunMapNodeName <String>] [-LunMapNodeUuid <String>] [-ConnectivityTracking_ConnectionState 
```
```PowerShell
<String>] [-ConnectivityTracking_Alerts_Summary_Code <String>] [-ConnectivityTracking_Alerts_Summary_Arguments_Message <String>] [-ConnectivityTracking_Alerts_Summary_Arguments_Code <String>] 
```
```PowerShell
[-ConnectivityTracking_Alerts_Summary_Target <String>] [-ConnectivityTracking_Alerts_Summary_Message <String>] [-ConnectivityTracking_RequiredNodes_Uuid <String>] 
```
```PowerShell
[-ConnectivityTracking_RequiredNodes_Name <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
