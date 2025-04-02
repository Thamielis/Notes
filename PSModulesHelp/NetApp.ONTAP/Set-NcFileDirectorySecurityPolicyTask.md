Set-NcFileDirectorySecurityPolicyTask
-------------------------------------

### Synopsis
Remove a task from the policy of a vserver.

---

### Description

Remove a task from the policy of a vserver.

---

### Related Links
* [Get-NcFileDirectorySecurityPolicyTask](Get-NcFileDirectorySecurityPolicyTask)

* [Add-NcFileDirectorySecurityPolicyTask](Add-NcFileDirectorySecurityPolicyTask)

* [Remove-NcFileDirectorySecurityPolicyTask](Remove-NcFileDirectorySecurityPolicyTask)

---

### Examples
> Example 1

```PowerShell
Set-NcFileDirectorySecurityPolicyTask -Name policy_1 -Path /powershell/cifs -NtfsMode replace
Modify the security policy task.

NcController             : 10.63.165.62
NtfsMode                 : replace
NtfsSd                   : ntfssd
Path                     : /powershell/cifs
PolicyName               : policy_1
SecurityType             : ntfs
TaskIndexNumber          : 1
Vserver                  : beam01
TaskIndexNumberSpecified : True

```

---

### Parameters
#### **Name**
The name of the policy who has the task.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **Path**
The file or folder path of a task.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **SecurityType**
The type of security.  Possible values: "ntfs", "nfsv4"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NtfsMode**
NTFS propagation mode.  Possible values: "propagate", "ignore", "replace"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NtfsSecurityDescriptor**
NTFS security descriptor identifier.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|NtfsSd |

#### **Index**
the target index/position of this task in the policy.  If a policy has already 5 tasks and this is the 6th task you are adding and you want to add this task as 2nd task, you can specifiy the index 2. By default the task gets added as last task. If the index number exceeds the number of positions, it will go at the end.

|Type     |Required|Position|PipelineInput        |Aliases        |
|---------|--------|--------|---------------------|---------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|TaskIndexNumber|

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

#### **PassThru**
If specified, output an object representing the NTFS security descriptor.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileDirectorySecurity.FileDirectorySecurityPolicyTask

---

### Notes
Category: file directory security
API: file-directory-security-policy-task-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcFileDirectorySecurityPolicyTask [-Name] <String> [-Path] <String> [-SecurityType <String>] [-NtfsMode <String>] [-NtfsSecurityDescriptor <String>] [-Index <Int32>] [-VserverContext 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcFileDirectorySecurityPolicyTask [-Name] <String> [-Path] <String> [-SecurityType <String>] [-NtfsMode <String>] [-NtfsSecurityDescriptor <String>] [-Index <Int32>] -PassThru 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
