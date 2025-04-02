Set-NcNetDnsHost
----------------

### Synopsis
Given an IP address, modify the corresponding IP to host name mapping for a vserver.

---

### Description

Given an IP address, modify the corresponding IP to host name mapping for a vserver.

---

### Related Links
* [Add-NcNetDnsHost](Add-NcNetDnsHost)

* [Get-NcNetDnsHost](Get-NcNetDnsHost)

* [Remove-NcNetDnsHost](Remove-NcNetDnsHost)

---

### Examples
> Example 1

Get-NcNetDnsHost -Hostname x3550rre7.rtprre.com | Set-NcNetDnsHost -Hostname x3550rre7.rtprre.testdomain
Update any DNS host records with hostname 'x3550rre7.rtprre.com' by changing them to use hostname 'x3550rre7.rtprre.testdomain'.

Vserver  Address      Hostname                    Aliases
-------  -------      --------                    -------
Knight01 10.61.167.22 x3550rre7.rtprre.testdomain {x3550rre7}

---

### Parameters
#### **Address**
Address in dotted form as '123.123.123.123'.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |1       |true (ByPropertyName)|HostIpAddress|

#### **Hostname**
Canonical hostname as a simple string or with a fully-qualified domain name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Aliases**
The list of aliases such as 'host1.sales.foo.com'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* DataONTAP.C.Types.Net.HostsInfo

---

### Notes
Category: net
API: net-hosts-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcNetDnsHost [-Address] <String> [[-Hostname] <String>] [[-Aliases] <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
