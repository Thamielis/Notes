Remove-NcFileDirectorySecurityNtfsSacl
--------------------------------------

### Synopsis
Remove a system/audit access control entry from NTFS security descriptor.

---

### Description

Remove a system/audit access control entry from NTFS security descriptor.

---

### Related Links
* [Get-NcFileDirectorySecurityNtfsSacl](Get-NcFileDirectorySecurityNtfsSacl)

* [Set-NcFileDirectorySecurityNtfsSacl](Set-NcFileDirectorySecurityNtfsSacl)

* [Add-NcFileDirectorySecurityNtfsSacl](Add-NcFileDirectorySecurityNtfsSacl)

---

### Examples
> Example 1

```PowerShell
Remove-NcFileDirectorySecurityNtfsSacl -SecurityDescriptor ntfssd -Account BEAM02\Administrator -AccessType success
Remove the system/audit access control entry.
```

---

### Parameters
#### **SecurityDescriptor**
NTFS security descriptor identifier. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|NtfsSd<br/>Name|

#### **Account**
DACL ACE's SID or domain account name of NTFS security descriptor.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **AccessType**
Specifies DACL ACE's access type.  Possible values:  "failure", "success"

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |3       |true (ByPropertyName)|AuditAccessType|

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
Valid Values:

* file_directory
* slag

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ApplyTo**
Specifies where to apply the DACL or SACL entries.To instantiate please create object using New-Object DataONTAP.C.Types.FileDirectorySecurity.ApplyTo. This parameter is supported with Rest only.

|Type                                               |Required|Position|PipelineInput|
|---------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.FileDirectorySecurity.ApplyTo]`|false   |named   |false        |

#### **IgnorePaths**
Specifies that permissions on this file or directory cannot be replaced. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PropagationMode**
Specifies how to propagate security settings to child subfolders and files. Possible values: propagate, replace. This parameter is supported with Rest only.
Valid Values:

* propagate
* replace

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
* 

---

### Notes
Category: file directory security
API: file-directory-security-ntfs-sacl-remove
Family: vserver

---

### Syntax
```PowerShell
Remove-NcFileDirectorySecurityNtfsSacl [-SecurityDescriptor] <String> [-Account] <String> [-AccessType] <String> [-VserverContext <String>] [-Path <String>] [-AccessControl <String>] 
```
```PowerShell
[-ApplyTo <DataONTAP.C.Types.FileDirectorySecurity.ApplyTo>] [-IgnorePaths <String>] [-PropagationMode <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcFileDirectorySecurityNtfsSacl [-SecurityDescriptor] <String> [-Account] <String> [-AccessType] <String> -PassThru [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
