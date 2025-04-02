Add-NcIscsiTargetPortalGroupInterface
-------------------------------------

### Synopsis
Add an interface to a target portal group. Interfaces may only be added to a user defined target portal group.

---

### Description

Add an interface to a target portal group. Interfaces may only be added to a user defined target portal group.

---

### Related Links
* [Remove-NcIscsiTargetPortalGroupInterface](Remove-NcIscsiTargetPortalGroupInterface)

---

### Examples
> Example 1

```PowerShell
Add-NcIscsiTargetPortalGroupInterface 1 costea01_lif_data3
Add the data LIF costea01_lif_data3 to the target portal group with tag 1.

InterfaceListEntries   : {costea01_lif_data3}
IsUserDefined          : True
TpgroupName            : tpGroup1
TpgroupTag             : 1
Vserver                : costea01
IsUserDefinedSpecified : True

```

---

### Parameters
#### **Tag**
Target portal group tag.

|Type     |Required|Position|PipelineInput        |Aliases   |
|---------|--------|--------|---------------------|----------|
|`[Int32]`|true    |1       |true (ByPropertyName)|TpGroupTag|

#### **Interface**
Name of one or more network interfaces to add. This is the name of an iSCSI data LIF in the Vserver.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|true    |2       |true (ByPropertyName)|Interfaces|

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
* DataONTAP.C.Types.Iscsi.IscsiTpgroupListEntryInfo

---

### Notes
Category: iscsi
API: iscsi-tpgroup-interface-add
Family: vserver

---

### Syntax
```PowerShell
Add-NcIscsiTargetPortalGroupInterface [-Tag] <Int32> [-Interface] <String[]> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
