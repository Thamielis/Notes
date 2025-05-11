Add-VBRHvProxy
--------------

### Synopsis
Adds a Hyper-V backup proxy to the backup infrastructure.

---

### Description

This cmdlet adds a Hyper-V backup proxy server to the backup infrastructure.
When you add a proxy, you set a role to a Microsoft Windows server. To add a new proxy, you need to have the server added to your Veeam Backup & Replication managing console.
Run the Add-VBRWinServer cmdlet to add a Microsoft Windows server.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Adding New Hyper-V Backup Proxy [Using Pipeline]

Get-VBRServer -Name "HyperV Local Server" | Add-VBRHvProxy -Description "Local Backup Proxy" -MaxTasks 6
This example shows how to add a new Hyper-V backup proxy. The Description is Local Backup Proxy. The max concurrent tasks number is set to 6.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Add-VBRHvProxy cmdlet. Specify the Description parameter value. Specify the MaxTasks parameter value.
> Example 2. Adding New Hyper-V Backup Proxy [Using Variable]

$server = Get-VBRServer -Name "Server"
Add-VBRHvProxy -Server $server -Description "Local Backup Proxy"
This example shows how to add a new Hyper-V backup proxy. The description is Local Backup Proxy. The max concurrent tasks number is set to 2 by default.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRHvProxy cmdlet. Set the $server variable as the Server parameter value. Specify the Description parameter value.

---

### Parameters
#### **Description**
Specifies a description of a Hyper-V backup proxy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **MaxTasks**
Specifies the number of concurrent tasks that can be assigned to the proxy simultaneously.
Allowed values: 1-100.
Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies a server which will act as a Hyper-V backup proxy.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRHvProxy [-Description <String>] [-MaxTasks <Int32>] -Server <CHost> [<CommonParameters>]
```
