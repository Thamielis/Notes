Get-VBRNutanixVolume
--------------------

### Synopsis
Returns all volumes of the specified Nutanix Files storage systems.

---

### Description

This cmdlet returns Nutanix Files volumes added to the backup infrastructure.

Tip: Run the Get-VBRIsilonInfrastructureVolume cmdlet to get an array of all volumes of Nutanix Files storage systems. The cmdlet will also return volumes not added to the backup infrastructure.

---

### Examples
> Example 1

```PowerShell
Get-VBRNutanixVolume -Name "VOL01"
This command gets Nutanix Files volumes.
```

---

### Parameters
#### **Host**
Specifies a storage system. The cmdlet will return an array of volumes added to that storage system.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[CNutanixHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names that you want to get. The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Nutanix.CNutanixHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNutanixVolume [-Host <CNutanixHost[]>] [-Name <String[]>] [<CommonParameters>]
```
