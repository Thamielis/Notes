Remove-NcNetFailoverGroupTarget
-------------------------------

### Synopsis
Remove failover targets from a failover group.

---

### Description

Remove failover targets from a failover group.

---

### Related Links
* [Get-NcNetFailoverGroup](Get-NcNetFailoverGroup)

* [Remove-NcNetFailoverGroup](Remove-NcNetFailoverGroup)

* [Add-NcNetFailoverGroupTarget](Add-NcNetFailoverGroupTarget)

---

### Examples
> Example 1

Remove-NcNetFailoverGroupTarget -Name test_group -Vserver pstk_peer -Target "aparajir-vsim2:e0d"
Remove one target from failover group test_group

FailoverGroup              Vserver                    Target
-------------              -------                    ------
test_group                 pstk_peer                  aparajir-vsim1:e0c

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
The list of potential failover targets to be removed. Format: node-name:port-name

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
The number of times to retry commands that return with errors that may succeed after a retry

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
API: net-failover-group-remove-targets
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetFailoverGroupTarget [-Name] <String> [-Vserver] <String> [-Target] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
