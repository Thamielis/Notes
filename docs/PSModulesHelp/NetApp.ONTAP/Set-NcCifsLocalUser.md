Set-NcCifsLocalUser
-------------------

### Synopsis
Modify a CIFS local user.

---

### Description

Modify a CIFS local user.

---

### Related Links
* [Get-NcCifsLocalUser](Get-NcCifsLocalUser)

* [Rename-NcCifsLocalUser](Rename-NcCifsLocalUser)

* [Remove-NcCifsLocalUser](Remove-NcCifsLocalUser)

* [New-NcCifsLocalUser](New-NcCifsLocalUser)

---

### Examples
> Example 1

```PowerShell
Set-NcCifsLocalUser bort -FullName 'Bort Samson'
Set the full name for user bort.

Description                :
FullName                   : Bort Samson
IsAccountDisabled          : False
NcController               : 10.63.165.62
UserName                   : BEAM02\bort
Vserver                    : beam01
IsAccountDisabledSpecified : True

```
> Example 2

Set-NcCifsLocalUser bort -Password (Read-Host "Password" -AsSecureString)
Change the password for the user bort by prompting for the new password on the console.

UserName                             Disabled  Vserver                  Description
--------                             --------  -------                  -----------
BEAM02\bort                           False    beam01

> Example 3

Set-NcCifsLocalUser bort -Password (ConvertTo-SecureString "P@ssword123" -Force -AsPlainText)
Set the password for CIFS local user bort to the given plain text string.

UserName                             Disabled  Vserver                  Description
--------                             --------  -------                  -----------
BEAM02\bort                           False    beam01

---

### Parameters
#### **UserName**
The username of the CIFS local user.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **FullName**
The full name of the CIFS local user.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Description**
The description of the CIFS local user.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsAccountDisabled**
If true, disable the CIFS local user.  If false, enable the CIFS local user.

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

#### **Password**
New password to give the CIFS local user.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[SecureString]`|true    |2       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsLocalUser

---

### Notes
Category: cifs
API: cifs-local-user-modify,cifs-local-user-set-password
Family: vserver

---

### Syntax
```PowerShell
Set-NcCifsLocalUser [-UserName] <String> [-FullName <String>] [-Description <String>] [-IsAccountDisabled <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcCifsLocalUser [-UserName] <String> [-Password] <SecureString> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
