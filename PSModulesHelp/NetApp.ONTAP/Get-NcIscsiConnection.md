Get-NcIscsiConnection
---------------------

### Synopsis
Get a list of iSCSI Connection objects.

---

### Description

Get a list of iSCSI Connection objects.

---

### Examples
> Example 1

```PowerShell
Get-NcIscsiConnection
Get all of the iSCSI connections on the current cluster.

ConnectionId    : 1
ConnectionState : full_feature_phase
HasSession      : True
InterfaceName   : Cerebus-03_iscsi_if1
LocalIpAddress  : 10.58.92.202
LocalIpPort     : 3260
RemoteIpAddress : 10.58.94.21
RemoteIpPort    : 49152
SessionId       : 20
TpgroupName     : Cerebus-03_iscsi_if1
TpgroupTag      : 1067
Vserver         : Barker01

```
> Example 2

$q = Get-NcIscsiConnection -Template
$q.ConnectionState = "full_feature_phase"
Get-NcIscsiConnection -Query $q
Get all of the iSCSI connections in the "full_feature_phase" connection state.

ConnectionId  InterfaceName              RemoteIpAddress    ConnectionState              Vserver
------------  -------------              ---------------    ---------------              -------
     1        Cerebus-03_iscsi_if1       10.58.94.21        full_feature_phase           Barker01
     1        Cerebus-03_iscsi_if1       10.58.94.183       full_feature_phase           Barker01
     1        Cerebus-03_iscsi_if1       10.58.94.103       full_feature_phase           Barker01
     1        Kumar_iscsi_lif            10.58.93.185       full_feature_phase           Kumar01
     1        Kumar_iscsi_lif            10.58.93.185       full_feature_phase           Kumar01
     1        Kumar_iscsi_lif            10.58.93.186       full_feature_phase           Kumar01
     1        Kumar_iscsi_lif            10.58.93.185       full_feature_phase           Kumar01

---

### Parameters
#### **ConnectionId**
The iSCSI connection identifier.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **SessionId**
The iSCSI session identifier.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|TargetSessionId|

#### **TpGroupName**
The name of the target portal group associated with this session.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **TpGroupTag**
The tag of the target portal group associated with this session.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiConnectionListEntryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiConnection -Template" to get the initially empty IscsiConnectionListEntryInfo object.  If not specified, all data is returned for each object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[IscsiConnectionListEntryInfo]`|false   |named   |false        |

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
Specify to get an empty IscsiConnectionListEntryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiConnectionListEntryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiConnection -Template" to get the initially empty IscsiConnectionListEntryInfo object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[IscsiConnectionListEntryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiConnectionListEntryInfo

---

### Notes
Category: iscsi
API: iscsi-connection-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiConnection [[-ConnectionId] <String[]>] [[-SessionId] <String[]>] [[-TpGroupName] <String[]>] [[-TpGroupTag] <String[]>] [-Attributes <IscsiConnectionListEntryInfo>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcIscsiConnection -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiConnection -Query <IscsiConnectionListEntryInfo> [-Attributes <IscsiConnectionListEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
