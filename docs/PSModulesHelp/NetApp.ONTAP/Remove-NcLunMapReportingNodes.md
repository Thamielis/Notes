Remove-NcLunMapReportingNodes
-----------------------------

### Synopsis
Remove nodes from the list reporting the LUN map.

---

### Description

Remove nodes from the list reporting the LUN map. If no specific  action is provided, remove all nodes not in the current failover  group for the LUN.

---

### Related Links
* [Add-NcLunMapReportingNodes](Add-NcLunMapReportingNodes)

* [Get-NcLunMap](Get-NcLunMap)

---

### Examples
> Example 1

Remove-NcLunMapReportingNodes -Path /vol/san_vol/lun0 -InitiatorGroup ig0 -Nodes aparajir-vsim2
Removes aparajir-vsim2 from the list of notes reporting a mapping to lun0

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver               
----                                           ----   -------- --------     ------ ------  ----  -------               
/vol/san_vol/lun0                           39.2 MB          0 windows       True   True  False  pstk_san

---

### Parameters
#### **Path**
The path of the LUN.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **InitiatorGroup**
The initiator group the LUN is mapped to

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|InitiatorGroupName<br/>igroup|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Nodes**
The name of one or more nodes. When specified, remove the specific nodes and HA partners from the map.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
API: lun-map-remove-reporting-nodes
Family: vserver

---

### Syntax
```PowerShell
Remove-NcLunMapReportingNodes [-Path] <String> [-InitiatorGroup] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcLunMapReportingNodes [-Path] <String> [-InitiatorGroup] <String> [-Nodes <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
