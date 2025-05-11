Add-VBRComputerFileProxyServer
------------------------------

### Synopsis
Adds new file proxy servers to the backup infrastructure.

---

### Description

This cmdlet adds file proxy servers to the backup infrastructure. Veeam Backup & Replication will use these servers for Veeam Agent storage integration.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Adding File Proxy Servers

$server = Get-VBRServer -Name "File Proxy 01"
Add-VBRComputerFileProxyServer -Server $server
This example shows how to add a file proxy server to the backup infrastructure. The file proxy server is assigned two concurrent tasks to process.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRComputerFileProxyServer cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Adding File Proxy Servers with Specific Number of Concurrent Tasks

$server = Get-VBRServer -Name "File Proxy 01"
Add-VBRComputerFileProxyServer -Server $server -ConcurrentTaskNumber 100
This example shows how to add file proxy servers to the backup infrastructure. The file proxy server is assigned 100 concurrent tasks to process.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRComputerFileProxyServer cmdlet. Set the $server variable as the Server parameter value. Specify the ConcurrentTaskNumber parameter value.

---

### Parameters
#### **ConcurrentTaskNumber**
Specifies a number of concurrent tasks that can be assigned to the file proxy simultaneously.
Permitted values: 1-128.
Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies a description of the file proxy server. The cmdlet will add the proxy server with the specified description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies the host where the file proxy server is located. The cmdlet will add this host as the file proxy server to the backup infrastructure.
Note: The file proxy server must run the Microsoft Windows Server OS.

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
Add-VBRComputerFileProxyServer [-ConcurrentTaskNumber <Int32>] [-Description <String>] -Server <CHost> [<CommonParameters>]
```
