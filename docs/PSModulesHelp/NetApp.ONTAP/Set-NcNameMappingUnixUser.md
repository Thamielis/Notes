Set-NcNameMappingUnixUser
-------------------------

### Synopsis
Modify the attributes of a unix user.

---

### Description

Modify the attributes of a unix user.

---

### Related Links
* [Get-NcNameMappingUnixUser](Get-NcNameMappingUnixUser)

---

### Examples
> Example 1

Set-NcNameMappingUnixUser -Name root -FullName "Root user"
Set the full name of the root user.

UserName             UserId GroupId Vserver                   FullName
--------             ------ ------- -------                   --------
root                      0       0 costea01                  Root user

> Example 2

Get-NcNameMappingUnixUser | Set-NcNameMappingUnixUser -GroupId 0
Set all unix users to have GID 0.

UserName             UserId GroupId Vserver                   FullName
--------             ------ ------- -------                   --------
clinton                  10       0 costea01                  Clinton Knight
root                      0       0 costea01
test3                     3       0 costea01                  test3test3

---

### Parameters
#### **Name**
The unix account name of the user to modify.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|UserName|

#### **UserId**
Specifies an identification number for the unix user.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **GroupId**
Specifies the primary group identification number for the unix user.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **FullName**
The full name of the unix user.

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
* DataONTAP.C.Types.NameMapping.UnixUserInfo

---

### Notes
Category: name mapping
API: name-mapping-unix-user-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcNameMappingUnixUser [-Name] <String> [-UserId <Int64>] [-GroupId <Int64>] [-FullName <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
