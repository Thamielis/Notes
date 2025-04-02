Get-NetAppVolume
----------------

### Synopsis
Returns NetApp storage volumes added to the backup infrastructure.

---

### Description

This cmdlet returns NetApp storage volumes added to the backup infrastructure.

TIP: Run Get-NetAppInfrastructureVolume to get an array of volumes from a NetApp storage system.

---

### Related Links
* [Get-NetAppHost](Get-NetAppHost)

---

### Examples
> Example 1

$storage = Get-NetAppHost -Name "NetApp Store"
Get-NetAppVolume -Name "NetApp Volume 01" -Host $storage
This example shows how to get a specific NetApp storage volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-NetAppVolume cmdlet. Specify the Name parameter value. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies an array of storage systems.
The cmdlet will return volumes of these storage systems.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CNaHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.NetApp.CNaHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-NetAppVolume [-Host <CNaHost[]>] [-Name <String[]>] [<CommonParameters>]
```
