Set-NcUserPassword
------------------

### Synopsis
Changes the password of a specified user.

---

### Description

Changes the password of a specified user.

If the changed password affects a controller connection in CurrentNcController, the cmdlet attempts to update the credential.  If a subsequent cmdlet fails with an authentication error, call Connect-NcController with the new credentials to ensure the credentials are updated.

---

### Related Links
* [Get-NcUser](Get-NcUser)

---

### Examples
> Example 1

```PowerShell
Get-NcUser test* | Set-NcUserPassword -Password Netapp123
Set the password of all users matching the specified pattern.
```
> Example 2

```PowerShell
Set-NcUserPassword -VserverContext costea01 -Credential (Get-Credential)
Prompt for a username and password and set that on the specified vserver.
```

---

### Parameters
#### **UserName**
The user whose password should be changed.  This is mandatory when a user with admin role is modifying the password of another user.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |true (ByPropertyName)|Name   |

#### **Password**
New password of the user.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PasswordHashAlgorithm**
This specifies password hash algorithm used to encrypt user's password. The default value is 'sha512'.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsPasswordHashed**
This specifies whether password entered by user is pre-hashed.
This parameter is available in ONTAP 8.4 and later.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Credential**
A PSCredential object that may be used to specify the UserName and Password values.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: security
API: security-login-modify-password
Family: vserver

---

### Syntax
```PowerShell
Set-NcUserPassword [[-UserName] <String>] [-Password <String>] [-PasswordHashAlgorithm <String>] [-IsPasswordHashed <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcUserPassword [-Credential <PSCredential>] [-PasswordHashAlgorithm <String>] [-IsPasswordHashed <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
