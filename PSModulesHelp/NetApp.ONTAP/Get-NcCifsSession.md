Get-NcCifsSession
-----------------

### Synopsis
Retrieve the list of the established CIFS sessions.

---

### Description

Retrieve the list of the established CIFS sessions.

---

### Related Links
* [Get-NcCifsSessionFile](Get-NcCifsSessionFile)

---

### Examples
> Example 1

```PowerShell
Get-NcCifsSession
Get all cifs sessions on the current cluster.

Address               : 10.58.94.227
AuthMechanism         : ntlmv2
ConnectedTime         : 6d 0h 28m 35s
ConnectionId          : 248115481
ContinuouslyAvailable : yes
Files                 : 3
IdleTime              : 3s
LifAddress            : 10.58.92.109
NcController          : 10.58.95.206
Node                  : Varuna-02
Other                 : 0
ProtocolVersion       : smb3
SessionId             : 1
Shares                : 1
UnixUser              : pcuser
Vserver               : no_odx
WindowsUser           : SEA-TM\MMSHYPER-V02$
ConnectionIdSpecified : True
FilesSpecified        : True
OtherSpecified        : True
SessionIdSpecified    : True
SharesSpecified       : True

```
> Example 2

$q = Get-NcCifsSession -Template
$q.ProtocolVersion = 'smb3'
Get-NcCifsSession -Query $q
Get all SMB3 CIFS sessions.

LifAddress          SessionId   ConnectionId    ConnectedTime ProtocolVersion    Address          Vserver
----------          ---------   ------------    ------------- ---------------    -------          -------
10.58.92.109                1      248115481    6d 0h 30m 50s smb3               10.58.94.227     no_odx
10.58.92.109                1      248115473    6d 0h 30m 54s smb3               10.58.94.227     no_odx
10.58.92.105                1      363597761    6d 0h 30m 46s smb3               10.58.94.227     vsMMS

---

### Parameters
#### **SessionId**
One or more unique identifiers for the session.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
The name of one or more nodes on which the session listing is done.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Restrict the results to one or more Vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **ConnectionId**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsSession object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsSession -Template" to get the initially empty CifsSession object.  If not specified, all data is returned for each object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CifsSession]`|false   |named   |false        |

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
Specify to get an empty CifsSession object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsSession object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsSession -Template" to get the initially empty CifsSession object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CifsSession]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsSession

---

### Notes
Category: cifs
API: cifs-session-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsSession [[-SessionId] <String[]>] [[-Node] <String[]>] [[-Vserver] <String[]>] [-ConnectionId <String[]>] [-Attributes <CifsSession>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsSession -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsSession -Query <CifsSession> [-Attributes <CifsSession>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
