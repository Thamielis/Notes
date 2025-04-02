Remove-NcNameMappingUnixGroupUser
---------------------------------

### Synopsis
Remove a user from a unix group.

---

### Description

Remove a user from a unix group.

---

### Related Links
* [Get-NcNameMappingUnixGroup](Get-NcNameMappingUnixGroup)

* [Get-NcNameMappingUnixUser](Get-NcNameMappingUnixUser)

* [Add-NcNameMappingUnixGroupUser](Add-NcNameMappingUnixGroupUser)

---

### Examples
> Example 1

Remove-NcNameMappingUnixGroupUser -Name xenUsers -UserName clinton
Remove user 'clinton' from unix group 'xenUsers'.

GroupName            GroupId Vserver                   Users
---------            ------- -------                   -----
xenUsers                 101 costea01

> Example 2

(Get-NcNameMappingUnixGroup xenUsers).Users | Remove-NcNameMappingUnixGroupUser -Name xenUsers
Remove all users from unix group 'xenUsers'.

GroupName            GroupId Vserver                   Users
---------            ------- -------                   -----
xenUsers                 101 costea01

---

### Parameters
#### **Name**
The name of the unix group to modify.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |1       |true (ByPropertyName)|GroupName|

#### **UserName**
The name of the unix user to remove.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.NameMapping.UnixGroupInfo

---

### Notes
Category: name mapping
API: name-mapping-unix-group-delete-user
Family: vserver

---

### Syntax
```PowerShell
Remove-NcNameMappingUnixGroupUser [-Name] <String> [-UserName] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
