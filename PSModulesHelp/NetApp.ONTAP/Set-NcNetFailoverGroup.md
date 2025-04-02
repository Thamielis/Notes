Set-NcNetFailoverGroup
----------------------

### Synopsis
Modify a failover group.

---

### Description

Modify a failover group.

---

### Related Links
* [Get-NcNetFailoverGroup](Get-NcNetFailoverGroup)

* [Rename-NcNetFailoverGroup](Rename-NcNetFailoverGroup)

* [Remove-NcNetFailoverGroup](Remove-NcNetFailoverGroup)

* [New-NcNetFailoverGroup](New-NcNetFailoverGroup)

---

### Examples
> Example 1

Set-NcNetFailoverGroup -Name pester_fg_1 -Vserver pester -Target beam-fs-ps-01:e0a,beam-fs-ps-01:e0b,beam-fs-ps-01:e0c
Set the targets for the pester_fg_1 failover group on vserver 'pester'.

FailoverGroup              Vserver                    Target
-------------              -------                    ------
pester_fg_1                pester                     {beam-fs-ps-01:e0a, beam-fs-ps-01:e0b, beam-fs-ps-01:e0c}

> Example 2

Set-NcNetFailoverGroup -Name pester_fg_1 -Vserver pester -AddPort beam-fs-ps-01:e0d
Add port e0d on node beam-fs-ps-01 to the failover group.

FailoverGroup              Vserver                    Target
-------------              -------                    ------
pester_fg_1                pester                     {beam-fs-ps-01:e0a, beam-fs-ps-01:e0b, beam-fs-ps-01:e0c, beam...

> Example 3

Set-NcNetFailoverGroup -Name pester_fg_1 -Vserver pester -RemovePort beam-fs-ps-01:e0a
Remove port e0a on node beam-fs-ps-01 from the failover group.

FailoverGroup              Vserver                    Target
-------------              -------                    ------
pester_fg_1                pester                     {beam-fs-ps-01:e0b, beam-fs-ps-01:e0c, beam-fs-ps-01:e0d}

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

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

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

#### **AddPort**
The ports to add to the failover group. 
Format: node-name:port-name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **RemovePort**
The ports to remove from the failover group. 
Format: node-name:port-name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetFailoverGroupInfo

---

### Notes
Category: net
API: net-failover-group-modify,net-failover-group-add-ports,net-failover-group-delete-ports
Family: cluster

---

### Syntax
```PowerShell
Set-NcNetFailoverGroup [-Name] <String> [-Vserver] <String> -Target <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcNetFailoverGroup [-Name] <String> [-Vserver] <String> -AddPort <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcNetFailoverGroup [-Name] <String> [-Vserver] <String> -RemovePort <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
