Remove-NcNetSubnet
------------------

### Synopsis
Destroy an existing subnet object.

---

### Description

Destroy an existing subnet object.

---

### Related Links
* [New-NcNetSubnet](New-NcNetSubnet)

* [Get-NcNetSubnet](Get-NcNetSubnet)

* [Rename-NcNetSubnet](Rename-NcNetSubnet)

* [Set-NcNetSubnet](Set-NcNetSubnet)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetSubnet -Name 10.63.0.0/18 -ForceUpdateLifAssociations
Remove the given subnet.
```

---

### Parameters
#### **Name**
Layer 3 subnet to remove.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|SubnetName|

#### **Ipspace**
IPspace that the subnet belongs to.  The default value for this parameter is the default IPspace, named 'Default'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ForceUpdateLifAssociations**
If specified, remove the network interface associations with the subnet and allow the command to succeed. However, it will not affect service processor interfaces.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: net-subnet-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetSubnet [-Name] <String> [-Ipspace <String>] [-ForceUpdateLifAssociations] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
