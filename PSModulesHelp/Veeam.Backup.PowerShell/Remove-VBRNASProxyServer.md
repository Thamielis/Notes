Remove-VBRNASProxyServer
------------------------

### Synopsis
Removes file backup proxy servers from the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet removes file backup proxy servers from the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRNASProxyServer](Get-VBRNASProxyServer)

---

### Examples
> Removing File Backup Proxy Server

$proxy = Get-VBRNASProxyServer -Name "File Server Proxy"
Remove-VBRNASProxyServer -ProxyServer $proxy
This example shows how to remove the File Server Proxy file backup server from the Veeam Backup & Replication infrastructure.

Perform the following steps:
1. Run the Get-VBRNASProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Remove-VBRNASProxyServer cmdlet. Set the $proxy variable as the ProxyServer parameter value.

---

### Parameters
#### **ProxyServer**
Specifies the file backup proxy server. The cmdlet will remove this server from the Veeam Backup & Replication infrastructure. Accepts the VBRNASProxyServer[] object. To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRNASProxyServer[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

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
Remove-VBRNASProxyServer -ProxyServer <VBRNASProxyServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
