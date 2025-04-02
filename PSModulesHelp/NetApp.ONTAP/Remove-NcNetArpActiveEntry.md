Remove-NcNetArpActiveEntry
--------------------------

### Synopsis
Delete dynamically learned ARP entries.

---

### Description

Delete dynamically learned ARP entries.

---

### Related Links
* [Get-NcNetArpActiveEntry](Get-NcNetArpActiveEntry)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetArpActiveEntry -Node beam-fs-ps-01 -Vserver pester -SubnetGroup 10.63.0.0/18 -RemoteHost 10.63.0.3 -Port e0c
Remove the given active ARP entry.
```

---

### Parameters
#### **Node**
Node from which to remove the ARP active entry.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
Vserver from which to remove the ARP active entry.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **SubnetGroup**
Subnet group from which to remove the ARP active entry.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **RemoteHost**
Remote IP address which will be removed from the ARP active entry table.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **Port**
Port from which to remove the ARP active entry.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |5       |true (ByPropertyName)|

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
API: net-arp-active-entry-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetArpActiveEntry [-Node] <String> [-Vserver] <String> [-SubnetGroup] <String> [-RemoteHost] <String> [-Port] <String> [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
