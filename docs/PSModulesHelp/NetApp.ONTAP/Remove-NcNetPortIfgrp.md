Remove-NcNetPortIfgrp
---------------------

### Synopsis
Destroy an existing network interface group (ifgrp).

---

### Description

Destroy an existing network interface group (ifgrp).  This cmdlet changes the administrative status of the ifgrp to 'down' before removing it, as required by Data ONTAP.

---

### Related Links
* [Get-NcNetPortIfgrp](Get-NcNetPortIfgrp)

* [New-NcNetPortIfgrp](New-NcNetPortIfgrp)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetPortIfgrp i0b -Node fas3070cluster01-02
Destroy ifgrp 'i0b'.
```

---

### Parameters
#### **Name**
The name of the ifgrp to destroy.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|IfgrpName<br/>Ifgrp|

#### **Node**
The node that owns the ifgrp.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
API: net-port-ifgrp-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetPortIfgrp [-Name] <String> [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
