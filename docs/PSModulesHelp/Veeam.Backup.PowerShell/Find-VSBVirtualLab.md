Find-VSBVirtualLab
------------------

### Synopsis
Looks for virtual labs created on the specified ESX(i) host.

---

### Description

This cmdlet returns a list of all virtual labs created on the specified ESX(i) host, both registered in Veeam Backup & Replication and not.

You can get the list of all VMware virtual labs on the specified ESX(i) host or look for instances directly by name.

Run Connect-VSBVirtualLab to add the unregistered virtual labs to Veeam Backup & Replication.

---

### Examples
> Example 1

```PowerShell
Get-VBRServer -Type ESXi | Find-VSBVirtualLab
This command looks for the list of all virtual labs located on the ESXi hosts. The servers are obtained with Get-VBRServer, sorted by "Type" and piped down.
```
> Example 2

```PowerShell
Get-VBRServer -Name "ESXiHost" | Find-VSBVirtualLab -Name "MailServer_VLab"
This command looks for the virtual lab named "MailServer_VLab" connected to the ESXi host named "ESXiHost". The server is obtained with Get-VBRServer and piped down.
```

---

### Parameters
#### **Name**
Specifies the name of the resource pool you want to get, or search conditions. You can specify multiple names separated by commas.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies the server on which you want to look for virtual labs.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |0       |True (ByPropertyName, ByValue)|

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
Find-VSBVirtualLab [-Server] <CHost> [-Name <String[]>] [<CommonParameters>]
```
