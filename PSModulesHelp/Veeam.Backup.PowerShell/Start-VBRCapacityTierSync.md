Start-VBRCapacityTierSync
-------------------------

### Synopsis
Starts to offload data stored on the performance tier to capacity tier.

---

### Description

This cmdlet starts to offload data stored on the performance tier to capacity tier.
You cannot offload data from the performance extents are set to the Maintenance mode to capacity tier.
Run the Disable-VBRCapacityExtentMaintenanceMode cmdlet to disable the Maintenance mode for the necessary performance extent.
If you provide the ApproximateOffloadSizeGB parameter, the cmdlet will move backups to capacity tier and delete them from performance tier.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Offloading Data From Performance Tier to Capacity Tier

$repository = Get-VBRBackupRepository -ScaleOut
Start-VBRCapacityTierSync -Repository $repository[1]
This example shows how to start offload data from the performance tier to the capacity tier. We recommend using this script if you have several scale-out repositories and would like to synchronize data on a specific repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the ScaleOut parameter. Save the result to the $repository variable.
The Get-VBRBackupRepository cmdlet will return an array of scale-out repositories. Mind the ordinal number of the necessary repository (in our example, it is the second scale-out repository in the array).
2. Run the Start-VBRCapacityTierSync cmdlet. Set the $repository variable as the Repository parameter value.
> Example 2. Offloading Data From Performance Tier to Capacity Tier [Using Pipeline]

Get-VBRBackupRepository -ScaleOut | ForEach-Object {Start-VBRCapacityTierSync -Repository $_ -RunAsync}
This example shows how to sync data stored on the performance tier with the data on capacity tier. We recommend using this script if you do not want to specify an ordinal number of a scale-out repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the ScaleOut parameter.
2. Pipe the cmdlet output to the ForEach-Object cmdlet. Set the $_ value for the Repository. Provide the RunAsync parameter.

---

### Parameters
#### **ApproximateOffloadSizeGB**
Specifies an approximate size of data that you want to offload to the capacity tier.
Note: If you provide this parameter, the cmdlet will move backups to capacity tier and delete them from performance tier.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |True (ByPropertyName)|

#### **Repository**
Specifies a scale-out backup repository. The cmdlet will return the performance extents added to this repository.

|Type                           |Required|Position|PipelineInput |Aliases|
|-------------------------------|--------|--------|--------------|-------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByValue)|SOBR   |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

System.Int64

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRCapacityTierSync [-ApproximateOffloadSizeGB <Int64>] -Repository <VBRScaleOutBackupRepository> [-RunAsync] [<CommonParameters>]
```
