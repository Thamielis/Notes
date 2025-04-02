Get-VBRIsilonInfrastructureVolume
---------------------------------

### Synopsis
Returns volumes of Dell PowerScale (formerly Isilon) storage systems.

---

### Description

This cmdlet returns an array of volumes of Dell PowerScale storage systems.
The cmdlet will return storage volumes even if they are not added to your backup infrastructure.

TIP: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Examples
> Example 1. Getting All Dell EPowerScale Volumes

```PowerShell
Get-VBRIsilonInfrastructureVolume
This command returns all volumes added to Dell PowerScale storage systems.
```
> Example 2. Getting Dell PowerScale Volumes by Name

```PowerShell
Get-VBRIsilonInfrastructureVolume -Name "Volume4", "Volume5"
This command returns Dell PowerScale storage volumes by the volume name.
```

---

### Parameters
#### **Host**
Specifies a storage.
The cmdlet will return an array of volumes added to that storage system.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CIsilonHost]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names that you want to get.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Isilon.CIsilonHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRIsilonInfrastructureVolume [-Host <CIsilonHost>] [-Name <String[]>] [<CommonParameters>]
```
