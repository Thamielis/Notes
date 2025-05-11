Get-NcNetDnsHost
----------------

### Synopsis
List host name mappings for one or more vservers.

---

### Description

List host name mappings for one or more vservers.

---

### Related Links
* [Add-NcNetDnsHost](Add-NcNetDnsHost)

* [Remove-NcNetDnsHost](Remove-NcNetDnsHost)

* [Set-NcNetDnsHost](Set-NcNetDnsHost)

---

### Examples
> Example 1

Get-NcNetDnsHost -Vserver Knight01
List all DNS host records for vserver 'Knight01'.

Vserver  Address       Hostname                    Aliases
-------  -------       --------                    -------
Knight01 10.61.167.160 dunn.rtprre.testdomain      {dunn}
Knight01 10.61.167.22  x3550rre7.rtprre.testdomain {x3550rre7}

> Example 2

Get-NcNetDnsHost -Attributes (Get-NcNetDnsHost -Template)
List only the key fields of the DNS host entries for the currently connected vserver.

Vserver              Address
-------              -------
Knight01             10.61.167.160
Knight01             10.61.167.22

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|OwningVserver|

#### **Hostname**
Restrict results to the specified hostname(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Address**
Restrict results to the specified address(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|HostIpAddress|

#### **Aliases**
Restrict results to the specified alias(es).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Alias  |

#### **Attributes**
For improved scalability in large clusters, provide a HostsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetDnsHost -Template" to get the initially empty HostsInfo object.  If not specified, all data is returned for each object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[HostsInfo]`|false   |named   |false        |

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
Specify to get an empty HostsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a HostsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetDnsHost -Template" to get the initially empty HostsInfo object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[HostsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.HostsInfo

---

### Notes
Category: net
API: net-hosts-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetDnsHost [[-Vserver] <String[]>] [-Hostname <String[]>] [-Address <String[]>] [-Aliases <String[]>] [-Attributes <HostsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetDnsHost -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetDnsHost -Query <HostsInfo> [-Attributes <HostsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
