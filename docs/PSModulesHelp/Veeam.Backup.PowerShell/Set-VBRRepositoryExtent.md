Set-VBRRepositoryExtent
-----------------------

### Synopsis
Modifies performance extents of scale-out backup repositories.

---

### Description

This cmdlet modifies performance extents of a scale-out repository. You can change the backup placement mode for a selected extents to store only full backups, only incremental backups or full and incremental backups. By default, the extents are created with full and incremental backups placement mode.
IMPORTANT! You cannot modify parameters of object storage performance extents using this cmdlet.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRRepositoryExtent](Get-VBRRepositoryExtent)

---

### Examples
> Example 1. Changing Storing Mode to Store Only Full Backups

```PowerShell
Set-VBRRepositoryExtent -Extent "Backup Repository 1" -StoreFull
This command changes the storing mode to store only full backups for the extent named Backup Repository 1.
```
> Example 2. Enabling Storing Full and Incremental Backups

```PowerShell
Set-VBRRepositoryExtent -Extent "Backup Repository 1", "Backup Repository 4" -StoreFull -StoreIncrement
This command enables storing of full and incremental backups on extents Backup Repository 1 and Backup Repository 4.
```
> Example 3. Assigning Metadata and Data Roles

```PowerShell
Set-VBRRepositoryExtent -Extent "NAS Backup Repository on SSD" -Metadata
Set-VBRRepositoryExtent -Extent "Backup Repository 1" -Data
These commands enable assigning the metadata role to extent NAS Backup Repository on SSD and data role to extent Backup Repository 1.
```

---

### Parameters
#### **Data**
Defines that the extent will store only backup data.
This parameter can be used together with the Metadata parameter.
Default: False.
For more information, see the Scale-Out Repository with Extents in Metadata and Data Roles section in the Veeam Backup & Replication User Guide.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **Extent**
Specifies the array of extents you want to modify.
All extents must belong to the same scale-out repository.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRRepositoryExtent[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Metadata**
Defines that the extent will store only backup metadata.
Note: an extent with the metadata role can be used for storing NAS backup jobs metadata only.
This parameter can be used together with the Data parameter.
Default: False.
For more information, see the Scale-Out Repository with Extents in Metadata and Data Roles section in the Veeam Backup & Replication User Guide.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **StoreFull**
For extents with Performance policy.
Defines that the extent will store only full backups.
Default: False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **StoreIncrement**
For extents with Performance policy.
Defines that the extent will store only incremental backups.
Default: False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRRepositoryExtent[]

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRRepositoryExtent [-Data] -Extent <VBRRepositoryExtent[]> [-Metadata] [-StoreFull] [-StoreIncrement] [<CommonParameters>]
```
