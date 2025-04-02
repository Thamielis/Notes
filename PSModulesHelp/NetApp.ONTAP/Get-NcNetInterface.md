Get-NcNetInterface
------------------

### Synopsis
Get network interface objects (LIFs).

---

### Description

Get network interface objects (LIFs).

---

### Related Links
* [New-NcNetInterface](New-NcNetInterface)

* [Remove-NcNetInterface](Remove-NcNetInterface)

* [Set-NcNetInterface](Set-NcNetInterface)

---

### Examples
> Example 1

Get-NcNetInterface -Vserver costea01 | select InterfaceName, OpStatus, DataProtocols
List the status of each LIF on vserver 'costea01'.

InterfaceName      OpStatus DataProtocols
-------------      -------- -------------
costea01_lif_data1 up       {nfs, cifs, fcache}
costea01_lif_data2 up       {nfs, cifs, fcache}
costea01_lif_data3 up       {iscsi}
costea01_lif_data4 up       {fcp}
costea01_lif_mgmt  up       {nfs, cifs, fcache}

> Example 2

Get-NcNetInterface -Attributes (Get-NcNetInterface -Template) | select InterfaceName, Vserver
Get the list of LIF names without getting all of the associated details.

InterfaceName        Vserver
-------------        -------
costea01_lif_data1   costea01
costea01_lif_data2   costea01
costea01_lif_data3   costea01
costea01_lif_data4   costea01
costea01_lif_mgmt    costea01
costea01_lif_data1   costea02
costea02_lif_mgmt    costea02
dlamotta01_lif_data1 dlamotta01
dlamotta01_lif_mgmt  dlamotta01
dlamotta02_lif_data1 dlamotta02
dlamotta02_lif_mgmt  dlamotta02
rashidvs_data        rashidvs
rashidvs2_data       rashidvs2
cluster_mgmt         VxeRubble
clus1                VxeRubble-01
clus2                VxeRubble-01
mgmt1                VxeRubble-01
clus1                VxeRubble-02
clus2                VxeRubble-02
mgmt1                VxeRubble-02

---

### Parameters
#### **Name**
The name of one or more interfaces to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|InterfaceName|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **DataProtocols**
Restrict results to the specified data protocol(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Protocol|

#### **FirewallPolicy**
Restrict results to the specified firewall policy(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Role**
Restrict results to the specified LIF role(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetInterfaceInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetInterface -Template" to get the initially empty NetInterfaceInfo object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[NetInterfaceInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Ipspace**
Ipspace name. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |true         |

#### **ServicePolicy**
Name of ServicePolicy. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |true         |

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
Specify to get an empty NetInterfaceInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetInterfaceInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetInterface -Template" to get the initially empty NetInterfaceInfo object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[NetInterfaceInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetInterfaceInfo

---

### Notes
Category: net
API: net-interface-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetInterface [[-Name] <String[]>] [-Vserver <String[]>] [-DataProtocols <String[]>] [-FirewallPolicy <String[]>] [-Role <String[]>] [-Attributes <NetInterfaceInfo>] [-VserverContext 
```
```PowerShell
<String>] [-Ipspace <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetInterface -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetInterface -Query <NetInterfaceInfo> [-Attributes <NetInterfaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
