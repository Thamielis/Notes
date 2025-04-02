Set-NcActiveDirectoryAccount
----------------------------

### Synopsis
Modify the Windows Active Directory domain.

---

### Description

Modify the Windows Active Directory domain. If a CIFS server already exists for the requested Vserver, Set-NcCifsServer should be used to modify the Windows Active Directory domain.

---

### Related Links
* [Get-NcActiveDirectoryAccount](Get-NcActiveDirectoryAccount)

* [New-NcActiveDirectoryAccount](New-NcActiveDirectoryAccount)

* [Remove-NcActiveDirectoryAccount](Remove-NcActiveDirectoryAccount)

---

### Examples
> Example 1

Set-NcActiveDirectoryAccount -Domain RTPRRE.TESTDOMAIN -AdminCredential Administrator -Force
Move the Vserver's Active Directory account to the RTPRRE.TESTDOMAIN domain and overwrite any existing accounts with the same name.

AccountName               Domain                              DomainWorkgroup           Vserver
-----------               ------                              ---------------           -------
TEST01                    RTPRRE.TESTDOMAIN                   RTPRRE                    beam_vsim01

> Example 2

Set-NcActiveDirectoryAccount -ChangePassword
Change the password for the current Vserver's Active Directory account.

AccountName               Domain                              DomainWorkgroup           Vserver
-----------               ------                              ---------------           -------
TEST01                    RTPRRE.TESTDOMAIN                   RTPRRE                    beam_vsim01

---

### Parameters
#### **Domain**
Fully qualified domain name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **AdminCredential**
Administrator credential required for Active Directory account creation.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|true    |2       |true (ByPropertyName)|

#### **Force**
If specified and a machine account with the same name as specified by Name exists in Active Directory, it will be overwritten and reused.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **ChangePassword**
If specified, a new password for the machine account will be generated and changed in the Windows Active Directory domain. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryAccountConfig

---

### Notes
Category: active directory
API: active-directory-account-modify,active-directory-account-password-change
Family: vserver

---

### Syntax
```PowerShell
Set-NcActiveDirectoryAccount [-Domain] <String> [-AdminCredential] <PSCredential> [-Force] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcActiveDirectoryAccount [-ChangePassword] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
