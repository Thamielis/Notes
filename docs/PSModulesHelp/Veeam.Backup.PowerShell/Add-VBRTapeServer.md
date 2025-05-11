Add-VBRTapeServer
-----------------

### Synopsis
Adds tape server to Veeam Backup & Replication.

---

### Description

This cmdlet adds a tape server to the Veeam Backup & Replication managing console.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1 Adding Tape Server [Using Pipeline]

Get-VBRServer -Name WindowsServer01 | Add-VBRTapeServer -Description "Sydney Office tape server"
This example shows how to add the WindowsServer01 server as a tape server using a pipeline output. The description is Sydney Office tape server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Add-VBRTapeServer cmdlet. Specify the Description parameter value.
> Example 2 Adding Tape Server [Using Variable]

Add-VBRTapeServer -Server $tapeserver
This example shows how to add the WindowsServer01 server as a tape server using a variable.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $tapeserver variable.
2. Run the Add-VBRTapeServer cmdlet. Set the $tapeserver variable as the Server parameter value.

---

### Parameters
#### **Description**
Specifies the description of the tape server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add the tape server to the current backup server, although this tape server is already added to another backup server. The current backup server will take the ownership of this tape server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **Server**
Specifies the server you want to use as a tape server. If not set, Veeam backup server will be used.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRTapeServer [-Description <String>] [-Force] [-Server <CHost>] [<CommonParameters>]
```
