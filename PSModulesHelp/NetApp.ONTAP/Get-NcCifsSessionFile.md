Get-NcCifsSessionFile
---------------------

### Synopsis
Retrieve the list of the opened CIFS files.

---

### Description

Retrieve the list of the opened CIFS files.

---

### Related Links
* [Get-NcCifsSession](Get-NcCifsSession)

---

### Examples
> Example 1

```PowerShell
Get-NcCifsSessionFile
Get all CIFS session files for the current cluster.

ConnectionId          : 363597761
ContinuouslyAvailable : yes
FileId                : 7
FileType              : regular
HostingAggregate      : aggr_2
HostingVolume         : vsMMSvmstore
NcController          : 10.58.95.206
Node                  : Varuna-01
OpenMode              : rw
Path                  : APP08\Virtual Machines\43020A08-3FB3-433C-B91B-3334174D72AF.xml
RangeLocks            : 0
Reconnected           : Yes
SessionId             : 1
Share                 : DS2
ShareMode             : rw
Vserver               : vsMMS
ConnectionIdSpecified : True
FileIdSpecified       : True
RangeLocksSpecified   : True
SessionIdSpecified    : True

```
> Example 2

$q = Get-NcCifsSessionFile -Template
$q.ConnectionId = 248115473
Get-NcCifsSessionFile -Query $q
Get all the files for a certain CIFS connection.

Path                                                                           ConnectionId Vserver
----                                                                           ------------ -------
Virtual Machines\C4A8A66A-169C-41D9-9990-01A9F6A2167D.xml                         248115473 no_odx

---

### Parameters
#### **FileId**
One or more unique identifiers for opened files.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **SessionId**
One or more unique identifiers for the session.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **ConnectionId**
One or more unique identifiers for the connection.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Node**
The name of one or more nodes on which the session listing is done.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Vserver**
Restrict the results to one or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsSessionFile object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsSessionFile -Template" to get the initially empty CifsSessionFile object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CifsSessionFile]`|false   |named   |false        |

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
Specify to get an empty CifsSessionFile object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsSessionFile object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsSessionFile -Template" to get the initially empty CifsSessionFile object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CifsSessionFile]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsSessionFile

---

### Notes
Category: cifs
API: cifs-session-file-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsSessionFile [[-FileId] <String[]>] [[-SessionId] <String[]>] [[-ConnectionId] <String[]>] [[-Node] <String[]>] [[-Vserver] <String[]>] [-Attributes <CifsSessionFile>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcCifsSessionFile -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsSessionFile -Query <CifsSessionFile> [-Attributes <CifsSessionFile>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
