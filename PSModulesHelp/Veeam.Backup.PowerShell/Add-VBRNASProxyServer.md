Add-VBRNASProxyServer
---------------------

### Synopsis
Adds file backup proxy servers to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet adds file backup proxy servers to the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Adding File Backup Proxy Servers

$server = Get-VBRServer -Name "File Backup Proxy"
Add-VBRNASProxyServer -Server $server
This example shows how to add a file backup proxy server to the Veeam Backup & Replication infrastructure. The file backup proxy server is assigned two concurrent tasks to process.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRNASProxyServer cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Adding File Backup Proxy Servers with Specific Number of Concurrent Tasks

$server = Get-VBRServer -Name "File Backup Proxy"
Add-VBRNASProxyServer -Server $server -ConcurrentTaskNumber 100
This example shows how to add file backup proxy servers to the Veeam Backup & Replication infrastructure. The file backup proxy server is assigned 100 concurrent tasks to process.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRNASProxyServer cmdlet. Set the $server variable as the Server parameter value. Specify the ConcurrentTaskNumber parameter value.

---

### Parameters
#### **ConcurrentTaskNumber**
Specifies the number of concurrent tasks that can be assigned to the file backup proxy simultaneously. Permitted values: 1-100. Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies a description of the file backup proxy server. The cmdlet will add the proxy server with the specified description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies the host where the file backup proxy server is located. The cmdlet will add this host as the proxy server to the Veeam Backup & Replication infrastructure. Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet.

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
Add-VBRNASProxyServer [-ConcurrentTaskNumber <Int32>] [-Description <String>] -Server <CHost> [<CommonParameters>]
```
