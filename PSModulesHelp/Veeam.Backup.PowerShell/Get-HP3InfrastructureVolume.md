Get-HP3InfrastructureVolume
---------------------------

### Synopsis
Returns volumes of HPE 3PAR StoreServ storage systems.

---

### Description

This cmdlet returns an array of volumes of HPE 3PAR StoreServ storage systems.
The cmdlet will return storage volumes, even if they are not added to your backup infrastructure.

TIP: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Related Links
* [Get-HP3Storage](Get-HP3Storage)

---

### Examples
> Example 1

```PowerShell
Get-HP3InfrastructureVolume
This command returns all volumes added to HPE 3PAR StoreServ storage systems.
```
> Example 2

```PowerShell
Get-HP3InfrastructureVolume -Name "ISCSI Volume4", "ISCSI Volume5", "NFS Volume1"
This command returns specific HPE 3PAR StoreServ storage volumes. Use the Name parameter to specify the names of the volumes.
```
> Example 3

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServe Storage"
Get-HP3InfrastructureVolume -Storage $storage
This example shows how to get all volumes added to the specific HPE 3PAR StoreServ storage system.

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP3InfrastructureVolume cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Name**
Specifies an array of volume names that you want to get.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Storage**
Specifies a storage system.
The cmdlet will return an array of the volumes added to that storage system.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CHp3PARHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Hp3PAR.CHp3PARHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-HP3InfrastructureVolume [-Name <String[]>] [-Storage <CHp3PARHost>] [<CommonParameters>]
```
