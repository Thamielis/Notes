Get-VBRTapeServer
-----------------

### Synopsis
Returns tape servers.

---

### Description

This cmdlet returns the list of tape servers connected to Veeam Backup & Replication.

You can get the list of all tape servers or narrow down the output to the servers of specific type, or search for instances directly by name.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1 Getting List of Tape Servers

Get-VBRTapeServer
This command looks for all tape servers connected to Veeam Backup & Replication.
> Example 2 Getting List of Tape Servers Connected to Host [Using Pipeline]

Get-VBRServer -Name "Host01" | Get-VBRTapeServer
This example shows how to get all tape servers connected to the host named Host01.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRTapeServer cmdlet.
> Example 3 Getting Tape Server by Name [Using Variable]

Get-VBRTapeServer -Name "Sydney_Tape_Server" -Server $Host01
This example shows how to get the tape server named Sydney_Tape_Server on the Host01 host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $host01 variable.
2. Run the Get-VBRTapeServer cmdlet. Specify the Name parameter value. Set the $host01 variable as the Server parameter value.

---

### Parameters
#### **Name**
Specifies the array of tape server names.  The cmdlet will return tape servers with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies the array of hosts.  The cmdlet will return tape servers created on these hosts.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRTapeServer [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
