Get-NcIscsiInitiator
--------------------

### Synopsis
Get a list of remote iSCSI initiator objects.

---

### Description

Get a list of remote iSCSI initiator objects.

---

### Examples
> Example 1

```PowerShell
Get-NcIscsiInitiator
Get all the remote initiators connected to the current cluster.

InitiatorAliasname :
InitiatorGroupList : {viaRPC.iqn.1991-05.com.microsoft:exch2010-01.exch2010.local}
InitiatorNodename  : iqn.1991-05.com.microsoft:exch2010-01.exch2010.local
Isid               : 40:00:01:37:00:01
TargetSessionId    : 19
TpgroupName        : Kumar_iscsi_lif
TpgroupTag         : 1101
Vserver            : Kumar01

```
> Example 2

$q = Get-NcIscsiInitiator -Template
$q.TargetSessionId = 20
Get-NcIscsiInitiator -Query $q
Get all the remote iSCSI initiators connected with a session ID of 20 in the current cluster.

InitiatorNodeName                                      TpGroupName                 TargetSessionId Vserver
-----------------                                      -----------                 --------------- -------
iqn.1991-05.com.microsoft:barney.sea-tm.netapp.com     Cerebus-03_iscsi_if1                     20 Barker01
iqn.1991-05.com.microsoft:exch2010-01.exch2010.local   Kumar_iscsi_lif                          20 Kumar01

---

### Parameters
#### **Initiator**
Name of the initiator.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|InitiatorNodeName|

#### **InitiatorAlias**
Alias of the initiator.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|InitiatorAliasName|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiInitiatorListEntryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiInitiator -Template" to get the initially empty IscsiInitiatorListEntryInfo object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[IscsiInitiatorListEntryInfo]`|false   |named   |false        |

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
Specify to get an empty IscsiInitiatorListEntryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiInitiatorListEntryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiInitiator -Template" to get the initially empty IscsiInitiatorListEntryInfo object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[IscsiInitiatorListEntryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiInitiatorListEntryInfo

---

### Notes
Category: iscsi
API: iscsi-initiator-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiInitiator [[-Initiator] <String[]>] [[-InitiatorAlias] <String[]>] [-Attributes <IscsiInitiatorListEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiInitiator -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiInitiator -Query <IscsiInitiatorListEntryInfo> [-Attributes <IscsiInitiatorListEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
