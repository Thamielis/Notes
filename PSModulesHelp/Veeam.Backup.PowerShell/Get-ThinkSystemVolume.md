Get-ThinkSystemVolume
---------------------

### Synopsis
Returns ThinkSystem storage volumes added to the backup infrastructure.

---

### Description

This cmdlet returns ThinkSystem storage volumes added to the backup infrastructure.

TIP: Run the Get-NetAppInfrastructureVolume cmdlet to get an array of volumes from a ThinkSystem storage system.

---

### Related Links
* [Get-ThinkSystemHost](Get-ThinkSystemHost)

---

### Examples
> Getting ThinkSystem Storage Volume

$storage = Get-ThinkSystemHost -Name "ThinkSystem Store"
Get-ThinkSystemVolume -Name "ThinkSystem Volume 01" -Host $storage
This example shows how to get a specific ThinkSystem storage volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-ThinkSystemHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-ThinkSystemVolume cmdlet. Specify the Name parameter value. Set the $storage variable as the Host parameter value.

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
Get-ThinkSystemVolume [-Host <CNaHost[]>] [-Name <String[]>] [<CommonParameters>]
```
