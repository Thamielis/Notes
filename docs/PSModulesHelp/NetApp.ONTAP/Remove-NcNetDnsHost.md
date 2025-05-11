Remove-NcNetDnsHost
-------------------

### Synopsis
Remove an IP address to hostname mapping from a vserver.

---

### Description

Remove an IP address to hostname mapping from a vserver.

---

### Related Links
* [Add-NcNetDnsHost](Add-NcNetDnsHost)

* [Get-NcNetDnsHost](Get-NcNetDnsHost)

* [Set-NcNetDnsHost](Set-NcNetDnsHost)

---

### Examples
> Example 1

```PowerShell
Get-NcNetDnsHost -Vserver Knight02 | Remove-NcNetDnsHost
Remove all DNS host entries from vserver 'Knight02'.
```
> Example 2

```PowerShell
Remove-NcNetDnsHost -VserverContext Knight02 -Address 10.61.167.160
Remove the DNS host mapping with address '10.61.167.160' from vserver 'Knight02'.
```

---

### Parameters
#### **Address**
Address in dotted form as '123.123.123.123'.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |1       |true (ByPropertyName)|HostIpAddress|

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
* 

---

### Notes
Category: net
API: net-hosts-destroy
Family: vserver

---

### Syntax
```PowerShell
Remove-NcNetDnsHost [[-Address] <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
