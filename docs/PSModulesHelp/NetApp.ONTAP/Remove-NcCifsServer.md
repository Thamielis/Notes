Remove-NcCifsServer
-------------------

### Synopsis
Remove a CIFS server.

---

### Description

Remove a CIFS server. If the AdminUsername and AdminPassword or AdminCredential are not specified, the CIFS server's machine account will not be deleted from the Windows Active Directory domain. The deletion of the CIFS server will also delete the CIFS shares associated with it.

---

### Related Links
* [Add-NcCifsServer](Add-NcCifsServer)

* [Get-NcCifsServer](Get-NcCifsServer)

* [Set-NcCifsServer](Set-NcCifsServer)

---

### Examples
> Example 1

```PowerShell
Remove-NcCifsServer -AdminUsername Administrator -AdminPassword p@ssword
Remove the CIFS server from this vserver.
```

---

### Parameters
#### **ForceAccountDelete**
If this is set, the local CIFS configuration will be deleted irrespective of any communication errors. The default value for this field is false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Name**
The name of the CIFS server (up to 15 characters).

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |CifsServer|

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

#### **AdminUsername**
Username of a user with permission to reset the password in the organizational unit (OU) that the machine account is a member of.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |1       |false        |Username|

#### **AdminPassword**
Account password.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |2       |false        |Password|

#### **AdminCredential**
Credentials of a user with permission to reset the password in the organizational unit (OU) that the machine account is a member of.

|Type            |Required|Position|PipelineInput|Aliases   |
|----------------|--------|--------|-------------|----------|
|`[PSCredential]`|true    |1       |false        |Credential|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: cifs
API: cifs-server-delete
Family: vserver

---

### Syntax
```PowerShell
Remove-NcCifsServer [-ForceAccountDelete] [-VserverContext <String>] [-Name <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcCifsServer [-AdminUsername] <String> [-AdminPassword] <String> [-ForceAccountDelete] [-VserverContext <String>] [-Name <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcCifsServer [-AdminCredential] <PSCredential> [-ForceAccountDelete] [-VserverContext <String>] [-Name <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
