Enable-VBRCloudMaintenanceMode
------------------------------

### Synopsis
Enables Maintenance mode for the cloud infrastructure.

---

### Description

This cmdlet sets the cloud infrastructure into Maintenance mode to let a service provider perform Maintenance tasks. Run the Disable-VBRCloudMaintenanceMode cmdlet to bring the cloud infrastructure back to the normal operational mode.

Important! When a service provider enables the Maintenance mode, cloud resources become temporarily inaccessible for the associated cloud tenants. As a result, most of the running jobs fail. For more information, see the Maintenance Mode section in the Veeam Cloud Connect Guide.

---

### Examples
> Example - Enabling Maintenance Mode for Cloud Infrastructure

```PowerShell
Enable-VBRCloudMaintenanceMode
This command puts the cloud infrastructure to Maintenance mode.
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
Enable-VBRCloudMaintenanceMode [-Confirm] [-WhatIf] [<CommonParameters>]
```
