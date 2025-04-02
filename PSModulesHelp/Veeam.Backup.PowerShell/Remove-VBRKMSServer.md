Remove-VBRKMSServer
-------------------

### Synopsis
Removes KMS servers from the Veeam Backup & Replication console.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet removes a KMS server from the Veeam Backup & Replication console.

---

### Related Links
* [Get-VBRKMSServer](Get-VBRKMSServer)

---

### Examples
> Removing KMS Server From Veeam Backup & Replication Console

$server = Get-VBRKMSServer -Id "8f723f68-82c6-430d-8915-58a0582440a4"
Remove-VBRKMSServer -Server $server -Port 5696
This example shows how to remove the 8f723f68-82c6-430d-8915-58a0582440a4 KMS server from the Veeam Backup & Replication console.
Perform the following steps:
1. Run the Get-VBRKMSServer cmdlet. Specify the Id parameter values. Save the result to the $server variable.
2. Run the Remove-VBRKMSServer cmdlet. Set the $server variable as the Server parameter value. Provide the Port parameter value.

---

### Parameters
#### **Server**
Specifies a KMS server that you want to remove. Accepts the VBRKMSServer object. To get this  object, run the Get-VBRKMSServer cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRKMSServer]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRKMSServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRKMSServer -Server <VBRKMSServer> [-Confirm] [-WhatIf] [<CommonParameters>]
```
