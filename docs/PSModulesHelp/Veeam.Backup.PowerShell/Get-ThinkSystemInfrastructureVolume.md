Get-ThinkSystemInfrastructureVolume
-----------------------------------

### Synopsis
Returns storage volumes of ThinkSystem storage systems.

---

### Description

This cmdlet returns an array of volumes of ThinkSystem storage systems.
The cmdlet will return storage volumes, even if they are not added to your backup infrastructure.

Tip: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Related Links
* [Get-ThinkSystemHost](Get-ThinkSystemHost)

---

### Examples
> Example 1. Getting All Storage Volumes

```PowerShell
Get-ThinkSystemInfrastructureVolume
This command returns volumes of all ThinkSystem storage systems.
```
> Example 2. Getting Storage Volumes by Name

```PowerShell
Get-ThinkSystemInfrastructureVolume -Name "ISCSI Volume4", "ISCSI Volume5", "NFS Volume1"
This command returns ThinkSystem storage volumes by the volume name.
```
> Example 3. Getting All Volumes of Specific Storage System

$storage = Get-ThinkSystemHost -Name "ThinkSystem Store"
Get-VInfrastructureVolume -Host $storage
This example shows how to get all volumes of the specified ThinkSystem storage system.

Perform the following steps:
1. Run the Get-ThinkSystemHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-ThinkSystemInfrastructureVolume cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage system.
The cmdlet will return volumes of this storage system.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CNaHost]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.NetApp.CNaHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-ThinkSystemInfrastructureVolume [-Host <CNaHost>] [-Name <String[]>] [<CommonParameters>]
```
