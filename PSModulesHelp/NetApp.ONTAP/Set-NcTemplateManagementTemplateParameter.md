Set-NcTemplateManagementTemplateParameter
-----------------------------------------

### Synopsis
Modify attributes of a parameter.

---

### Description

Modify attributes of a parameter.

---

### Examples
> Example 1

```PowerShell
PS C:> Set-NcTemplateManagementTemplateParameter -DefaultValue 2 -Name vserver -Template newdestinationtemplate
AllowedVals        :
DefaultValue       : 2
MaxLength          :
Name               : vserver
NcController       : 172.20.4.24
Permission         : readwrite
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : newdestinationtemplate
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

```

---

### Parameters
#### **DefaultValue**
Default value of the parameter

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Name**
Name of the parameter

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Template**
Name of the template

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
* DataONTAP.C.Types.TemplateManagement.TemplateParameterInfo

---

### Notes
Category: template management
API: template-management-template-parameter-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcTemplateManagementTemplateParameter [-DefaultValue <String>] [-Name] <String> [-Template] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
