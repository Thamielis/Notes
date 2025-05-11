Add-NcFileDirectorySecurityPolicyTask
-------------------------------------

### Synopsis
Add a file security policy task.

---

### Description

Add a file security policy task.  A task maps security descriptor with a file or folder.

---

### Related Links
* [Remove-NcFileDirectorySecurityPolicyTask](Remove-NcFileDirectorySecurityPolicyTask)

* [Set-NcFileDirectorySecurityPolicyTask](Set-NcFileDirectorySecurityPolicyTask)

* [Get-NcFileDirectorySecurityPolicyTask](Get-NcFileDirectorySecurityPolicyTask)

---

### Examples
> Example 1

```PowerShell
Add-NcFileDirectorySecurityPolicyTask -Name policy_1 -Path /powershell/cifs -SecurityType ntfs -NtfsSecurityDescriptor ntfssd
Add the security policy task to the given path.

NcController             : 10.63.165.62
NtfsMode                 : propagate
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
The name of the policy to which the task needs to be added. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **Path**
The file or folder path of the task.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **SecurityType**
The type of security.  Possible values: "ntfs", "nfsv4". This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NtfsMode**
NTFS propagation mode.  Possible values: "propagate", "ignore", "replace"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NtfsSecurityDescriptor**
NTFS security descriptor identifier. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|NtfsSd |

#### **Index**
the target index/position of this task in the policy.  If a policy has already 5 tasks and this is the 6th task you are adding and you want to add this task as 2nd task, you can specifiy the index 2. By default the task gets added as last task. If the index number exceeds the number of positions, it will go at the end. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |Aliases        |
|---------|--------|--------|---------------------|---------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|TaskIndexNumber|

#### **AccessControl**
Specifies the access control of task to be applied. Possible values: "file-directory", "slag"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Acls**
An ACE is an element in an access control list (ACL).An ACL can have zero or more ACEs.To instantiate please create object using New-Object DataONTAP.C.Types.FileDirectorySecurity.Acl. This parameter is supported with Rest only.

|Type                                                  |Required|Position|PipelineInput|
|------------------------------------------------------|--------|--------|-------------|
|`[List <DataONTAP.C.Types.FileDirectorySecurity.Acl>]`|false   |named   |false        |

#### **IgnorePaths**
Specifies that permissions on this file or directory cannot be replaced. This parameter is supported with Rest only.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[List <String>]`|false   |named   |false        |

#### **Group**
Specifies the owner's primary group.You can specify the owner group using either a group name or SID. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Owner**
An array , where each element is the path of one lun. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ControlFlags**
Specifies the control flags in the SD. It is a Hexadecimal Value. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
If specified, output an object representing the NTFS security policy.

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
API: file-directory-security-policy-task-add
Family: vserver

---

### Syntax
```PowerShell
Add-NcFileDirectorySecurityPolicyTask [-Name] <String> [-Path] <String> [-SecurityType <String>] [-NtfsMode <String>] [-NtfsSecurityDescriptor <String>] [-Index <Int32>] [-AccessControl 
```
```PowerShell
<String>] [-VserverContext <String>] [-Acls <List <DataONTAP.C.Types.FileDirectorySecurity.Acl>>] [-IgnorePaths <List <String>>] [-Group <String>] [-Owner <String>] [-ControlFlags <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcFileDirectorySecurityPolicyTask [-Name] <String> [-Path] <String> [-SecurityType <String>] [-NtfsMode <String>] [-NtfsSecurityDescriptor <String>] [-Index <Int32>] [-AccessControl 
```
```PowerShell
<String>] -PassThru [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
