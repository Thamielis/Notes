Remove-NcCredential
-------------------

### Synopsis
Remove saved login credentials for a Data ONTAP controller.

---

### Description

Remove saved login credentials for a Data ONTAP controller.

---

### Related Links
* [Add-NcCredential](Add-NcCredential)

* [Get-NcCredential](Get-NcCredential)

---

### Examples
> Example 1

```PowerShell
Get-NcCredential dunn | Remove-NcCredential
Remove credentials for controller 'dunn'.
```
> Example 2

```PowerShell
Remove-NaCredential dunn
Remove credentials for controller 'dunn'.
```

---

### Parameters
#### **SystemScope**
Remove credentials for the specified controller that were saved using system scope.  If not specified, remove credentials that were saved with user scope.

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
One or more NcController objects, as returned by Connect-NcController.  If neither this parameter nor -Name is specified,
 this cmdlet will use the value in $global:CurrentNcController (if set).

|Type              |Required|Position|PipelineInput                 |Aliases               |
|------------------|--------|--------|------------------------------|----------------------|
|`[NcController[]]`|true    |named   |true (ByValue, ByPropertyName)|Filer<br/>NcController|

#### **Name**
The name or address of a storage controller.  If a host name is specified, it must be resolvable to an address.  If neither this parameter nor -Controller is specified, this cmdlet will use the value(s) in $global:CurrentNcController (if set).

|Type      |Required|Position|PipelineInput                 |Aliases                                         |
|----------|--------|--------|------------------------------|------------------------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|ControllerName<br/>Address<br/>ControllerAddress|

#### **Credential**
An NcCredential object, as returned by Get-NcCredential.  If specified, that record is removed from the credentials cache (including the correct value of system scope).

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[NcCredential]`|true    |1       |true (ByValue)|

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
Remove-NcCredential [-SystemScope] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Remove-NcCredential -Controller <NcController[]> [-SystemScope] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Remove-NcCredential [-Name] <String> [-SystemScope] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Remove-NcCredential [-Credential] <NcCredential> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
