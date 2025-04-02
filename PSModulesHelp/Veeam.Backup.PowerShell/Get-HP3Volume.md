Get-HP3Volume
-------------

### Synopsis
Returns HPE 3PAR StoreServ storage volumes added to the backup infrastructure.

---

### Description

This cmdlet returns HPE 3PAR StoreServ storage volumes added to the backup infrastructure.

TIP: Run Get-HP3InfrastructureVolume to get an array of volumes from HPE 3PAR StoreServ storage systems.

---

### Related Links
* [Get-HP3Storage](Get-HP3Storage)

---

### Examples
> Example 1

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServe Storage"
Get-HP3Volume -Storage $storage
This example shows how to get an HPE 3PAR StoreServ volume volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP3Volume cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Name**
Specifies an array of volume names.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Storage**
Specifies an array of storage systems.
The cmdlet will return volumes of these storage systems.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[CHp3PARHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Hp3PAR.CHp3PARHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-HP3Volume [-Name <String[]>] [-Storage <CHp3PARHost[]>] [<CommonParameters>]
```
