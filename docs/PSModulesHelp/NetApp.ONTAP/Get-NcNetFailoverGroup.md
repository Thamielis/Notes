Get-NcNetFailoverGroup
----------------------

### Synopsis
Get a list of failover group objects.

---

### Description

Get a list of failover group objects.

---

### Related Links
* [New-NcNetFailoverGroup](New-NcNetFailoverGroup)

* [Set-NcNetFailoverGroup](Set-NcNetFailoverGroup)

* [Remove-NcNetFailoverGroup](Remove-NcNetFailoverGroup)

---

### Examples
> Example 1

Get-NcNetFailoverGroup -Node vsim_cluster1-01
Get all of the failover groups for the given node.

Node                                FailoverGroup             Port
----                                -------------             ----
vsim_cluster1-01                    clusterwide               e0d
vsim_cluster1-01                    clusterwide               e0c

---

### Parameters
#### **Name**
Name of one or more failover groups.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|FailoverGroup|

#### **Vserver**
One ore more vservers containing the failover groups.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Node**
One or more nodes on which the failover target is located.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Port**
One or more network ports or interface groups in the failover group.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetFailoverGroupInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetFailoverGroup -Template" to get the initially empty NetFailoverGroupInfo object.  If not specified, all data is returned for each object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[NetFailoverGroupInfo]`|false   |named   |false        |

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
Specify to get an empty NetFailoverGroupInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetFailoverGroupInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetFailoverGroup -Template" to get the initially empty NetFailoverGroupInfo object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[NetFailoverGroupInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetFailoverGroupInfo

---

### Notes
Category: net
API: net-failover-group-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetFailoverGroup [[-Name] <String[]>] [-Vserver <String[]>] [[-Node] <String[]>] [[-Port] <String[]>] [-Attributes <NetFailoverGroupInfo>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetFailoverGroup -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetFailoverGroup -Query <NetFailoverGroupInfo> [-Attributes <NetFailoverGroupInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
