Set-NcIscsiService
------------------

### Synopsis
Modify an iSCSI Service in a Vserver.

---

### Description

Modify an iSCSI Service in a Vserver.

---

### Related Links
* [Get-NcIscsiService](Get-NcIscsiService)

* [Add-NcIscsiService](Add-NcIscsiService)

* [Remove-NcIscsiService](Remove-NcIscsiService)

---

### Parameters
#### **MaxErrorRecoveryLevel**
Maximum error recovery level. The possible values are:
0 - session failure recovery.
1 - digest failure recovery.
2 - connection failure recovery.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **RetainTimeout**
Specifies the wait time before active task reassignment is possible after an unexpected connection termination.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **LoginTimeout**
Specifies maximum time the login phase remains active until the iSCSI target terminates the connection.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxConnPerSession**
Specifies the maximum number of connections per session that the iSCSI target can accept.

|Type     |Required|Position|PipelineInput        |Aliases                                |
|---------|--------|--------|---------------------|---------------------------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|MaximumConnectionPerSession<br/>MaxConn|

#### **MaxCmdsPerSession**
Specifies the maximum number of connections per session that the iSCSI target can accept.

|Type     |Required|Position|PipelineInput        |Aliases                              |
|---------|--------|--------|---------------------|-------------------------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|MaximumCommandsPerSession<br/>MaxCmds|

#### **TcpWindowSize**
TCP receive window size in bytes.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **Attributes**
Specify an IscsiServiceInfo object from which to copy service data

|Type                |Required|Position|PipelineInput        |
|--------------------|--------|--------|---------------------|
|`[IscsiServiceInfo]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiServiceInfo

---

### Notes
Category: iscsi
API: iscsi-service-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcIscsiService [-MaxErrorRecoveryLevel <Int32>] [-RetainTimeout <Int32>] [-LoginTimeout <Int32>] [-MaxConnPerSession <Int32>] [-MaxCmdsPerSession <Int32>] [-TcpWindowSize <Int32>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Set-NcIscsiService [-Attributes] <IscsiServiceInfo> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
