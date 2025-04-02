Remove-VBRNDMPServer
--------------------

### Synopsis
Removes NDMP servers from the backup infrastructure.

---

### Description

This cmdlet removes NDMP servers from the backup infrastructure.
When you remove the NDMP server from Veeam Backup & Replication you stop managing it via your Veeam Backup & Replication console. You do not delete the NDMP server itself as well as data stored on it, for example, the backup files.

---

### Related Links
* [Get-VBRNDMPServer](Get-VBRNDMPServer)

---

### Examples
> Removing NDMP Server from Backup Infrastructure

$ndmp = Get-VBRNDMPServer -Name "NetApp.tech.local"
Remove-VBRNDMPServer -Server $ndmp
This example shows how to remove an NDMP server from the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRNDMPServer cmdlet. Specify the Name parameter values. Save the result to the $ndmp variable.
2. Run the Remove-VBRNDMPServer cmdlet. Set the $ndmp variable as the Server parameter value.

---

### Parameters
#### **Server**
Specifies the NDMP server that you want to remove.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNDMPServer[]]`|true    |named   |False        |

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
Remove-VBRNDMPServer -Server <VBRNDMPServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
