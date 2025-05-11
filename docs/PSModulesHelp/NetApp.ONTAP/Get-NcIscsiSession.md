Get-NcIscsiSession
------------------

### Synopsis
Get a list of iSCSI session objects.

---

### Description

Get a list of iSCSI session objects.

---

### Examples
> Example 1

```PowerShell
Get-NcIscsiSession -TpGroupName Kumar_iscsi_lif
Get the iSCSI sessions on the target portal group Kumar_iscsi_lif.

CmdWindowSize                     : 128
DataPduInOrder                    : True
DataSequenceInOrder               : True
DefaultTimeToRetain               : 20
DefaultTimeToRetainTS             : 00:00:20
DefaultTimeToWait                 : 0
DefaultTimeToWaitTS               : 00:00:00
ErrorRecoveryLevel                : 0
FirstBurstLength                  : 65536
ImmediateDataEnabled              : True
InitialR2tEnabled                 : False
InitiatorAliasname                :
InitiatorNodename                 : iqn.1991-05.com.microsoft:exch2010-02.exch2010.local
IscsiSessionConnectionListEntries : {Kumar_iscsi_lif}
IscsiSesssionCmdListEntries       :
Isid                              : 40:00:01:37:00:01
MaxBurstLength                    : 65536
MaxConnections                    : 4
MaxOutstandingR2t                 : 1
SessionType                       : normal
TargetSessionId                   : 18
TpgroupName                       : Kumar_iscsi_lif
TpgroupTag                        : 1101
Vserver                           : Kumar01
DataPduInOrderSpecified           : True
DataSequenceInOrderSpecified      : True
ImmediateDataEnabledSpecified     : True
InitialR2tEnabledSpecified        : True

```
> Example 2

$q = Get-NcIscsiSession -Template
$q.SessionType = "normal"
Get-NcIscsiSession -Query $q
Get all of the normal session types on the current cluster.

InitiatorNodeName                                         TargetSessionId TpGroupName          SessionType    Vserver
-----------------                                         --------------- -----------          -----------    -------
iqn.1991-05.com.microsoft:sharepoint.sea-tm.netapp.com                 10 Cerebus-03_iscsi_if1 normal         Barker01
iqn.1991-05.com.microsoft:fred.sea-tm.netapp.com                       19 Cerebus-03_iscsi_if1 normal         Barker01
iqn.1991-05.com.microsoft:barney.sea-tm.netapp.com                     20 Cerebus-03_iscsi_if1 normal         Barker01
iqn.1991-05.com.microsoft:exch2010-02.exch2010.local                   18 Kumar_iscsi_lif      normal         Kumar01
iqn.1991-05.com.microsoft:exch2010-01.exch2010.local                   19 Kumar_iscsi_lif      normal         Kumar01
iqn.1991-05.com.microsoft:exch2010-01.exch2010.local                   20 Kumar_iscsi_lif      normal         Kumar01
iqn.1991-05.com.microsoft:exch2010-01.exch2010.local                   21 Kumar_iscsi_lif      normal         Kumar01

---

### Parameters
#### **SessionId**
The iSCSI session identifier.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|TargetSessionId|

#### **TpGroupName**
The name of the target portal group associated with this session.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **TpGroupTag**
The tag of the target portal group associated with this session.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Initiator**
Name of the initiator.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|InitiatorNodeName|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiSessionListEntryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiSession -Template" to get the initially empty IscsiSessionListEntryInfo object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[IscsiSessionListEntryInfo]`|false   |named   |false        |

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
Specify to get an empty IscsiSessionListEntryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiSessionListEntryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiSession -Template" to get the initially empty IscsiSessionListEntryInfo object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[IscsiSessionListEntryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiSessionListEntryInfo

---

### Notes
Category: iscsi
API: iscsi-session-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiSession [[-SessionId] <String[]>] [[-TpGroupName] <String[]>] [[-TpGroupTag] <String[]>] [[-Initiator] <String[]>] [-Attributes <IscsiSessionListEntryInfo>] [-VserverContext 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiSession -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiSession -Query <IscsiSessionListEntryInfo> [-Attributes <IscsiSessionListEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
