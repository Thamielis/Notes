Remove-VBRTapeServer
--------------------

### Synopsis
Removes a specified tape server from the backup infrastructure.

---

### Description

This cmdlet removes a specified tape server from Veeam Backup & Replication.

When you remove a  tape server, Veeam Backup & Replication unassigns the tape server role from the server, so it is no longer used as a tape server. The actual server remains connected to Veeam Backup & Replication.

---

### Related Links
* [Get-VBRTapeServer](Get-VBRTapeServer)

---

### Examples
> Example 1 Removing Tape Server [Using Pipeline]

Get-VBRTapeServer -Name "Sydney_Tape_Server" | Remove-VBRTapeServer
This example shows how to remove a tape server named Sydney_Tape_Server.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRTapeServer cmdlet.
> Example 2 Removing Tape Server [Using Variable]

$SydneyTapeServer = Get-VBRTapeServer -Name "Sydney_Tape_Server"
$NewYorkTapeServer = Get-VBRTapeServer -Name "NewYork_Tape_Server"
Remove-VBRTapeServer -TapeServer $SydneyTapeServer, $NewYorkTapeServer
This example shows how to remove Sydney_Tape_Server and NewYork_Tape_Server tape servers.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $SydneyTapeServer variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $NewYorkTapeServer variable.
3. Run the Remove-VBRTapeServer cmdlet. Set the $SydneyTapeServer and $NewYorkTapeServer variables as the Server parameter values.

---

### Parameters
#### **TapeServer**
Specifies the array of tape servers. The cmdlet will remove these tape servers. Accepts VBRTapeServer[] objects.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeServer[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRTapeServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRTapeServer -TapeServer <VBRTapeServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
