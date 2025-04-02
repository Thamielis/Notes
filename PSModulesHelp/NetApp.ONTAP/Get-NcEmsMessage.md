Get-NcEmsMessage
----------------

### Synopsis
Return EMS log messages.

---

### Description

Return EMS log messages.

---

### Examples
> Example 1

Get-NcEmsMessage -Count 10
Get the 10 most recent EMS entries.

TimeDT                 Node             Severity      Event
------                 ----             --------      -----
2/24/2012 1:34:15 PM   fas3070cluster1 debug         kern.syslog.msg: [ctran_core_process_acn_event:275389910913245...
2/24/2012 1:31:34 PM   fas3070cluster1 informational ems.engine.suppressed: Event 'wafl.vol.autoSize.fail' suppress...
2/24/2012 1:30:20 PM   fas3070cluster1 informational mgmtgwd.jobmgr.jobcomplete.success: Job "Vol Reaper" [id 1570]...
2/24/2012 1:26:19 PM   fas3070cluster1 informational wafl.vol.autoSize.fail: Unable to grow volume 'vol1@vserver:3d...
2/24/2012 1:25:00 PM   fas3070cluster2 notice        raid.rg.media_scrub.start: owner="", rg="/aggr1/plex0/rg0"
2/24/2012 1:24:39 PM   fas3070cluster2 notice        raid.rg.media_scrub.summary.media: errors="0", rg="/aggr1/plex...
2/24/2012 1:24:39 PM   fas3070cluster2 notice        raid.rg.media_scrub.done: owner="", rg="/aggr1/plex0/rg0", dur...
2/24/2012 1:24:39 PM   fas3070cluster1 debug         secd.nfsAuth.noUnixCreds: vserver (fas3070cluster01) Cannot de...
2/24/2012 1:24:34 PM   fas3070cluster1 debug         kern.syslog.msg: [ctran_core_process_acn_event:275380387643306...
2/24/2012 1:22:51 PM   fas3070cluster1 debug         raid.aggr.log.CP.count: Aggregate 'aggr2' (uuid = 0xf83fa806-1...

> Example 2

Get-NcEmsMessage -Severity critical,warning -StartTime (Get-Date).AddHours(-1)
Get any critical or warning messages reported in the last hour.

TimeDT                 Node             Severity      Event
------                 ----             --------      -----
2/24/2012 1:32:21 PM   fas3070cluster1 warning       sshd.auth.loginDenied: message="Failed keyboard-interactive/pa...
2/24/2012 1:21:15 PM   fas3070cluster1 warning       sshd.auth.loginDenied: message="Failed keyboard-interactive/pa...
2/24/2012 1:12:54 PM   fas3070cluster2 critical      ses.access.noEnclServ: No Enclosure Services detected through ...
2/24/2012 1:09:43 PM   fas3070cluster1 warning       sshd.auth.loginDenied: message="Failed keyboard-interactive/pa...
2/24/2012 1:04:46 PM   fas3070cluster2 critical      ses.access.noEnclServ: No Enclosure Services detected through ...
2/24/2012 1:00:08 PM   fas3070cluster1 warning       wackiron.past.hour.limit: aggr0: Number of hours since wafliro...
2/24/2012 1:00:07 PM   fas3070cluster1 warning       wackiron.past.hour.limit: aggr2: Number of hours since wafliro...
2/24/2012 1:00:00 PM   fas3070cluster2 critical      monitor.shelf.accessError: Enclosure services has detected an ...
2/24/2012 1:00:00 PM   fas3070cluster2 critical      monitor.shelf.configError: Enclosure services has detected an ...
2/24/2012 1:00:00 PM   fas3070cluster2 critical      monitor.shelf.accessError: Enclosure services has detected an ...
2/24/2012 1:00:00 PM   fas3070cluster2 critical      monitor.shelf.configError: Enclosure services has detected an ...
2/24/2012 12:58:54 PM  fas3070cluster1 warning       sshd.auth.loginDenied: message="Failed keyboard-interactive/pa...
2/24/2012 12:47:09 PM  fas3070cluster1 warning       sshd.auth.loginDenied: message="Failed keyboard-interactive/pa...

---

### Parameters
#### **Node**
The name of the node emitting the message.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **SequenceNumber**
The message sequence number.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |named   |true (ByPropertyName)|

#### **Severity**
The message severity, valid values are emergency, alert, critical, error, warning, notice, informational, and debug.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Source**
The message source.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **MessageName**
The message name.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Event**
The EMS event.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **StartTime**
Retrieve only EMS entries that occur after this time. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|

#### **EndTime**
Retrieve only EMS entries that occur before this time. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|

#### **Count**
The number of EMS entries to retrieve. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Attributes**
For improved scalability in large clusters, provide an EmsMessageInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcEmsMessage -Template" to get the initially empty EmsMessageInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[EmsMessageInfo]`|false   |named   |false        |

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
Specify to get an empty EmsMessageInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a EmsMessageInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcEmsMessage -Template" to get the initially empty EmsMessageInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[EmsMessageInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsMessageInfo

---

### Notes
Category: ems
API: ems-message-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsMessage [[-Node] <String[]>] [-SequenceNumber <UInt64[]>] [-Severity <String[]>] [-Source <String[]>] [-MessageName <String[]>] [-Event <String[]>] [-StartTime <DateTime>] [-EndTime 
```
```PowerShell
<DateTime>] [-Count <Int32>] [-Attributes <EmsMessageInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsMessage [-Count <Int32>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsMessage [-Count <Int32>] -Query <EmsMessageInfo> [-Attributes <EmsMessageInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
