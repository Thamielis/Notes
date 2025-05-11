Get-NcIscsiTargetPortalGroup
----------------------------

### Synopsis
Get iSCSI Target Portal Groups.

---

### Description

Get iSCSI Target Portal Groups.

---

### Related Links
* [Remove-NcIscsiTargetPortalGroup](Remove-NcIscsiTargetPortalGroup)

* [New-NcIscsiTargetPortalGroup](New-NcIscsiTargetPortalGroup)

---

### Examples
> Example 1

```PowerShell
Get-NcIscsiTargetPortalGroup
Get all the iSCSI target portal groups on the current cluster.

Vserver              : costea01
InterfaceListEntries : {costea01_lif_data3}
IsUserDefined        : False
TpgroupName          : costea01_lif_data3
TpgroupTag           : 1031

Vserver              : iscsivs1
InterfaceListEntries : {iscsivs1_data1}
IsUserDefined        : False
TpgroupName          : iscsivs1_data1
TpgroupTag           : 1043

```
> Example 2

```PowerShell
$q = Get-NcIscsiTargetPortalGroup -Template
$q.IsUserDefined = $true
Get-NcIscsiTargetPortalGroup -Query $q
Get all of the user-defined target portal groups from the current cluster.

Vserver              : iscsivs1
InterfaceListEntries : {iscsivs1_data1}
IsUserDefined        : True
TpgroupName          : iscsivs1_tpgroup1
TpgroupTag           : 1045

```

---

### Parameters
#### **Name**
The portal group name.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|TpGroupName|

#### **Tag**
The portal group tag.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|TpGroupTag|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiTpgroupListEntryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiTargetPortalGroup -Template" to get the initially empty IscsiTpgroupListEntryInfo object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[IscsiTpgroupListEntryInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty IscsiTpgroupListEntryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiTpgroupListEntryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiTargetPortalGroup -Template" to get the initially empty IscsiTpgroupListEntryInfo object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[IscsiTpgroupListEntryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiTpgroupListEntryInfo

---

### Notes
Category: iscsi
API: iscsi-tpgroup-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiTargetPortalGroup [[-Name] <String[]>] [[-Tag] <String[]>] [-Attributes <IscsiTpgroupListEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiTargetPortalGroup -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiTargetPortalGroup -Query <IscsiTpgroupListEntryInfo> [-Attributes <IscsiTpgroupListEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
