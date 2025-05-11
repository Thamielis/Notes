Find-VSBHvVirtualLab
--------------------

### Synopsis
Looks for the virtual labs created on the specified Hyper-V host.

---

### Description

This cmdlet returns a list of all virtual labs created on the specified Hyper-V host, both registered in Veeam Backup & Replication and not.

You can get the list of all virtual labs on the specified Hyper-V host or look for instances directly by name.

Run Connect-VSBHvVirtualLab to add the unregistered virtual labs to Veeam Backup & Replication.

---

### Examples
> Example 1

```PowerShell
Get-VBRServer -Name "Hyper-V Host" | Find-VSBHvVirtualLab
This command looks for the list of all virtual labs created on the Hyper-V server named "Hyper-V Host". The server object is obtained with Get-VBRServer and piped down.
```
> Example 2

```PowerShell
Find-VSBHvVirtualLab -Server $server -Name Hv*
This command looks for the virtual labs with names starting with "Hv" on the server represented by the $server variable. The server object is obtained with Get-VBRServer and assigned to the variable beforehand.
```

---

### Parameters
#### **Name**
Specifies the name of the virtual lab or search conditions. You can specify multiple names separated by commas.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies the server on which you want to look for virtual labs.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|false   |0       |True (ByPropertyName, ByValue)|

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
Find-VSBHvVirtualLab [[-Server] <CHost>] [-Name <String[]>] [<CommonParameters>]
```
