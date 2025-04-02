Get-VBRNutanixInfrastructureVolume
----------------------------------

### Synopsis
Returns Nutanix Files volumes added to the backup infrastructure.

---

### Description

This cmdlet returns an array of volumes of Nutanix Files storage systems. The cmdlet will return storage volumes even if they are not added to your backup infrastructure.

Tip: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Related Links
* [Get-VBRNutanixHost](Get-VBRNutanixHost)

---

### Examples
> Example 1

$host = Get-VBRNutanixHost -Name "Nutanix Files_host"
Get-VBRNutanixInfrastructureVolume -Host $host
This example shows how to get an array of volumes of Nutanix Files storage systems.

Perform the following steps:
1. Run the Get-VBRNutanixHost cmdlet. Specify the Name parameter value. Save the result to the $host variable.
2. Run the Get-VBRNutanixInfrastructureVolume cmdlet. Set the $host variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage system. The cmdlet will return an array of volumes added to that storage system.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CNutanixHost]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names that you want to get. The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Nutanix.CNutanixHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNutanixInfrastructureVolume [-Host <CNutanixHost>] [-Name <String[]>] [<CommonParameters>]
```
