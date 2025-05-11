Set-NcNetDns
------------

### Synopsis
Modify the DNS configuration of the specified vserver.

---

### Description

Modify the DNS configuration of the specified vserver.  Omitted (optional) fields will not be changed.

---

### Related Links
* [Get-NcNetDns](Get-NcNetDns)

* [New-NcNetDns](New-NcNetDns)

---

### Examples
> Example 1

Set-NcNetDns -State disabled -VserverContext Knight02
Disable the DNS configuration on vserver 'knight02'.

Vserver  DnsState Domains             NameServers
-------  -------- -------             -----------
Knight02 disabled {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}

> Example 2

Get-NcNetDns Knight01 | Set-NcNetDns -VserverContext Knight02
Copy DNS configuration from vserver 'Knight01' to vserver 'Knight02'.

Vserver  DnsState Domains             NameServers
-------  -------- -------             -----------
Knight02 enabled  {sea-tm.netapp.com} {10.58.88.21, 10.58.88.22}

> Example 3

Set-NcNetDns -NameServers ""
Remove the name server list from the DNS configuration of the current vserver.

Vserver  DnsState Domains             NameServers
-------  -------- -------             -----------
Knight02 enabled  {sea-tm.netapp.com}

---

### Parameters
#### **Domains**
List of DNS domains such as 'sales.bar.com'.  The first domain is the one that the vserver belongs to.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **NameServers**
IPv4 addresses of name servers such as '123.123.123.123'.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Servers|

#### **State**
Specifies whether DNS configuration should be 'enabled' or 'disabled'.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|DnsState|

#### **TimeoutSeconds**
Number of seconds to wait for a response from a name server before trying a different name server.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int32]`|false   |named   |true (ByPropertyName)|Timeout|

#### **Attempts**
Max number of trials before giving up and returning error.

|Type     |Required|Position|PipelineInput        |Aliases          |
|---------|--------|--------|---------------------|-----------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|Count<br/>Retries|

#### **IsSourceAddressMatchRequired**
Specify whether source IP address of reply is required to match the name-server.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsPacketQueryMatchRequired**
Specify whether query sections of query and response packets is required to match.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **SkipConfigValidation**
Specify in order to Skip Configuration Validation
This parameter is available in ONTAP 9.2 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetDnsInfo

---

### Notes
Category: net
API: net-dns-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcNetDns [[-Domains] <String[]>] [[-NameServers] <String[]>] [-State <String>] [-TimeoutSeconds <Int32>] [-Attempts <Int32>] [-IsSourceAddressMatchRequired <Boolean>] 
```
```PowerShell
[-IsPacketQueryMatchRequired <Boolean>] [-SkipConfigValidation] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
