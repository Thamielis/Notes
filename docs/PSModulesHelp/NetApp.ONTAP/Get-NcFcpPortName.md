Get-NcFcpPortName
-----------------

### Synopsis
Get a list of valid Fibre Channel target port names on a Vserver's FCP LIFs.

---

### Description

Get a list of valid Fibre Channel target port names on a Vserver's FCP LIFs.

---

### Related Links
* [Set-NcFcpPortName](Set-NcFcpPortName)

---

### Examples
> Example 1

```PowerShell
Get-NcFcpPortName
Get all the fcp port names on the current cluster.

FcpAdapter      : costea01_lif_data4
IsUsed          : True
PortName        : 20:01:00:a0:98:29:49:ba
Vserver         : costea01
IsUsedSpecified : True

```
> Example 2

```PowerShell
$q = Get-NcFcpPortName -Template
$q.IsUsed = $true
Get-NcFcpPortName -Query $q
Get all of the fcp port names tat are currently in use.

FcpAdapter      : costea01_lif_data4
IsUsed          : True
PortName        : 20:01:00:a0:98:29:49:ba
Vserver         : costea01
IsUsedSpecified : True

```

---

### Parameters
#### **PortName**
A Fibre Channel WWPN in the form XX:XX:XX:XX:XX:XX:XX:XX where X is a hexadecimal digit.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Adapter**
The name of an FCP data LIF.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|FcpAdapter|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide an FcpPortNameInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFcpPortName -Template" to get the initially empty FcpPortNameInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[FcpPortNameInfo]`|false   |named   |false        |

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
Specify to get an empty FcpPortNameInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FcpPortNameInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFcpPortName -Template" to get the initially empty FcpPortNameInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[FcpPortNameInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpPortNameInfo

---

### Notes
Category: fcp
API: fcp-port-name-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcFcpPortName [[-PortName] <String[]>] [[-Adapter] <String[]>] [-Vserver <String[]>] [-Attributes <FcpPortNameInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpPortName -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpPortName -Query <FcpPortNameInfo> [-Attributes <FcpPortNameInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
