New-NcActiveDirectoryAccount
----------------------------

### Synopsis
Create an Active Directory account for the given Vserver.

---

### Description

Create an Active Directory account for the given Vserver. If a CIFS server already exists for the requested Vserver, then this command will fail. The existing CIFS server should be deleted before retrying again.

---

### Related Links
* [Get-NcActiveDirectoryAccount](Get-NcActiveDirectoryAccount)

* [Remove-NcActiveDirectoryAccount](Remove-NcActiveDirectoryAccount)

* [Set-NcActiveDirectoryAccount](Set-NcActiveDirectoryAccount)

---

### Examples
> Example 1

New-NcActiveDirectoryAccount -Name TEST01 -Domain rtprre.testdomain -AdminCredential Administrator
Add a TEST01 account to the rtprre.testdomain domain.

AccountName               Domain                              DomainWorkgroup           Vserver
-----------               ------                              ---------------           -------
TEST01                    RTPRRE.TESTDOMAIN                   RTPRRE                    beam_vsim01

---

### Parameters
#### **Name**
Active Directory account NetBIOS name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Domain**
Fully qualified domain name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **AdminCredential**
Administrator credential required for Active Directory account creation.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|true    |3       |true (ByPropertyName)|

#### **OrganizationalUnit**
Organizational unit under which the Active Directory account will be created.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryAccountConfig

---

### Notes
Category: active directory
API: active-directory-account-create
Family: vserver

---

### Syntax
```PowerShell
New-NcActiveDirectoryAccount [-Name] <String> [-Domain] <String> [-AdminCredential] <PSCredential> [-OrganizationalUnit <String>] [-Force] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
