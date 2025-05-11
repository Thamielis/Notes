Add-NcNetDnsHost
----------------

### Synopsis
Create a new IP address to hostname mapping on a vserver.

---

### Description

Create a new IP address to hostname mapping on a vserver.

---

### Related Links
* [Get-NcNetDnsHost](Get-NcNetDnsHost)

* [Remove-NcNetDnsHost](Remove-NcNetDnsHost)

* [Set-NcNetDnsHost](Set-NcNetDnsHost)

---

### Examples
> Example 1

Add-NcNetDnsHost -VserverContext Knight02 -Address 10.61.167.22 -Hostname x3550rre7.rtprre.testdomain -Aliases x3550rre7
Add a host entry to vserver 'Knight02'.  Note the use of the -VserverContext parameter to direct the command to the desired vserver.

Vserver  Address      Hostname                    Aliases
-------  -------      --------                    -------
Knight02 10.61.167.22 x3550rre7.rtprre.testdomain {x3550rre7}

> Example 2

Get-NcNetDnsHost -Vserver Knight01 | Add-NcNetDnsHost -VserverContext Knight02
Copy all DNS host entries from vserver 'Knight01' to vserver 'Knight02'.

Vserver  Address       Hostname                    Aliases
-------  -------       --------                    -------
Knight02 10.61.167.160 dunn.rtprre.testdomain      {dunn, dunn.rtprre}
Knight02 10.61.167.22  x3550rre7.rtprre.testdomain {x3550rre7}

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
|`[String]`|true    |2       |true (ByPropertyName)|

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
API: net-hosts-create
Family: vserver

---

### Syntax
```PowerShell
Add-NcNetDnsHost [-Address] <String> [-Hostname] <String> [[-Aliases] <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
