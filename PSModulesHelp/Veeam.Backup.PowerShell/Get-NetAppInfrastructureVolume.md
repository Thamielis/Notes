Get-NetAppInfrastructureVolume
------------------------------

### Synopsis
Returns storage volumes of NetApp storage systems.

---

### Description

This cmdlet returns an array of volumes of NetApp s torage systems.
The cmdlet will return storage volumes, even if they are not added to your backup infrastructure.

TIP: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Related Links
* [Get-NetAppHost](Get-NetAppHost)

---

### Examples
> Example 1

```PowerShell
Get-NetAppInfrastructureVolume
This command returns volumes of all NetApp storage systems.
```
> Example 2

```PowerShell
Get-NetAppInfrastructureVolume -Name "ISCSI Volume4", "ISCSI Volume5", "NFS Volume1"
This command returns NetApp storage volumes by the volume name.
```
> Example 3

$storage = Get-NetAppHost -Name "NetApp Store"
Get-NetAppInfrastructureVolume -Host $storage
This example shows how to get all volumes of the specified NetApp storage system.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-NetAppInfrastructureVolume cmdlet. Set the $storage variable as the Host parameter value.

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
Get-NetAppInfrastructureVolume [-Host <CNaHost>] [-Name <String[]>] [<CommonParameters>]
```
