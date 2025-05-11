Disable-VBRCDPPolicy
--------------------

### Synopsis
Disables CDP policies including Cloud Director CDP policies, CDP policies, cloud CDP policies and so on.

---

### Description

This cmdlet disables CDP policies including Cloud Director CDP policies, CDP policies, cloud CDP policies and so on. Run the Enable-VBRCDPPolicy cmdlet to enable CDP policies.

---

### Related Links
* [Get-VBRCDPPolicy](Get-VBRCDPPolicy)

---

### Examples
> Disabling CDP Policies

$policy = Get-VBRCDPPolicy
Disable-VBRCDPPolicy -Policy $policy
This example shows how to disable CDP policies.

Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Save the result to the $policy variable.
2. Run the Disable-VBRCDPPolicy cmdlet. Set the $policy variable as the Policy parameter value.

---

### Parameters
#### **Policy**
Specifies an array of CDP policies.The cmdlet will disable these policies.
Accepts the VBRCDPPolicyBase[] object. To get this object, run the Get-VBRCDPPolicy cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRCDPPolicyBase[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCDPPolicyBase[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRCDPPolicy -Policy <VBRCDPPolicyBase[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
