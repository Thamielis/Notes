Remove-VBRNASServer
-------------------

### Synopsis
Removes file shares that are added to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet removes file shares that are added to the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRNASServer](Get-VBRNASServer)

---

### Examples
> Example 1. Removing all File Shares

$fileshare = Get-VBRNASServer
Remove-VBRNASServer -Server $fileshare
This example shows how to remove all file shares that are added to the Veeam Backup & Replication infrastructure.

Perform the following steps:
1. Run the Get-VBRNASServer cmdlet. Save the result to the $fileshare variable.
2. Run the Remove-VBRNASServer cmdlet. Set the $fileshare variable as the Server parameter value.
> Example 2. Removing Specific File Share

$fileshare = Get-VBRNASServer -Name "\\WinSRV2049\Documents"
Remove-VBRNASServer -Server $fileshare -Confirm
This example shows how to remove the \\WinSRV2049\Documents file share that is added to the Veeam Backup & Replication infrastructure. The cmdlet will display a prompt that asks if the user is sure that he wants to continue.

Perform the following steps:
1. Run the Get-VBRNASServer cmdlet. Save the result to the $fileshare variable.
2. Run the Remove-VBRNASServer cmdlet. Set the $fileshare variable as the Server parameter value. Specify the Confirm parameter.

---

### Parameters
#### **Server**
Specifies an array of file shares. The cmdlet will remove these file shares from the Veeam Backup & Replication infrastructure. Accepts the VBRNASServer[] object. To get this object, run the Get-VBRNASServer cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRNASServer[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRNASServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRNASServer -Server <VBRNASServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
