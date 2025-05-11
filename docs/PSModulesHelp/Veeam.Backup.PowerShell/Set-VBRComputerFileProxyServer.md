Set-VBRComputerFileProxyServer
------------------------------

### Synopsis
Modifies file proxy servers added to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet modifies an existing file proxy server.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerFileProxyServer](Get-VBRComputerFileProxyServer)

---

### Examples
> Example 1. Modifying Description

$proxy = Get-VBRComputerFileProxyServer -Name "File Proxy 01"
Set-VBRComputerFileProxyServer -FileProxy $proxy -Description "Proxy for Veeam Agents"
This example shows how to modify a description of the file proxy server.
Perform the following steps:
1. Run the Get-VBRComputerFileProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Set-VBRComputerFileProxyServer cmdlet. Set the $proxy variable as the FileProxy parameter value. Specify the Description parameter value.
> Example 2. Modifying Number of Concurrent Tasks

$proxy = Get-VBRComputerFileProxyServer -Name "File Proxy 01"
Set-VBRComputerFileProxyServer -FileProxy $proxy -ConcurrentTaskNumber 50
This example shows how to modify the number of concurrent tasks for the file proxy server. The file proxy server will process 50 concurrent tasks simultaneously.
Perform the following steps:
1. Run the Get-VBRComputerFileProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Set-VBRComputerFileProxyServer cmdlet. Set the $proxy variable as the FileProxy parameter value. Specify the ConcurrentTaskNumber parameter value.

---

### Parameters
#### **ConcurrentTaskNumber**
Specifies the integer defining the number of concurrent tasks that can be assigned to the file proxy simultaneously.
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

#### **FileProxy**
Specifies the file proxy server. The cmdlet will modify the settings of this server.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRComputerFileProxyServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerFileProxyServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerFileProxyServer [-ConcurrentTaskNumber <Int32>] [-Description <String>] -FileProxy <VBRComputerFileProxyServer> [<CommonParameters>]
```
