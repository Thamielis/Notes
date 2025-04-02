Get-NcNetDns
------------

### Synopsis
Get vserver DNS configuration info.

---

### Description

Get vserver DNS configuration info.

---

### Related Links
* [New-NcNetDns](New-NcNetDns)

* [Set-NcNetDns](Set-NcNetDns)

---

### Examples
> Example 1

Get-NcNetDns
List DNS configuration info for all vservers in the cluster.

Vserver    DnsState Domains             NameServers
-------    -------- -------             -----------
Barker01   enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}
Barker03   enabled  {sea-tm}            {10.58.88.21, 10.58.88.22}
Cerebus    enabled  {sea-tm.netapp.com} {10.58.88.21}
Knight01   enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}
Knight02   enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}
Lionetti01 enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}
Mun01      enabled  {sea-tm.netapp.com} {10.58.88.21}
Parker01   enabled  {sea-tm.netapp.com} {10.58.88.21}

> Example 2

$q = Get-NcNetDns -Template
$q.NameServers = "10.58.88.22"
Get-NcNetDns -Query $q
Get all DNS configurations that include a name server at address '10.58.88.22'.

Vserver    DnsState Domains             NameServers
-------    -------- -------             -----------
Barker01   enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}
Barker03   enabled  {sea-tm}            {10.58.88.21, 10.58.88.22}
Knight01   enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}
Knight02   enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}
Lionetti01 enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|OwningVserver|

#### **Domain**
Restrict results to the specified DNS domain(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Domains|

#### **Attributes**
For improved scalability in large clusters, provide a NetDnsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetDns -Template" to get the initially empty NetDnsInfo object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[NetDnsInfo]`|false   |named   |false        |

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
Specify to get an empty NetDnsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetDnsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetDns -Template" to get the initially empty NetDnsInfo object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[NetDnsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetDnsInfo

---

### Notes
Category: net
API: net-dns-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetDns [[-Vserver] <String[]>] [-Domain <String[]>] [-Attributes <NetDnsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetDns -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetDns -Query <NetDnsInfo> [-Attributes <NetDnsInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
