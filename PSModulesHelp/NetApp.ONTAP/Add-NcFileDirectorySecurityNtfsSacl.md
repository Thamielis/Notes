Add-NcFileDirectorySecurityNtfsSacl
-----------------------------------

### Synopsis
Add a system/audit access control entry to NTFS security descriptor.

---

### Description

Add a system/audit access control entry to NTFS security descriptor.

---

### Related Links
* [Remove-NcFileDirectorySecurityNtfsSacl](Remove-NcFileDirectorySecurityNtfsSacl)

* [Set-NcFileDirectorySecurityNtfsSacl](Set-NcFileDirectorySecurityNtfsSacl)

* [Get-NcFileDirectorySecurityNtfsSacl](Get-NcFileDirectorySecurityNtfsSacl)

---

### Examples
> Example 1

Add-NcFileDirectorySecurityNtfsSacl -SecurityDescriptor ntfssd -Account BEAM02\Administrator -AccessType success  -AdvancedRights read_data,read_ea,execute_file,read_attr,read_perm
Add a system/audit access control to NTFS security descriptor.

Account              : BEAM02\Administrator
AdvancedRights       : {read_data, read_ea, execute_file, read_attr...}
ApplyTo              : {this_folder, sub_folders, files}
AuditAccessType      : success
NcController         : 10.63.165.62
NtfsSd               : ntfssd
ReadableAccessRights : read-data, read-ea, execute-file, read-attr, read-perm
Rights               : 
RightsRaw            : 
Vserver              : beam01
RightsRawSpecified   : False

---

### Parameters
#### **SecurityDescriptor**
NTFS security descriptor identifier. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|NtfsSd<br/>Name|

#### **Account**
SACL ACE's SID or domain account name of NTFS security descriptor.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **AccessType**
SACL ACE's access type. Possible values: "failure", "success"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Rights**
DACL ACE's access rights. 
Possible values: "no_access", "full_control", "modify", "read_and_execute", "read", "write"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AdvancedRights**
DACL ACE's Advanced access rights. 
Possible values: 
"read_data", "write_data", "append_data", "read_ea", "write_ea", "execute_file", "delete_child", "read_attr", "write_attr", "delete", "read_perm", "write_perm", "write_owner", "full_control"

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ApplyTo**
To what this ACE applies to.
Possible values: "this_folder", "sub_folders", "files"

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Path**
Path of the File is use when sending to REST API. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AccessControl**
An Access Control Level specifies the access control of the task to be applied when sending to REST API . Possible values: file_directory, slag. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IgnorePaths**
Specifies that permissions on this file or directory cannot be replaced. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PropagationMode**
Specifies how to propagate security settings to child subfolders and files. Possible values: propagate, replace. This parameter is supported with Rest only.

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
If specified, output an object representing the NTFS security descriptor.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileDirectorySecurity.FileDirectorySecurityNtfsSacl

---

### Notes
Category: file directory security
API: file-directory-security-ntfs-sacl-add
Family: vserver

---

### Syntax
```PowerShell
Add-NcFileDirectorySecurityNtfsSacl [-SecurityDescriptor] <String> [-Account] <String> [-AccessType] <String> [-Rights <String>] [-AdvancedRights <String[]>] [-ApplyTo <String[]>] 
```
```PowerShell
[-VserverContext <String>] [-Path <String>] [-AccessControl <String>] [-IgnorePaths <String>] [-PropagationMode <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcFileDirectorySecurityNtfsSacl [-SecurityDescriptor] <String> [-Account] <String> [-AccessType] <String> [-Rights <String>] [-AdvancedRights <String[]>] [-ApplyTo <String[]>] -PassThru 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
