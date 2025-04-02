Start-VBRScaleOutBackupRepositoryRebalance
------------------------------------------

### Synopsis
Starts to rebalance data of scale-out backup repositories.

---

### Description

This cmdlet starts to rebalance data between extents of scale-out backup repositories.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Starting Scale-Out Repository Rebalance

$repository = Get-VBRBackupRepository -Name "Veeam Scale-Out Repository" -ScaleOut
Start-VBRScaleOutBackupRepositoryRebalance -Repository $repository
This example shows how to start to rebalance data between extents of scale-out backup repositories.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Provide the ScaleOut parameter. Save the result to the $repository variable.
2. Run the Start-VBRScaleOutBackupRepositoryRebalance cmdlet. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will starts to rebalance data between extents without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Repository**
Specifies a scale-out backup repository which extents you want to rebalance.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRScaleOutBackupRepositoryRebalance [-Force] -Repository <VBRScaleOutBackupRepository> [-RunAsync] [<CommonParameters>]
```
