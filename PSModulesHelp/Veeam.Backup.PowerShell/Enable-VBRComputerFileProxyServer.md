Enable-VBRComputerFileProxyServer
---------------------------------

### Synopsis
Enables disabled file proxy servers.

---

### Description

This cmdlet enables disabled file proxy servers.
Run the Disable-VBRComputerFileProxyServer cmdlet to disable a file backup proxy.

---

### Related Links
* [Get-VBRComputerFileProxyServer](Get-VBRComputerFileProxyServer)

---

### Examples
> Enabling Disabled File Proxy Server

$fileproxy = Get-VBRComputerFileProxyServer
Enable-VBRComputerFileProxyServer -Proxy $fileproxy[3]
This example shows how to enable the disabled file proxy server.
Perform the following steps:
1. Run the Get-VBRComputerFileProxyServer cmdlet. Save the result to the $fileproxy variable.
2. Run the Enable-VBRComputerFileProxyServer cmdlet. Set the $fileproxy variable as the Proxy parameter value.
The Get-VBRComputerFileProxyServer cmdlet will return an array of file proxies. Mind the ordinal number of the necessary file proxy (in our example, it is the fourth file proxy in the array).

---

### Parameters
#### **Proxy**
Specifies an array of file backup proxies. The cmdlet will enable these proxies.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRComputerFileProxyServer[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerFileProxyServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRComputerFileProxyServer -Proxy <VBRComputerFileProxyServer[]> [<CommonParameters>]
```
