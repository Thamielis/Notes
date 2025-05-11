Disable-VBRComputerFileProxyServer
----------------------------------

### Synopsis
Disables file proxy servers.

---

### Description

This cmdlet disables file proxy servers.
Run the Enable-VBRComputerFileProxyServer cmdlet to enable a file backup proxy.

---

### Related Links
* [Get-VBRComputerFileProxyServer](Get-VBRComputerFileProxyServer)

---

### Examples
> Disabling File Proxy Server

$fileproxy = Get-VBRComputerFileProxyServer
Disable-VBRComputerFileProxyServer -Proxy $fileproxy[3]
This example shows how to disable a file proxy server.
Perform the following steps:
1. Run the Get-VBRComputerFileProxyServer cmdlet. Save the result to the $fileproxy variable.
2. Run the Disable-VBRComputerFileProxyServer cmdlet. Set the $fileproxy[3] variable as the Proxy parameter value.
The Get-VBRComputerFileProxyServer cmdlet will return an array of file proxies. Mind the ordinal number of the necessary file proxy (in our example, it is the fourth file proxy in the array).

---

### Parameters
#### **Proxy**
Specifies an array of file backup proxies. The cmdlet will disable these proxies.

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
Disable-VBRComputerFileProxyServer -Proxy <VBRComputerFileProxyServer[]> [<CommonParameters>]
```
