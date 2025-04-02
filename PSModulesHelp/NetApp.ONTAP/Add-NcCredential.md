Add-NcCredential
----------------

### Synopsis
Save login credentials for a clustered Data ONTAP controller.

---

### Description

Save login credentials for a clustered Data ONTAP controller.  The cached credentials are available to Connect-NcController, Invoke-NaSsh, and other Toolkit cmdlets.

The saved credentials are encrypted for safe storage.  By default, a set of credentials is saved using the current user context, so that only the same Windows user can retrieve them.  If an application of the Toolkit must utilize the cached credentials while running under some other context, specify the -SystemScope parameter.  This saves the credentials such that any process or user on the local system can access them, so this option should only be used on a system with limited user access.

Any number of Toolkit users may store credentials for a given storage controller in the cache, but a user will only be able to see and utilize credentials saved using his account identity or the system identity.

The credentials cache is designed to be interoperable with that created by the PowerShell cmdlets bundled with NetApp's ApplianceWatch PRO 2.1 and later.  However, the AppWatch cmdlets only support saving credentials with System scope, so be sure to use the -SystemScope parameter in ONTAP PowerShell Toolkit credential cmdlets if interoperability is important.

The controller may be specified by name or address, by an NcController object, or by the value(s) in $global:CurrentNcController.

---

### Related Links
* [Get-NcCredential](Get-NcCredential)

* [Remove-NcCredential](Remove-NcCredential)

---

### Examples
> Example 1

Connect-NcController 10.61.172.155
Add-NcCredential
Connect to a controller and add it to the credentials cache.

Name          Credential                                HostUser
----          ----------                                --------
10.61.172.155 System.Management.Automation.PSCredential RTPRRE\Administrator

---

### Parameters
#### **Credential**
A System.Management.Automation.PSCredential object containing the credentials needed to log into a storage controller.  If specified, this value is used.  Otherwise, if an NcController object is specified and has valid credentials, those are used.  Finally, if the $global:CurrentNcController contains one or more instances of NcController with valid credentials, those are used.

|Type            |Required|Position|PipelineInput|Aliases       |
|----------------|--------|--------|-------------|--------------|
|`[PSCredential]`|false   |named   |false        |Cred<br/>Creds|

#### **SystemScope**
Specify to save the credentials such that any process or user on the local system can access them.  This option should only be used on a system with limited user access.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases               |
|------------------|--------|--------|------------------------------|----------------------|
|`[NcController[]]`|true    |named   |true (ByValue, ByPropertyName)|Filer<br/>NcController|

#### **Name**
The name or address of a clustered ONTAP storage controller.  If a host name is specified, it must be resolvable to an address.  If neither this parameter nor -Controller is specified, this cmdlet will use the value(s) in $global:CurrentNcController (if set).

|Type      |Required|Position|PipelineInput                 |Aliases                                         |
|----------|--------|--------|------------------------------|------------------------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|ControllerName<br/>Address<br/>ControllerAddress|

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.Toolkit.Credentials.NcCredential

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Add-NcCredential [-Credential <PSCredential>] [-SystemScope] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Add-NcCredential -Controller <NcController[]> [-Credential <PSCredential>] [-SystemScope] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Add-NcCredential [-Name] <String> [-Credential <PSCredential>] [-SystemScope] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[<CommonParameters>]
```
