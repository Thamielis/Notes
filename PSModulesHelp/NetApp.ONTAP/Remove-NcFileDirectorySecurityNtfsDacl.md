Remove-NcFileDirectorySecurityNtfsDacl
--------------------------------------

### Synopsis
Remove a discretionary access control entry from NTFS security descriptor.

---

### Description

Remove a discretionary access control entry from NTFS security descriptor.

---

### Related Links
* [Add-NcFileDirectorySecurityNtfsDacl](Add-NcFileDirectorySecurityNtfsDacl)

* [Set-NcFileDirectorySecurityNtfsDacl](Set-NcFileDirectorySecurityNtfsDacl)

* [Get-NcFileDirectorySecurityNtfsDacl](Get-NcFileDirectorySecurityNtfsDacl)

---

### Examples
> Example 1

```PowerShell
Remove-NcFileDirectorySecurityNtfsDacl -SecurityDescriptor ntfssd -Account BEAM02\Administrator -AccessType deny
Remove the discretionary access control entry.
```

---

### Parameters
#### **SecurityDescriptor**
NTFS security descriptor identifier.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|NtfsSd<br/>Name|

#### **Account**
DACL ACE's SID or domain account name of NTFS security descriptor.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **AccessType**
Specifies DACL ACE's access type.  Possible values:  "deny", "allow"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
* 

---

### Notes
Category: file directory security
API: file-directory-security-ntfs-dacl-remove
Family: vserver

---

### Syntax
```PowerShell
Remove-NcFileDirectorySecurityNtfsDacl [-SecurityDescriptor] <String> [-Account] <String> [-AccessType] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcFileDirectorySecurityNtfsDacl [-SecurityDescriptor] <String> [-Account] <String> [-AccessType] <String> -PassThru [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
