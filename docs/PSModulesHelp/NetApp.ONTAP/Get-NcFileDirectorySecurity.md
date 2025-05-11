Get-NcFileDirectorySecurity
---------------------------

### Synopsis
Get security information of a file/folder.

---

### Description

Get security information of a file/folder.

---

### Related Links
* [Set-NcFileDirectorySecurity](Set-NcFileDirectorySecurity)

---

### Examples
> Example 1

```PowerShell
Get-NcFileDirectorySecurity -Path /powershell/cifs
Get the security information of the given folder.

NcController          : 10.63.165.62
SecurityStyle         : ntfs
EffectiveStyle        : ntfs
DosAttributes         : 16
DosAttributesText     : ----D---
DosAttributesExpanded : 
UnixUserId            : 0
UnixGroupId           : 0
UnixModeBits          : 777
Acls                  : {NTFS Security Descriptor, Control:0x8004, Owner:BUILTIN\Administrators, 
                        Group:BUILTIN\Administrators...}

```

---

### Parameters
#### **Path**
Specifies the file or folder path whose security information needs to be read. 
If Volume is specified, Path is from the root of the given volume.  If CifsShare is specified, Path is from the root of the given cifs share.  If Volume and CifsShare are not specified, path name lookup starts from the root path of the vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Volume**
If specified, the given path name lookup starts from volume junction path of the given volume.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |2       |true (ByPropertyName)|VolumeName|

#### **LookupNames**
If specified, the SID will be converted to user/group name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExpandMask**
If specified, expand the bit mask of DOS attributes, security descriptor's control flags and every ACE.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TextualMask**
Specifies whether to show the mask in textual format.
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Sddl**
Specifies whether to show the acls in windows sddl format.
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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

#### **CifsShare**
If specified, the given path name lookup starts from cifs share map path of the given cifs share.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |2       |true (ByPropertyName)|CifsShareName|

#### **Inode**
Inode number of the file.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int64]`|true    |1       |true (ByPropertyName)|InodeNumber|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileDirectorySecurity.FileDirectorySecurityInfo

---

### Notes
Category: file directory security
API: file-directory-security-get
Family: vserver

---

### Syntax
```PowerShell
Get-NcFileDirectorySecurity [-Path] <String> [[-Volume] <String>] [-LookupNames] [-ExpandMask] [-TextualMask <Boolean>] [-Sddl <Boolean>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurity [-Path] <String> [-CifsShare] <String> [-LookupNames] [-ExpandMask] [-TextualMask <Boolean>] [-Sddl <Boolean>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurity [[-Volume] <String>] [-LookupNames] [-ExpandMask] [-Inode] <Int64> [-TextualMask <Boolean>] [-Sddl <Boolean>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurity [-CifsShare] <String> [-LookupNames] [-ExpandMask] [-Inode] <Int64> [-TextualMask <Boolean>] [-Sddl <Boolean>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
