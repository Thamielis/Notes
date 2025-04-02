Remove-VBRComputerFileProxyServer
---------------------------------

### Synopsis
Removes file proxy servers from the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet removes file proxy servers from the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRComputerFileProxyServer](Get-VBRComputerFileProxyServer)

---

### Examples
> Removing File Proxy Server

$proxy = Get-VBRComputerFileProxyServer -Name "File Proxy 01"
Remove-VBRComputerFileProxyServer -FileProxy $proxy
This example shows how to remove the File Proxy 01 file proxy server from the Veeam Backup & Replication infrastructure.
Perform the following steps:
1. Run the Get-VBRComputerFileProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Remove-VBRComputerFileProxyServer cmdlet. Set the $proxy variable as the FileProxy parameter value.

---

### Parameters
#### **ProxyServer**
Specifies the file proxy server. The cmdlet will remove this server from the Veeam Backup & Replication infrastructure.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRComputerFileProxyServer[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRComputerFileProxyServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRComputerFileProxyServer -ProxyServer <VBRComputerFileProxyServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
