Set-VBRNASProxyServer
---------------------

### Synopsis
Modifies file backup proxy servers added to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet modifies settings of file backup proxy servers added to the Veeam Backup & Replication infrastructure.

To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRNASProxyServer](Get-VBRNASProxyServer)

---

### Examples
> Example 1. Modifying Description

$proxy = Get-VBRNASProxyServer -Name "Proxy05"
Set-VBRNASProxyServer -ProxyServer $proxy -Description "Proxy for SMB network shared folders"
This example shows how to modify a description of the file backup proxy server.

Perform the following steps:
1. Run the Get-VBRNASProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Set-VBRNASProxyServer cmdlet. Set the $proxy variable as the ProxyServer parameter value. Specify the Description parameter value.
> Example 2. Modifying Number of Concurrent Tasks

$proxy = Get-VBRNASProxyServer -Name "Proxy05"
Set-VBRNASProxyServer -ProxyServer $proxy -ConcurrentTaskNumber 50
This example shows how to modify the number of concurrent tasks for the file backup proxy server. The file backup proxy server will process 50 concurrent tasks simultaneously.

Perform the following steps:
1. Run the Get-VBRNASProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Set-VBRNASProxyServer cmdlet. Set the $proxy variable as the ProxyServer parameter value. Specify the Description parameter value.

---

### Parameters
#### **ConcurrentTaskNumber**
Specifies the number of concurrent tasks that can be assigned to the file backup proxy simultaneously. Permitted values: 1-100.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies a description of the file backup proxy server. The cmdlet will add the proxy server with the specified description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ProxyServer**
Specifies the file backup proxy server. The cmdlet will modify the settings of this server. Accepts the VBRNASProxyServer object. To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRNASProxyServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASProxyServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASProxyServer [-ConcurrentTaskNumber <Int32>] [-Description <String>] -ProxyServer <VBRNASProxyServer> [<CommonParameters>]
```
