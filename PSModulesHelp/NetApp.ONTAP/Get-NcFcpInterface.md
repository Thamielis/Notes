Get-NcFcpInterface
------------------

### Synopsis
Get a list of FCP Target Logical Interfaces (LIF).

---

### Description

Get a list of FCP Target Logical Interfaces (LIF).

---

### Examples
> Example 1

```PowerShell
Get-NcFcpInterface
Get all the FCP interfaces in the current cluster.

CurrentNode             : VxeRubble-01
CurrentPort             : 0a
InterfaceName           : costea01_lif_data4
NodeName                : 20:00:00:a0:98:29:49:ba
PortAddress             : 11501
PortName                : 20:01:00:a0:98:29:49:ba
RelativePortId          : 2
Vserver                 : costea01
RelativePortIdSpecified : True

```

---

### Parameters
#### **Interface**
The name of an FCP data LIF.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|InterfaceName|

#### **Node**
The node currently hosting the LIF.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|CurrentNode|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide an FcpInterfaceInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFcpInterface -Template" to get the initially empty FcpInterfaceInfo object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[FcpInterfaceInfo]`|false   |named   |false        |

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
Specify to get an empty FcpInterfaceInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FcpInterfaceInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFcpInterface -Template" to get the initially empty FcpInterfaceInfo object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[FcpInterfaceInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpInterfaceInfo

---

### Notes
Category: fcp
API: fcp-interface-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcFcpInterface [[-Interface] <String[]>] [[-Node] <String[]>] [-Vserver <String[]>] [-Attributes <FcpInterfaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpInterface -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpInterface -Query <FcpInterfaceInfo> [-Attributes <FcpInterfaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
