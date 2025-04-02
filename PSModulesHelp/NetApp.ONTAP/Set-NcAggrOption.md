Set-NcAggrOption
----------------

### Synopsis
Set the specified option for the given aggregate.

---

### Description

Set the specified option for the given aggregate.  The change remains effective even if the controller is rebooted.   Some options have values that are numbers, and some have values that are "on" (also expressible as "yes", "true", or "1" ) or "off" (also expressible as "no", "false", or "0").  A mixture of uppercase and lowercase characters may be used when typing an option's value.  Note that the "root" option is special in that it doesn't have a corresponding value. This API does not support modifying options of striped aggregates.

---

### Related Links
* [Get-NcAggrOption](Get-NcAggrOption)

---

### Examples
> Example 1

Set-NcAggrOption aggr3 raid_lost_write off
Set an option value for aggregate 'aggr3'.

Name  State  TotalSize Used Available Disks RaidType       RaidSize Volumes
----  -----  --------- ---- --------- ----- --------       -------- -------
aggr3 online  717.1 GB   0%  717.1 GB   8   raid_dp,normal    16          0

---

### Parameters
#### **Name**
Name of the aggregate whose option is to be set.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Key**
Option name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Value**
The value to set the named option.  It may be the NULL/empty value only in the case of the "root" option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

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

#### **Options**
An array of AggrOptionInfo values.  Note that not all options returned by Get-NaAggrOption may be set.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[AggrOptionInfo[]]`|true    |2       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrAttributes

---

### Notes
Category: aggr
API: aggr-set-option
Family: cluster

---

### Syntax
```PowerShell
Set-NcAggrOption [-Name] <String> [-Key] <String> [-Value] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcAggrOption [-Name] <String> [-Options] <AggrOptionInfo[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
