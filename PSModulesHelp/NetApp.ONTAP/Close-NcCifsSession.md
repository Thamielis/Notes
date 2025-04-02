Close-NcCifsSession
-------------------

### Synopsis
Close an open CIFS session.

---

### Description

Close an open CIFS session.

---

### Related Links
* [Get-NcCifsSession](Get-NcCifsSession)

---

### Examples
> Example 1

```PowerShell
Close-NcCifsSession -Node beam-mcc-01-01 -SessionId 1
Close the specified CIFS session.
```

---

### Parameters
#### **Node**
The name of the node on which the session close is done.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **SessionId**
The unique identifier for the session.
This parameter is mandatory in ONTAP 8.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Decimal]`|false   |named   |true (ByPropertyName)|

#### **ConnectionId**
The connection that is used to establish the session.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **LifAddress**
The data lif that is used to establish the session.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Address**
The ip address of the workstation from which the session is opened.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AuthMechanism**
The authentication mechanism used to establish the session. 
Possible values: 'none', 'ntlmv1', 'ntlmv2', 'kerberos', 'anonymous'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **WindowsUser**
The name of the CIFS user for which the session is established.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UnixUser**
The name of the UNIX user for which the session is established.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProtocolVersion**
The CIFS protocol version that is used to establish the session.
Possible values: 
'smb1'      - SMB 1.0,
'smb2'      - SMB 2.0,
'smb2_1'    - SMB 2.1,
'smb3'      - SMB 3.0

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ContinuouslyAvailable**
The type of continuous availability protection provided to the session.
Possible values: 
'no'        - The open file is not continuously available. For sessions, it contains one or more open file but none of them are continuously available.,
'yes'       - The open file is continuously available. For sessions, it contains one or more open files and all of them are continuously available.
'partial'   - This value is used for sessions only. It contains at least one continuously available open file but other open files that are not.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsSessionSigned**
If true, the CIFS session is signed. If false, the CIFS session is not signed.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **SmbEncryptionStatus**
Status of smb encryption that is happening over this session. 
Possible values : encrypted, unencrypted, partially_encrypted

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: cifs
API: cifs-session-close
Family: vserver

---

### Syntax
```PowerShell
Close-NcCifsSession [-Node] <String> [-SessionId <Decimal>] [-ConnectionId <Int64>] [-LifAddress <String>] [-Address <String>] [-AuthMechanism <String>] [-WindowsUser <String>] [-UnixUser 
```
```PowerShell
<String>] [-ProtocolVersion <String>] [-ContinuouslyAvailable <String>] [-IsSessionSigned <Boolean>] [-SmbEncryptionStatus <String>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
