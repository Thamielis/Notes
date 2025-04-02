Get-NcCredential
----------------

### Synopsis
List entries in the credentials cache.

---

### Description

List entries in the credentials cache.  Only entries that are usable by the current user are listed.  This may include credentials that were saved with user or system scope.

---

### Related Links
* [Add-NcCredential](Add-NcCredential)

* [Remove-NcCredential](Remove-NcCredential)

---

### Examples
> Example 1

Get-NcCredential
List all credentials in the cache.

Name                    Credential                                HostUser
----                    ----------                                --------
dunn                    System.Management.Automation.PSCredential RTPRRE\Administrator
10.61.167.228           System.Management.Automation.PSCredential RTPRRE\Administrator
patriots.homeserver.com System.Management.Automation.PSCredential RTPRRE\Administrator
10.61.172.155           System.Management.Automation.PSCredential RTPRRE\Administrator
cerebus                 System.Management.Automation.PSCredential RTPRRE\Administrator

---

### Parameters
#### **Controller**
An NcController object, as returned by Connect-NcController.  If neither this parameter nor -Name is specified, this cmdlet will return all entries visible to the current user.

|Type            |Required|Position|PipelineInput                 |Aliases               |
|----------------|--------|--------|------------------------------|----------------------|
|`[NcController]`|false   |1       |true (ByValue, ByPropertyName)|Filer<br/>NcController|

#### **SystemScope**
Specify true to get credentials with system-wide scope, false for user-specific credentials, or null for all credentials.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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

#### **Name**
The name or address of a storage controller.  If a host name is specified, it must be resolvable to an address.  Wildcards are supported.  If neither this parameter nor -Name is specified, this cmdlet will return all entries visible to the current user.

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
Get-NcCredential [[-Controller] <NcController>] [-SystemScope <Boolean>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcCredential [-Name] <String> [-SystemScope <Boolean>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
