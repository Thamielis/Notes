Get-NcFcpPortNameAlias
----------------------

### Synopsis
Get a list of assigned World Wide Port Name (WWPN) aliases.

---

### Description

Get a list of assigned World Wide Port Name (WWPN) aliases.

---

### Related Links
* [Set-NcFcpPortNameAlias](Set-NcFcpPortNameAlias)

* [Clear-NcFcpPortNameAlias](Clear-NcFcpPortNameAlias)

---

### Examples
> Example 1

Get-NcFcpPortNameAlias
Get all the FCP port name aliases for the current cluster.

Vserver                       AliasesAlias                  AliasesWwpn
-------                       ------------                  -----------
dlamotta01                    port1                         00:20:4f:00:3d:14:00:00

---

### Parameters
#### **Alias**
The 32-character alias.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Wwpn**
The FCP WWPN for which the alias is given.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide an AliasesInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFcpPortNameAlias -Template" to get the initially empty AliasesInfo object.  If not specified, all data is returned for each object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[AliasesInfo]`|false   |named   |false        |

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
Specify to get an empty AliasesInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an AliasesInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFcpPortNameAlias -Template" to get the initially empty AliasesInfo object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[AliasesInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.AliasesInfo

---

### Notes
Category: fcp
API: fcp-wwpnalias-set
Family: vserver

---

### Syntax
```PowerShell
Get-NcFcpPortNameAlias [[-Alias] <String[]>] [[-Wwpn] <String[]>] [-Vserver <String[]>] [-Attributes <AliasesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpPortNameAlias -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpPortNameAlias -Query <AliasesInfo> [-Attributes <AliasesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
