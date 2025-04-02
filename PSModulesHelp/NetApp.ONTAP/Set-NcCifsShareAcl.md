Set-NcCifsShareAcl
------------------

### Synopsis
Set the permissions for a user or group on a defined CIFS share.

---

### Description

Set the permissions for a user or group on a defined CIFS share.

---

### Related Links
* [Add-NcCifsShareAcl](Add-NcCifsShareAcl)

* [Get-NcCifsShareAcl](Get-NcCifsShareAcl)

* [Remove-NcCifsShareAcl](Remove-NcCifsShareAcl)

---

### Examples
> Example 1

Set-NcCifsShareAcl cifsvol1 Users full_control
Give users in the Users group full control of CIFS share cifsvol1.

Share                     UserOrGroup     Permission
-----                     -----------     ----------
cifsvol1                  Users           full_control

---

### Parameters
#### **Share**
The UNIX path prefix to be matched for the mapping.

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[String]`|true    |1       |true (ByPropertyName)|CifsShare<br/>ShareName|

#### **UserOrGroup**
The user or group name for which the permissions are listed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Permission**
The access rights that the user or group has on the defined CIFS share. Possible values: "no_access", "read", "change", "full_control".

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **UserGroupType**
The type of user for which ACL is configured. Default value is windows.
Possible values: 
'windows'        - Windows User or Group
'unix_user'      - Unix User
'unix_group'     - Unix Group

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Winsid**
The Windows SID for the user or group for which the permission is defined.
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Cifs.CifsShareAccessControl

---

### Notes
Category: cifs
API: cifs-share-access-control-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcCifsShareAcl [-Share] <String> [-UserOrGroup] <String> [-Permission] <String> [-UserGroupType <String>] [-Winsid <String>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
