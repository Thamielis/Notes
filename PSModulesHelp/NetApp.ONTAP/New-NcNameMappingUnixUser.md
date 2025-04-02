New-NcNameMappingUnixUser
-------------------------

### Synopsis
Create a new unix user.

---

### Description

Create a new unix user.

---

### Related Links
* [Remove-NcNameMappingUnixUser](Remove-NcNameMappingUnixUser)

---

### Examples
> Example 1

New-NcNameMappingUnixUser -Name clinton -UserId 10 -GroupId 0 -FullName "Clinton Knight"
Create a new unix user.

UserName             UserId GroupId Vserver                   FullName
--------             ------ ------- -------                   --------
clinton                  10       0 costea01                  Clinton Knight

---

### Parameters
#### **Name**
The unix account name of the new user.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|UserName|

#### **UserId**
Specifies an identification number for the unix user.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |2       |true (ByPropertyName)|

#### **GroupId**
Specifies the primary group identification number for the unix user.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |3       |true (ByPropertyName)|

#### **FullName**
The full name of the new unix user.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **SkipNameValidation**
Specify to skip user name validation.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Svm**
Specifies the SVM. To create object use New-Object DataONTAP.C.Types.NameMapping.Svm. This parameter is supported with Rest only.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.NameMapping.Svm]`|false   |named   |false        |

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
API: name-mapping-unix-user-create
Family: vserver

---

### Syntax
```PowerShell
New-NcNameMappingUnixUser [-Name] <String> [-UserId] <Int64> [-GroupId] <Int64> [[-FullName] <String>] [-SkipNameValidation] [-VserverContext <String>] [-Svm 
```
```PowerShell
<DataONTAP.C.Types.NameMapping.Svm>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
