New-NcNetFailoverGroup
----------------------

### Synopsis
Create a failover group.

---

### Description

Create a failover group. Failover groups are used to define a set of possible failover targets for LIFs on one or more nodes.

---

### Related Links
* [Get-NcNetFailoverGroup](Get-NcNetFailoverGroup)

* [Set-NcNetFailoverGroup](Set-NcNetFailoverGroup)

* [Rename-NcNetFailoverGroup](Rename-NcNetFailoverGroup)

* [Remove-NcNetFailoverGroup](Remove-NcNetFailoverGroup)

---

### Examples
> Example 1

New-NcNetFailoverGroup -Name fg_1 -Vserver pester -Target beam-fs-ps-01:e0c,beam-fs-ps-01:e0d
Create a failover group.

FailoverGroup              Vserver                    Target
-------------              -------                    ------
fg_1                       pester                     {beam-fs-ps-01:e0c, beam-fs-ps-01:e0d}

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

#### **Target**
The list of potential failover targets to be used. Lifs within the specified vserver and assigned to the specified failover-group will use this list of failover targets as needed. 
        
Format: node-name:port-name

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|true    |3       |true (ByPropertyName)|Targets|

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
* DataONTAP.C.Types.Net.NetFailoverGroupInfo

---

### Notes
Category: net
API: net-failover-group-create
Family: cluster

---

### Syntax
```PowerShell
New-NcNetFailoverGroup [-Name] <String> [-Vserver] <String> [-Target] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
