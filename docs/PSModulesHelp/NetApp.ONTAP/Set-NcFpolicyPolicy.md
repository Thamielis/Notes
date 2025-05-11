Set-NcFpolicyPolicy
-------------------

### Synopsis
Modify a policy.

---

### Description

Modify a policy.

---

### Related Links
* [Get-NcFpolicyPolicy](Get-NcFpolicyPolicy)

* [New-NcFpolicyPolicy](New-NcFpolicyPolicy)

* [Remove-NcFpolicyPolicy](Remove-NcFpolicyPolicy)

---

### Examples
> Example 1

```PowerShell
Set-NcFpolicyPolicy -Name test_policy -Mandatory $true
Set the given FPolicy policy to mandatory.

AllowPrivilegedAccess          : False
EngineName                     : native
Events                         : {cifs_event}
IsMandatory                    : True
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
|`[String[]]`|false   |2       |true (ByPropertyName)|Events |

#### **EngineName**
Name of the Engine. Default Engine is 'native'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Mandatory**
Indicator if the screening with this policy is required, i.e. it will fail if no servers are able process the notification registered as a part of external engine. If set to true, the request will fail if there is no  server to evaluate it. If it's false, the request will succeed.

|Type       |Required|Position|PipelineInput|Aliases    |
|-----------|--------|--------|-------------|-----------|
|`[Boolean]`|false   |named   |false        |IsMandatory|

#### **AllowPrivilegedAccess**
Indicator if privileged access should be given to FPolicy servers registered for the policy.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **PrivilegedUserName**
User name for privileged access.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsPassthroughReadEnabled**
Indicator if passthrough-read should be allowed to FPolicy servers registered for the policy. Default is false.

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
API: fpolicy-policy-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcFpolicyPolicy [-Name] <String> [[-Event] <String[]>] [[-EngineName] <String>] [-Mandatory <Boolean>] [-AllowPrivilegedAccess <Boolean>] [-PrivilegedUserName <String>] 
```
```PowerShell
[-IsPassthroughReadEnabled <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
