Reset-NcActiveDirectoryAccountPassword
--------------------------------------

### Synopsis
Reset the machine account password in the Windows Active Directory domain.

---

### Description

Reset the machine account password in the Windows Active Directory domain. This may be required if the password stored along with the machine account in the Windows Active Directory domain is changed or reset without the Vserver's knowledge.

This operation requires the credentials for a user with permission to reset the password in the organizational unit (OU) that the machine account is a member of.

---

### Related Links
* [Get-NcActiveDirectoryAccount](Get-NcActiveDirectoryAccount)

* [Remove-NcActiveDirectoryAccount](Remove-NcActiveDirectoryAccount)

* [Set-NcActiveDirectoryAccount](Set-NcActiveDirectoryAccount)

---

### Examples
> Example 1

Reset-NcActiveDirectoryAccountPassword -AdminCredential Administrator
Reset the Vserver's Active Directory account password.

AccountName               Domain                              DomainWorkgroup           Vserver
-----------               ------                              ---------------           -------
TEST01                    RTPRRE.TESTDOMAIN                   RTPRRE                    beam_vsim01

---

### Parameters
#### **AdminCredential**
Administrator credential required for Active Directory account deletion.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|true    |1       |true (ByPropertyName)|

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
* DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryAccountConfig

---

### Notes
Category: active directory
API: active-directory-account-password-reset
Family: vserver

---

### Syntax
```PowerShell
Reset-NcActiveDirectoryAccountPassword [-AdminCredential] <PSCredential> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
