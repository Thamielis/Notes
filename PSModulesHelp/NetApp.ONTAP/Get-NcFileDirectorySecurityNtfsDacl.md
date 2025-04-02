Get-NcFileDirectorySecurityNtfsDacl
-----------------------------------

### Synopsis
Get information about one or more discretionary access control entries.

---

### Description

Get information about one or more discretionary access control entries.

---

### Related Links
* [Set-NcFileDirectorySecurityNtfsDacl](Set-NcFileDirectorySecurityNtfsDacl)

* [Add-NcFileDirectorySecurityNtfsDacl](Add-NcFileDirectorySecurityNtfsDacl)

* [Remove-NcFileDirectorySecurityNtfsDacl](Remove-NcFileDirectorySecurityNtfsDacl)

---

### Examples
> Example 1

Get-NcFileDirectorySecurityNtfsDacl -SecurityDescriptor ntfssd
Get the discretionary access control entries for the given security descriptor.

AccessType           : allow
Account              : CREATOR OWNER
AdvancedRights       : 
ApplyTo              : {this_folder, sub_folders, files}
NcController         : 10.63.165.62
NtfsSd               : ntfssd
ReadableAccessRights : full-control
Rights               : full_control
RightsRaw            : 
Vserver              : beam01
RightsRawSpecified   : False

AccessType           : allow
Account              : NT AUTHORITY\SYSTEM
AdvancedRights       : 
ApplyTo              : {this_folder, sub_folders, files}
NcController         : 10.63.165.62
NtfsSd               : ntfssd
ReadableAccessRights : full-control
Rights               : full_control
RightsRaw            : 
Vserver              : beam01
RightsRawSpecified   : False

AccessType           : allow
Account              : BUILTIN\Administrators
AdvancedRights       : 
ApplyTo              : {this_folder, sub_folders, files}
NcController         : 10.63.165.62
NtfsSd               : ntfssd
ReadableAccessRights : full-control
Rights               : full_control
RightsRaw            : 
Vserver              : beam01
RightsRawSpecified   : False

AccessType           : allow
Account              : BUILTIN\Users
AdvancedRights       : 
ApplyTo              : {this_folder, sub_folders, files}
NcController         : 10.63.165.62
NtfsSd               : ntfssd
ReadableAccessRights : full-control
Rights               : full_control
RightsRaw            : 
Vserver              : beam01
RightsRawSpecified   : False

---

### Parameters
#### **SecurityDescriptor**
Name of one or more NTFS security descriptors.  Data ONTAP wildcards are permitted. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NtfsSd<br/>Name|

#### **Account**
One or more DACL ACE's SID or domain account name of NTFS security descriptor.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **AccessType**
One or more DACL ACE's access type.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FileDirectorySecurityNtfsDacl object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFileDirectorySecurityNtfsDacl -Template" to get the initially empty FileDirectorySecurityNtfsDacl object.  If not specified, all data is returned for each object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[FileDirectorySecurityNtfsDacl]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty FileDirectorySecurityNtfsDacl object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FileDirectorySecurityNtfsDacl object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFileDirectorySecurityNtfsDacl -Template" to get the initially empty FileDirectorySecurityNtfsDacl object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[FileDirectorySecurityNtfsDacl]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileDirectorySecurity.FileDirectorySecurityNtfsDacl

---

### Notes
Category: file directory security
API: file-directory-security-ntfs-dacl-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcFileDirectorySecurityNtfsDacl [[-SecurityDescriptor] <String[]>] [[-Account] <String[]>] [[-AccessType] <String[]>] [-Vserver <String[]>] [-Attributes <FileDirectorySecurityNtfsDacl>] 
```
```PowerShell
[-VserverContext <String>] [-Path <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurityNtfsDacl -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurityNtfsDacl -Query <FileDirectorySecurityNtfsDacl> [-Attributes <FileDirectorySecurityNtfsDacl>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
