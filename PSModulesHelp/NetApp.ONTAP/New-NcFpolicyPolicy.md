New-NcFpolicyPolicy
-------------------

### Synopsis
Create a new Fpolicy policy.

---

### Description

Create a new Fpolicy policy.

---

### Related Links
* [Get-NcFpolicyPolicy](Get-NcFpolicyPolicy)

* [Set-NcFpolicyPolicy](Set-NcFpolicyPolicy)

* [Remove-NcFpolicyPolicy](Remove-NcFpolicyPolicy)

---

### Examples
> Example 1

```PowerShell
New-NcFpolicyPolicy -Name test_policy -Event cifs_event -EngineName native -NonMandatory
Create a new FPolicy policy.

AllowPrivilegedAccess          : False
EngineName                     : native
Events                         : {cifs_event}
IsMandatory                    : False
NcController                   : 10.63.165.62
PolicyName                     : test_policy
PrivilegedUserName             :
Vserver                        : beam01
AllowPrivilegedAccessSpecified : True
IsMandatorySpecified           : True

```

---

### Parameters
#### **Name**
Name of the policy.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **Event**
Events for file access monitoring.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|true    |2       |true (ByPropertyName)|Events |

#### **EngineName**
Name of the Engine. Default Engine is 'native'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **NonMandatory**
If specified, the screening with this policy is not required, i.e. it will pass if no servers are able process the notification registered as a part of external engine.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowPrivilegedAccess**
If true, privileged access should be given to FPolicy servers registered for the policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PrivilegedUserName**
User name for privileged access.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsPassthroughReadEnabled**
Indicates if passthrough-read should be allowed to FPolicy servers registered for the policy. Default is 'false'.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyPolicyInfo

---

### Notes
Category: fpolicy
API: fpolicy-policy-create
Family: vserver

---

### Syntax
```PowerShell
New-NcFpolicyPolicy [-Name] <String> [-Event] <String[]> [-EngineName] <String> [-NonMandatory] [-AllowPrivilegedAccess] [-PrivilegedUserName <String>] [-IsPassthroughReadEnabled <Boolean>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
