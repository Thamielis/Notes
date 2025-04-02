Disable-VBRCloudMaintenanceMode
-------------------------------

### Synopsis
Disables Maintenance mode for the cloud infrastructure.

---

### Description

This cmdlet returns the cloud infrastructure to the normal operational mode. Cloud resources become available for the associated cloud tenants. Run the Enable-VBRCloudMaintenanceMode cmdlet to bring the cloud infrastructure back to the Maintenance mode.

---

### Examples
> Example - Disabling Maintenance Mode for Cloud Infrastructure

```PowerShell
Disable-VBRCloudMaintenanceMode
This command returns the cloud infrastructure to the normal operational mode.
```

---

### Parameters
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRCloudMaintenanceMode [-Confirm] [-WhatIf] [<CommonParameters>]
```
