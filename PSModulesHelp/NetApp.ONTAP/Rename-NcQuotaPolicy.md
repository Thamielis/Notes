Rename-NcQuotaPolicy
--------------------

### Synopsis
Rename a quota policy

---

### Description

Rename a quota policy

---

### Related Links
* [New-NcQuotaPolicy](New-NcQuotaPolicy)

* [Copy-NcQuotaPolicy](Copy-NcQuotaPolicy)

---

### Examples
> Example 1

Rename-NcQuotaPolicy -OldPolicyName newPolicy1 -NewPolicyName renamedPolicy1
Rename a policy

PolicyName                     Vserver                        LastModified
----------                     -------                        ------------
renamedPolicy1                 pstk                           4/21/2015 8:50:06 PM

---

### Parameters
#### **OldPolicyName**
Name of the quota policy.

|Type      |Required|Position|PipelineInput        |Aliases               |
|----------|--------|--------|---------------------|----------------------|
|`[String]`|true    |1       |true (ByPropertyName)|OldName<br/>PolicyName|

#### **NewPolicyName**
New name for the quota policy.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|NewName|

#### **Vserver**
The vserver owning the policy.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |3       |true (ByPropertyName)|OwningVserver|

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
* DataONTAP.C.Types.Quota.QuotaPolicyInfo

---

### Notes
Category: quota
API: quota-policy-rename
Family: cluster, vserver

---

### Syntax
```PowerShell
Rename-NcQuotaPolicy [-OldPolicyName] <String> [-NewPolicyName] <String> [-Vserver] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
