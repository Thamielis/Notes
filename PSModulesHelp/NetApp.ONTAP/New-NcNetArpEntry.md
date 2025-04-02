New-NcNetArpEntry
-----------------

### Synopsis
Create a new network ARP entry.

---

### Description

Create a new network ARP entry.

---

### Related Links
* [Get-NcNetArpEntry](Get-NcNetArpEntry)

* [Remove-NcNetArpEntry](Remove-NcNetArpEntry)

---

### Examples
> Example 1

```PowerShell
New-NcNetArpEntry -RemoteHost 10.61.167.1 -Mac 0:0:c:23:3e:5 -Vserver pester
Add the given ARP entry to the vserver.

IpSpace      : Default
MacAddress   : 00:00:0c:23:3e:05
NcController : 10.63.10.37
RemoteHost   : 10.61.167.1
Vserver      : pester

```

---

### Parameters
#### **RemoteHost**
Remote IP address which is to be added as the ARP entry.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Mac**
MAC address of remote host.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Vserver**
Vserver in which to create the ARP entry.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Net.NetArpInfo

---

### Notes
Category: net
API: net-arp-create
Family: cluster, vserver

---

### Syntax
```PowerShell
New-NcNetArpEntry [-RemoteHost] <String> [-Mac] <String> [-Vserver] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
