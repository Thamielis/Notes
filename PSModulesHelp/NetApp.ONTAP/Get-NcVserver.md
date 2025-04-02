Get-NcVserver
-------------

### Synopsis
Display information about Vservers.

---

### Description

Display information about Vservers.  Information about Admin Vserver, Node Vserver, and Cluster Vservers is displayed.  If the ZAPI is issued to the Cluster LIF with no Vserver specified as input, then information about all Vservers is shown.  If the request is sent to the Vserver LIF, then information about that Vserver is shown.

---

### Related Links
* [New-NcVserver](New-NcVserver)

---

### Examples
> Example 1

Get-NcVserver
List all vservers.

Name                      State      VserverType   Comment
----                      -----      -----------   -------
fas3070cluster01                     admin         The administrative vserver.
fas3070cluster01-01                  node
fas3070cluster01-02                  node
vserver1                  running    cluster
vserver2                  running    cluster

> Example 2

$v = Get-NcVserver -Template
$v.State = "running"
$v.VserverType = "cluster"
Get-NcVserver -Query $v
Build an advanced query to get only running vservers of type 'cluster'.

Name                      State      VserverType   Comment
----                      -----      -----------   -------
vserver1                  running    cluster
vserver2                  running    cluster

---

### Parameters
#### **Name**
The name of one or more vservers to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                |
|------------|--------|--------|---------------------|-----------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Vserver<br/>VserverName|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a VserverInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVserver -Template" to get the initially empty VserverInfo object.  If not specified, all data is returned for each object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[VserverInfo]`|false   |named   |false        |

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
Specify to get an empty VserverInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a VserverInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVserver -Template" to get the initially empty VserverInfo object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[VserverInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverInfo

---

### Notes
Category: vserver
API: vserver-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVserver [[-Name] <String[]>] [-VserverContext <String>] [-Attributes <VserverInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserver [-VserverContext <String>] -Template [-Fill] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserver [-VserverContext <String>] -Query <VserverInfo> [-Attributes <VserverInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
