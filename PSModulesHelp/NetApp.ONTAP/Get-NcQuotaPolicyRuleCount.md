Get-NcQuotaPolicyRuleCount
--------------------------

### Synopsis
Returns a list of quota-policy-rule-count objects.

---

### Description

Returns a list of quota-policy-rule-count objects.

---

### Related Links
* [Get-NcQuotaPolicy](Get-NcQuotaPolicy)

---

### Examples
> Example 1

```PowerShell
Get-NcQuotaPolicyRuleCount -Policy policy1,policy2 -Volume vol1,vol2
Get the attributes of the quota-policy-rule-count filtered by the policies policy1, policy2 and by volumes vol1, vol2.

CountWherePolicy                         : 1
CountWherePolicyVolume                   : 1
CountWherePolicyVolumeQtree              : 1
CountWherePolicyVolumeQtreeType          : 1
CountWherePolicyVolumeType               : 1
NcController                             : 10.238.73.251
Policy                                   : policy1
Qtree                                    :
QuotaType                                : tree
Volume                                   : vol1
Vserver                                  : vs1
CountWherePolicySpecified                : True
CountWherePolicyVolumeQtreeSpecified     : True
CountWherePolicyVolumeQtreeTypeSpecified : True
CountWherePolicyVolumeSpecified          : True
CountWherePolicyVolumeTypeSpecified      : True

CountWherePolicy                         : 1
CountWherePolicyVolume                   : 1
CountWherePolicyVolumeQtree              : 1
CountWherePolicyVolumeQtreeType          : 1
CountWherePolicyVolumeType               : 1
NcController                             : 10.238.73.251
Policy                                   : policy2
Qtree                                    : qtree2
QuotaType                                : user
Volume                                   : vol2
Vserver                                  : vs1
CountWherePolicySpecified                : True
CountWherePolicyVolumeQtreeSpecified     : True
CountWherePolicyVolumeQtreeTypeSpecified : True
CountWherePolicyVolumeSpecified          : True
CountWherePolicyVolumeTypeSpecified      : True

```

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Policy**
The name of the quota policy.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Volume**
Specify to filter by Volume

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Qtree**
Specify to filter by Qtree

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **QuotaType**
Specify to filter by QuotaType

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[QuotaPolicyRuleCountInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[QuotaPolicyRuleCountInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Quota.QuotaPolicyRuleCountInfo

---

### Notes
Category: quota
API: quota-policy-rule-count-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcQuotaPolicyRuleCount [[-Vserver] <String[]>] [[-Policy] <String[]>] [[-Volume] <String[]>] [[-Qtree] <String[]>] [[-QuotaType] <String[]>] [-Attributes <QuotaPolicyRuleCountInfo>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcQuotaPolicyRuleCount -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQuotaPolicyRuleCount -Query <QuotaPolicyRuleCountInfo> [-Attributes <QuotaPolicyRuleCountInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
