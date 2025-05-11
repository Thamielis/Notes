Set-VBRImmutabilityLockExpirationDate
-------------------------------------

### Synopsis
Modifies immutability period of restore points located in a hardened repository.
IMPORTANT! This cmdlet does not support the following types of restore points:
- Restore points created by file share backup jobs.
- Restore points created by application backup policies.
- Restore points for transaction logs.

---

### Description

This cmdlet modifies immutability period of restore points located in a hardened repository.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.
IMPORTANT!  It is not possible to reduce immutability via PowerShell commands. After you set the value, you can either extend it or reset back to the original value. However, you cannot set it to a smaller value than was originally set.

---

### Related Links
* [Get-Date](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Get-Date)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Example 1. Extending Immutability Period of Restore Points

$restorepoint = Get-VBRRestorePoint
$date = Get-Date -Year 2023 -Month 2 -Day 3 -Hour 0 -Minute 0 -Second 0
Set-VBRImmutabilityLockExpirationDate -RestorePoint $restorepoint -ExpirationDate $date
This examples shows how to set Veeam Backup & Replication to remove restore points on 03.02.2023 from the hardened repository.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $date variable.
3. Run the Set-VBRImmutabilityLockExpirationDate cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $date variable as the ExpirationDate parameter value.
> Example 2. Resetting Immutability Period of Restore Points

$restorepoint = Get-VBRRestorePoint
Set-VBRImmutabilityLockExpirationDate -RestorePoint $restorepoint -ToOriginal
This examples shows how to reset immutability period of restore points. The cmdlet will set the immutability to the time period that was originally specified for the hardened repository.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Set-VBRImmutabilityLockExpirationDate cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Provide the ToOriginal parameter.

---

### Parameters
#### **ExpirationDate**
Specifies a date when Veeam Backup & Replication is allowed to remove restore points from a hardened repository with immutability.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |False        |

#### **RestorePoint**
Specifies an array of restore points. The cmdlet will modify immutability period for these restore points.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[COib[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **ToOriginal**
Defines that the cmdlet will reset the immutability period of restore points to their original value.
If you provide this value, the cmdlet will set the immutability to the maximum time period that is available for the hardened repository.
Note: This parameter is available starting from Veeam Backup & Replication 11a (build 11.0.1.1261).
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRImmutabilityLockExpirationDate [-RestorePoint] <COib[]> -ExpirationDate <DateTime> [<CommonParameters>]
```
```PowerShell
Set-VBRImmutabilityLockExpirationDate [-RestorePoint] <COib[]> -ToOriginal [<CommonParameters>]
```
