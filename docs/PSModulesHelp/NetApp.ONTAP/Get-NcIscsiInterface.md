Get-NcIscsiInterface
--------------------

### Synopsis
Get a list of iSCSI target interface objects.

---

### Description

Get a list of iSCSI target interface objects.

---

### Related Links
* [Enable-NcIscsiInterface](Enable-NcIscsiInterface)

* [Disable-NcIscsiInterface](Disable-NcIscsiInterface)

---

### Examples
> Example 1

```PowerShell
Get-NcIscsiInterface
Get all the iscsi interfaces on the current cluster.

CurrentNode                 : VxeRubble-01
CurrentPort                 : e0a
InterfaceName               : costea01_lif_data3
IpAddress                   : 10.60.189.144
IpPort                      : 3260
IsInterfaceEnabled          : True
RelativePortId              : 1
TpgroupName                 : costea01_lif_data3
TpgroupTag                  : 1031
Vserver                     : costea01
IsInterfaceEnabledSpecified : True

CurrentNode                 : VxeRubble-01
CurrentPort                 : e0a
InterfaceName               : iscsivs1_data1
IpAddress                   : 10.60.189.178
IpPort                      : 3260
IsInterfaceEnabled          : True
RelativePortId              : 1
TpgroupName                 : iscsivs1_data1
TpgroupTag                  : 1043
Vserver                     : iscsivs1
IsInterfaceEnabledSpecified : True

```
> Example 2

```PowerShell
$q = Get-NcIscsiInterface -Template
$q.CurrentNode = "VxeRubble-01"
Get-NcIscsiInterface -Query $q
Get all the iscsi interfaces on the node "VxeRubble-01."
```

---

### Parameters
#### **Name**
The name of the interface.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|InterfaceName|

#### **IpAddress**
The IP address of the interface.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiInterfaceListEntryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiInterface -Template" to get the initially empty IscsiInterfaceListEntryInfo object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[IscsiInterfaceListEntryInfo]`|false   |named   |false        |

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
Specify to get an empty IscsiInterfaceListEntryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiInterfaceListEntryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiInterface -Template" to get the initially empty IscsiInterfaceListEntryInfo object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[IscsiInterfaceListEntryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiInterfaceListEntryInfo

---

### Notes
Category: iscsi
API: iscsi-interface-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiInterface [[-Name] <String[]>] [[-IpAddress] <String[]>] [-Attributes <IscsiInterfaceListEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiInterface -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiInterface -Query <IscsiInterfaceListEntryInfo> [-Attributes <IscsiInterfaceListEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
