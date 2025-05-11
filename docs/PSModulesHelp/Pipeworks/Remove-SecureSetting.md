Remove-SecureSetting
--------------------

### Synopsis
Removes an encrypted setting from the registry

---

### Description

Removes a stored secured user settings in the registry

---

### Related Links
* [https://www.youtube.com/watch?v=0haXavQU_nY](https://www.youtube.com/watch?v=0haXavQU_nY)

* [Add-SecureSetting](Add-SecureSetting)

* [Get-SecureSetting](Get-SecureSetting)

* [ConvertTo-SecureString](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Security/ConvertTo-SecureString)

* [ConvertFrom-SecureString](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Security/ConvertFrom-SecureString)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-SecureSetting
```
> EXAMPLE 2

```PowerShell
Remove-SecureSetting AStringSetting
```

---

### Parameters
#### **Name**
The name of the secure setting

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Type**
The type of the secured setting

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Type]`|false   |2       |true (ByPropertyName)|

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Remove-SecureSetting [[-Name] <String>] [[-Type] <Type>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
