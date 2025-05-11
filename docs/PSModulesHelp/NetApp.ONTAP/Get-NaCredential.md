Get-NaCredential
----------------

### Synopsis
List entries in the credentials cache.

---

### Description

List entries in the credentials cache.  Only entries that are usable by the current user are listed.  This may include credentials that were saved with user or system scope.

---

### Related Links
* [Add-NaCredential](Add-NaCredential)

* [Remove-NaCredential](Remove-NaCredential)

---

### Examples
> Example 1

Get-NaCredential | ft -AutoSize
List all credentials visible to the current user.

Name   Credential                                HostUser
----   ----------                                --------
dunn   System.Management.Automation.PSCredential RTPRRE\Administrator
dunn   System.Management.Automation.PSCredential SYSTEM
benson System.Management.Automation.PSCredential RTPRRE\Administrator

> Example 2

```PowerShell
Connect-NaController dunn -Credential (Get-NaCredential dunn -SystemScope $false).Credential
Connect using credentials that are explicitly pulled from the credentials cache.

Name     : dunn
Address  : 10.61.167.60
Ontapi   : 1.12
Version  : NetApp Release 7.3.3: Thu Mar 11 22:29:52 PST 2010
Protocol : HTTPS
Port     : 443
Vfiler   :

```

---

### Parameters
#### **Controller**
An NaController object, as returned by Connect-NaController.  If neither this parameter nor -Name is specified, this cmdlet will return all entries visible to the current user.

|Type            |Required|Position|PipelineInput                 |Aliases|
|----------------|--------|--------|------------------------------|-------|
|`[NaController]`|false   |1       |true (ByValue, ByPropertyName)|Filer  |

#### **SystemScope**
Specify true to get credentials with system-wide scope, false for user-specific credentials, or null for all credentials.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Name**
The name or address of a storage controller.  If a host name is specified, it must be resolvable to an address.  Wildcards are supported.  If neither this parameter nor -Name is specified, this cmdlet will return all entries visible to the current user.

|Type      |Required|Position|PipelineInput                 |Aliases                                         |
|----------|--------|--------|------------------------------|------------------------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|ControllerName<br/>Address<br/>ControllerAddress|

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.Toolkit.Credentials.NaCredential

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Get-NaCredential [[-Controller] <NaController>] [-SystemScope <Boolean>] [<CommonParameters>]
```
```PowerShell
Get-NaCredential [-Name] <String> [-SystemScope <Boolean>] [<CommonParameters>]
```
