Get-NcNetArpEntry
-----------------

### Synopsis
Get a list of network ARP entries.

---

### Description

Get a list of network ARP entries.

---

### Related Links
* [New-NcNetArpEntry](New-NcNetArpEntry)

* [Remove-NcNetArpEntry](Remove-NcNetArpEntry)

---

### Examples
> Example 1

```PowerShell
Get-NcNetArpEntry
Get all of the ARP entries for the current cluster.

IpSpace      : Default
MacAddress   : 00:00:0c:9f:f1:07
NcController : 10.63.10.37
RemoteHost   : 10.63.0.1
Vserver      : pester

```
> Example 2

```PowerShell
Get-NcNetArpEntry -Query @{IpSpace="Default"}
Query all of the ARP entries for the Default IpSpace.

IpSpace      : Default
MacAddress   : 00:00:0c:9f:f1:07
NcController : 10.63.10.37
RemoteHost   : 10.63.0.1
Vserver      : pester

```

---

### Parameters
#### **RemoteHost**
One or more remote IP addresses for which to get an entry.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Restrict results to one or more vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetArpInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetArpEntry -Template" to get the initially empty NetArpInfo object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[NetArpInfo]`|false   |named   |false        |

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
Specify to get an empty NetArpInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetArpInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetArpEntry -Template" to get the initially empty NetArpInfo object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[NetArpInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetArpInfo

---

### Notes
Category: net
API: net-arp-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetArpEntry [[-RemoteHost] <String[]>] [[-Vserver] <String[]>] [-Attributes <NetArpInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetArpEntry -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetArpEntry -Query <NetArpInfo> [-Attributes <NetArpInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
