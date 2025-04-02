Remove-NaCredential
-------------------

### Synopsis
Remove saved login credentials for a Data ONTAP controller.

---

### Description

Remove saved login credentials for a Data ONTAP controller.

---

### Related Links
* [Add-NaCredential](Add-NaCredential)

* [Get-NaCredential](Get-NaCredential)

---

### Examples
> Example 1

```PowerShell
Remove-NaCredential dunn
Remove the cached credentials for storage controller 'dunn' that were saved with user scope.
```
> Example 2

```PowerShell
Get-NaCredential | Remove-NaCredential
Clear all entries from the credentials cache that are visible to the current user, including those with system scope.
```

---

### Parameters
#### **SystemScope**
Remove credentials for the specified controller that were saved using system scope.  If not specified, remove credentials that were saved with user scope.

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

#### **Credential**
An NaCredential object, as returned by Get-NaCredential.  If specified, that record is removed from the credentials cache (including the correct value of system scope).

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[NaCredential]`|true    |1       |true (ByValue)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Remove-NaCredential [-SystemScope] [<CommonParameters>]
```
```PowerShell
Remove-NaCredential -Controller <NaController> [-SystemScope] [<CommonParameters>]
```
```PowerShell
Remove-NaCredential [-Name] <String> [-SystemScope] [<CommonParameters>]
```
```PowerShell
Remove-NaCredential [-Credential] <NaCredential> [<CommonParameters>]
```
