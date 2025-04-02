Remove-NcNetFailoverGroup
-------------------------

### Synopsis
Delete a failover group.

---

### Description

Delete a failover group.

---

### Related Links
* [Get-NcNetFailoverGroup](Get-NcNetFailoverGroup)

* [Set-NcNetFailoverGroup](Set-NcNetFailoverGroup)

* [Rename-NcNetFailoverGroup](Rename-NcNetFailoverGroup)

* [New-NcNetFailoverGroup](New-NcNetFailoverGroup)

---

### Examples
> Example 1

```PowerShell
Remove-NcNetFailoverGroup -Name pester_fg_1 -Vserver pester
Delete the failover group.
```

---

### Parameters
#### **Name**
The name of the failover group.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |1       |true (ByPropertyName)|FailoverGroup|

#### **Vserver**
The vserver for which the failover group is defined.

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
API: net-failover-group-destroy
Family: vserver

---

### Syntax
```PowerShell
Remove-NcNetFailoverGroup [-Name] <String> [-Vserver] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
