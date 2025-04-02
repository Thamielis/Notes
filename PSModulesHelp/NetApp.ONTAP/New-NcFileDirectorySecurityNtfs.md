New-NcFileDirectorySecurityNtfs
-------------------------------

### Synopsis
Create a new NTFS security descriptor.

---

### Description

Create a new NTFS security descriptor.

---

### Related Links
* [Get-NcFileDirectorySecurityNtfs](Get-NcFileDirectorySecurityNtfs)

* [Set-NcFileDirectorySecurityNtfs](Set-NcFileDirectorySecurityNtfs)

* [Remove-NcFileDirectorySecurityNtfs](Remove-NcFileDirectorySecurityNtfs)

---

### Examples
> Example 1

```PowerShell
New-NcFileDirectorySecurityNtfs -SecurityDescriptor ntfssd -Owner Administrator -Group Administrators
Create a new NTFS security descriptor.

ControlFlagsRaw          : 
Group                    : BUILTIN\Administrators
NcController             : 10.63.165.62
NtfsSd                   : ntfssd
Owner                    : BEAM02\Administrator
Vserver                  : beam01
ControlFlagsRawSpecified : False

```

---

### Parameters
#### **SecurityDescriptor**
NTFS security descriptor identifier. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|NtfsSd<br/>Name|

#### **Owner**
Owner's SID or domain account name of NTFS security descriptor.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Group**
Group's SID or domain account name of NTFS security descriptor.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ControlFlags**
The security descriptor control flags integer value.
The following are the bit fields of control flags.
1... .... .... .... = Self Relative
.0.. .... .... .... = RM Control Valid
..0. .... .... .... = SACL Protected
...0 .... .... .... = DACL Protected
.... 0... .... .... = SACL Inherited
.... .0.. .... .... = DACL Inherited
.... ..0. .... .... = SACL Inherit Required
.... ...0 .... .... = DACL Inherit Required
.... .... ..0. .... = SACL Defaulted
.... .... ...0 .... = SACL Present
.... .... .... 0... = DACL Defaulted
.... .... .... .1.. = DACL Present
.... .... .... ..0. = Group Defaulted
.... .... .... ...0 = Owner Defaulted
At present only the following flags are honored. Others are ignored.
..0. .... .... .... = SACL Protected
...0 .... .... .... = DACL Protected
.... .... ..0. .... = SACL Defaulted
.... .... .... 0... = DACL Defaulted
.... .... .... ..0. = Group Defaulted
.... .... .... ...0 = Owner Defaulted

|Type     |Required|Position|PipelineInput        |Aliases        |
|---------|--------|--------|---------------------|---------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|ControlFlagsRaw|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Path**
Target path. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Acls**
A discretionary access security list (DACL) identifies the trustees that are allowed or denied access to a securable object. This parameter is supported with Rest only.

|Type                                           |Required|Position|PipelineInput        |
|-----------------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.FileDirectorySecurity.Acl]`|false   |named   |true (ByPropertyName)|

#### **IgnorePaths**
Specifies that permissions on this file or directory cannot be replaced. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PropagationMode**
Specifies how to propagate security settings to child subfolders and files. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.FileDirectorySecurity.FileDirectorySecurityNtfs

---

### Notes
Category: file directory security
API: file-directory-security-ntfs-create
Family: vserver

---

### Syntax
```PowerShell
New-NcFileDirectorySecurityNtfs [-SecurityDescriptor] <String> [-Owner <String>] [-Group <String>] [-ControlFlags <Int64>] [-VserverContext <String>] [-Path <String>] [-Acls 
```
```PowerShell
<DataONTAP.C.Types.FileDirectorySecurity.Acl>] [-IgnorePaths <String>] [-PropagationMode <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
