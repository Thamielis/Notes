Enable-VBRNASProxyServer
------------------------

### Synopsis
Enables a disabled file share backup proxy.

---

### Description

This cmdlet allows you to enable a file share backup proxy. Run the Disable-VBRNASProxyServer cmdlet to disable a file share backup proxy.

---

### Related Links
* [Get-VBRNASProxyServer](Get-VBRNASProxyServer)

---

### Examples
> Example

$nasproxy = Get-VBRNASProxyServer -Name "File Backup Proxy 09"
Enable-VBRNASProxyServer -Proxy $nasproxy
This example shows how to enable the File Share Backup Proxy 09 proxy by its name.

Perform the following steps:
1. Run the Get-VBRNASProxyServer cmdlet. Specify the Name parameter value. Save the result to the $nasproxy variable.
2. Run the Enable-VBRNASProxyServer cmdlet. Set the $nasproxy variable as the Proxy parameter value.

---

### Parameters
#### **Proxy**
Specifies an array of file share proxies you want to enable. Accepts the VBRNASProxyServer[] object. To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRNASProxyServer[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASProxyServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRNASProxyServer -Proxy <VBRNASProxyServer[]> [<CommonParameters>]
```
