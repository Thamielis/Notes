Get-NcFpolicyServerStatus
-------------------------

### Synopsis
Get FPolicy server status information.

---

### Description

Get FPolicy server status information.

---

### Related Links
* [Connect-NcFpolicyServer](Connect-NcFpolicyServer)

* [Disconnect-NcFpolicyServer](Disconnect-NcFpolicyServer)

---

### Examples
> Example 1

```PowerShell
Get-NcFpolicyServerStatus -PolicyName test_policy -FpolicyServer 10.61.169.73
Get the status of the given FPolicy server connection.

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
One or more Fpolicy policies for which to get server status.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **FpolicyServer**
One or more Fpolicy servers to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Node**
One or more cluster node names to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Vserver**
Restrict the results to one or more vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FpolicyServerStatusInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFpolicyServerStatus -Template" to get the initially empty FpolicyServerStatusInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[FpolicyServerStatusInfo]`|false   |named   |false        |

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
Specify to get an empty FpolicyServerStatusInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FpolicyServerStatusInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFpolicyServerStatus -Template" to get the initially empty FpolicyServerStatusInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[FpolicyServerStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyServerStatusInfo

---

### Notes
Category: fpolicy
API: fpolicy-server-status-get-iter
Family: vserver,cluster

---

### Syntax
```PowerShell
Get-NcFpolicyServerStatus [[-PolicyName] <String[]>] [[-FpolicyServer] <String[]>] [[-Node] <String[]>] [[-Vserver] <String[]>] [-Attributes <FpolicyServerStatusInfo>] [-VserverContext 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyServerStatus -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyServerStatus -Query <FpolicyServerStatusInfo> [-Attributes <FpolicyServerStatusInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
