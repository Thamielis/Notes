Set-NcFileDirectorySecurity
---------------------------

### Synopsis
Apply security settings of a policy.

---

### Description

Apply security settings of a policy. To preserve the security configuration of a file(or, folder) or set of files(or, folders) security policy has been defined. Policy is a container for tasks and a task associates a file/folder path name and the security descriptor that needs to be set on the file/folder. Every task in a policy is uniquely identified by the file/folder path. Policy can't have duplicate task entries and there is only one task per path.

---

### Related Links
* [Get-NcFileDirectorySecurity](Get-NcFileDirectorySecurity)

---

### Examples
> Example 1

```PowerShell
Set-NcFileDirectorySecurity policy_1
Apply the policy_1 security policy.
```
> Example 2

```PowerShell
New-NcFileDirectorySecurityNtfs -SecurityDescriptor ntfssd1 | Add-NcFileDirectorySecurityNtfsDacl -Account Administrator -AccessType deny -Rights write -PassThru | Add-NcFileDirectorySecurityNtfsSacl -Account Administrator -AccessType failure -Rights write -PassThru | Add-NcFileDirectorySecurityPolicyTask -Name policy_2 -Path /powershell/cifs -SecurityType ntfs -PassThru | Set-NcFileDirectorySecurity
Build and apply security settings.  The -PassThru switch is used on Add-NcFileDirectorySecurityNtfsDacl and Add-NcFileDirectorySecurityNtfsSacl.
```

---

### Parameters
#### **Name**
The name of the policy whose security settings have to be applied.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **IgnoreBrokenSymlinks**
Specify to, skip broken symlinks.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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
* 

---

### Notes
Category: file directory security
API: file-directory-security-set
Family: vserver

---

### Syntax
```PowerShell
Set-NcFileDirectorySecurity [-Name] <String> [-IgnoreBrokenSymlinks] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
