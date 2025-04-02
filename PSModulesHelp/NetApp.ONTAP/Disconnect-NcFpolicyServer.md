Disconnect-NcFpolicyServer
--------------------------

### Synopsis
Terminate connection to FPolicy server.

---

### Description

Terminate connection to FPolicy server.

---

### Related Links
* [Connect-NcFpolicyServer](Connect-NcFpolicyServer)

* [Get-NcFpolicyServerStatus](Get-NcFpolicyServerStatus)

---

### Examples
> Example 1

```PowerShell
Disconnect-NcFpolicyServer -PolicyName test_policy -FpolicyServer 10.61.169.73 -Node sfp-cmode-02-01
Disconnect the given FPolicy server.

ConnectedSince      : 1363703576
ConnectedSinceDT    : 3/19/2013 10:32:56 AM
DisconnectedSince   : 1363703800
DisconnectedSinceDT : 3/19/2013 10:36:40 AM
DisconnectReason    : Connection to Server Terminating Manually
FpolicyServer       : 10.61.169.73
NcController        : 10.63.165.62
Node                : sfp-cmode-02-01
PolicyName          : test_policy
ServerStatus        : disconnecting
ServerType          : primary
Vserver             : beam01

```

---

### Parameters
#### **PolicyName**
Name of the policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **FpolicyServer**
FPolicy server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Node**
Cluster node name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyServerStatusInfo

---

### Notes
Category: fpolicy
API: fpolicy-server-disconnect
Family: vserver

---

### Syntax
```PowerShell
Disconnect-NcFpolicyServer [-PolicyName] <String> [-FpolicyServer] <String> [-Node] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
