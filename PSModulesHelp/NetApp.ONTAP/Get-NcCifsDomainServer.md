Get-NcCifsDomainServer
----------------------

### Synopsis
Get the list of servers discovered by the cluster.

---

### Description

Get the list of servers discovered by the cluster.

---

### Related Links
* [Find-NcCifsDomainServer](Find-NcCifsDomainServer)

---

### Examples
> Example 1

Get-NcCifsDomainServer
Get all of the discovered domain servers for this cluster or vserver.

Name                           Domain               Node                 ServerType   PreferType           Status
----                           ------               ----                 ----------   ----------           ------
torres                         rtprre.testdomain    VxeRubble-02         ms_ldap      adequate             ok
torres                         rtprre.testdomain    VxeRubble-02         ms_dc        adequate             ok
torres                         RTPRRE.TESTDOMAIN    VxeRubble-01         ms_ldap      adequate             ok
torres                         RTPRRE.TESTDOMAIN    VxeRubble-01         ms_dc        adequate             ok

> Example 2

$query = Get-NcCifsDomainServer -Template
$query.ServerType = "ms_dc"
Get-NcCifsDomainServer -Query $query
Get all the Microsoft Domain Controllers that have been discovered.

Name                           Domain               Node                 ServerType   PreferType           Status
----                           ------               ----                 ----------   ----------           ------
torres                         rtprre.testdomain    VxeRubble-02         ms_dc        adequate             ok
torres                         RTPRRE.TESTDOMAIN    VxeRubble-01         ms_dc        adequate             ok

---

### Parameters
#### **Name**
The hostname of the server that was discovered.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
The name of the node on which server discovery was done.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Domain**
The Active Directory domain that the discovered server is a member of.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CifsDomainDiscoveredServers object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCifsDomainServer -Template" to get the initially empty CifsDomainDiscoveredServers object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[CifsDomainDiscoveredServers]`|false   |named   |false        |

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
Specify to get an empty CifsDomainDiscoveredServers object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CifsDomainDiscoveredServers object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCifsDomainServer -Template" to get the initially empty CifsDomainDiscoveredServers object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[CifsDomainDiscoveredServers]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsDomainDiscoveredServers

---

### Notes
Category: cifs
API: cifs-domain-discovered-servers-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCifsDomainServer [[-Name] <String[]>] [[-Node] <String[]>] [[-Domain] <String[]>] [-Attributes <CifsDomainDiscoveredServers>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsDomainServer -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsDomainServer -Query <CifsDomainDiscoveredServers> [-Attributes <CifsDomainDiscoveredServers>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
