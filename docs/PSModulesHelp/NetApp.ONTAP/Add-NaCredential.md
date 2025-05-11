Add-NaCredential
----------------

### Synopsis
Save login credentials for a Data ONTAP controller.

---

### Description

Save login credentials for a Data ONTAP controller.  The cached credentials are available to Connect-NaController and Invoke-NaSsh, making these cmdlets as simple to use with HTTP/HTTPS connections as when using RPC connections.

The saved credentials are encrypted for safe storage.  By default, a set of credentials is saved using the current user context, so that only the same Windows user can retrieve them.  If an application of the Toolkit must utilize the cached credentials while running under some other context, specify the -SystemScope parameter.  This saves the credentials such that any process or user on the local system can access them, so this option should only be used on a system with limited user access.

Any number of Toolkit users may store credentials for a given storage controller in the cache, but a user will only be able to see and utilize credentials saved using his account identity or the system identity.

The credentials cache is designed to be interoperable with that created by the PowerShell cmdlets bundled with NetApp's ApplianceWatch PRO 2.1 and later.  However, the AppWatch cmdlets only support saving credentials with System scope, so be sure to use the -SystemScope parameter with Data ONTAP PowerShell Toolkit credential cmdlets if interoperability is important.

The controller may be specified by name or address, by an NaController object, or by the value in $global:CurrentNaController.

---

### Related Links
* [Get-NaCredential](Get-NaCredential)

* [Remove-NaCredential](Remove-NaCredential)

* [Connect-NaController](Connect-NaController)

* [Invoke-NaSsh](Invoke-NaSsh)

---

### Examples
> Example 1

```PowerShell
Add-NaCredential dunn -Credential root
Add root credentials for controller 'dunn'.

Name       : dunn
Credential : System.Management.Automation.PSCredential
HostUser   : RTPRRE\Administrator

```
> Example 2

```PowerShell
Connect-NaController benson -Credential (Get-Credential)
Add-NaCredential
Name       : benson
Credential : System.Management.Automation.PSCredential
HostUser   : RTPRRE\Administrator

Add the credential of the currently connected controller (stored in $global:CurrentNaController) to the credentials cache.

```

---

### Parameters
#### **Credential**
A System.Management.Automation.PSCredential object containing the credentials needed to log into a storage controller.  If specified, this value is used.  Otherwise, if an NaController object is specified and has valid credentials, those are used.  Finally, if the $global:CurrentNaController contains an instance of NaController with valid credentials, those are used.

|Type            |Required|Position|PipelineInput|Aliases       |
|----------------|--------|--------|-------------|--------------|
|`[PSCredential]`|false   |named   |false        |Cred<br/>Creds|

#### **SystemScope**
Specify to save the credentials such that any process or user on the local system can access them.  This option should only be used on a system with limited user access.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
An NaController object, as returned by Connect-NaController.  If neither this parameter nor -Name is specified, this cmdlet will use the value in $global:CurrentNaController (if set).

|Type            |Required|Position|PipelineInput                 |Aliases|
|----------------|--------|--------|------------------------------|-------|
|`[NaController]`|true    |named   |true (ByValue, ByPropertyName)|Filer  |

#### **Name**
The name or address of a storage controller.  If a host name is specified, it must be resolvable to an address.  If neither this parameter nor -Controller is specified, this cmdlet will use the value in $global:CurrentNaController (if set).

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
Add-NaCredential [-Credential <PSCredential>] [-SystemScope] [<CommonParameters>]
```
```PowerShell
Add-NaCredential -Controller <NaController> [-Credential <PSCredential>] [-SystemScope] [<CommonParameters>]
```
```PowerShell
Add-NaCredential [-Name] <String> [-Credential <PSCredential>] [-SystemScope] [<CommonParameters>]
```
