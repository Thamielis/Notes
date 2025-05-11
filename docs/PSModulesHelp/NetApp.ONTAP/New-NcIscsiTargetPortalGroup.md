New-NcIscsiTargetPortalGroup
----------------------------

### Synopsis
Create a new user defined target portal group.

---

### Description

Create a new user defined target portal group.

---

### Related Links
* [Get-NcIscsiTargetPortalGroup](Get-NcIscsiTargetPortalGroup)

* [Remove-NcIscsiTargetPortalGroup](Remove-NcIscsiTargetPortalGroup)

---

### Examples
> Example 1

```PowerShell
New-NcIscsiTargetPortalGroup tpGroup1
Create a new target portal group named tpGroup1.

Vserver              : dlamotta01
InterfaceListEntries :
IsUserDefined        : True
TpgroupName          : tpGroup1
TpgroupTag           : 1

```

---

### Parameters
#### **Name**
Name of new user defined target portal group. Name must be less than or equal to 32 characters. User defined target portal groups cannot use the name of any defined logical interfaces (LIFs) in the vserver as this would conflict with names of default target portal groups.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|TpGroupName|

#### **Tag**
Target portal group tag supplied by user. Default value is system generated.

|Type     |Required|Position|PipelineInput        |Aliases   |
|---------|--------|--------|---------------------|----------|
|`[Int32]`|false   |2       |true (ByPropertyName)|TpGroupTag|

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
API: iscsi-tpgroup-create
Family: vserver

---

### Syntax
```PowerShell
New-NcIscsiTargetPortalGroup [-Name] <String> [[-Tag] <Int32>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
