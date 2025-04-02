Get-VBRBackupRepository
-----------------------

### Synopsis
Returns a list of backup repositories.

---

### Description

This cmdlet returns a list of backup repositories added to the backup infrastructure.
You can get a list of all backup repositories, get scale-out backup repositories or look for repositories directly by name.
IMPORTANT! To get information on object storage repositories, run the Get-VBRObjectStorageRepository cmdlet.

---

### Examples
> Example 1. Getting Standalone Backup Repositories

```PowerShell
Get-VBRBackupRepository
This command gets all standalone backup repositories added to the backup infrastructure.
```
> Example 2. Getting Scale-Out Backup Repositories

```PowerShell
Get-VBRBackupRepository -ScaleOut
This command gets scale-out backup repositories added to the backup infrastructure.
```
> Example 3. Getting Standalone Backup Repositories by Name

```PowerShell
Get-VBRBackupRepository -Name "Backups Vol2", "Local*"
This command gets the Backups Vol12 and Local standalone backup repositories.
```
> Example 4. Getting Scale-Out Backup Repository by Name

```PowerShell
Get-VBRBackupRepository -ScaleOut -Name "Veeam Performance Scale-Out Repository"
This command gets scale-out backup repository named  Veeam Performance Scale-Out Repository.
```

---

### Parameters
#### **Name**
Specifies an array of backup repositories names. The cmdlet will return repositories with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **ScaleOut**
Defines that the cmdlet will return only scale-out backup repositories.
Note: You must provide this parameter to get scale-out backup repositories.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRBackupRepository [-Name <String[]>] [-ScaleOut] [<CommonParameters>]
```
