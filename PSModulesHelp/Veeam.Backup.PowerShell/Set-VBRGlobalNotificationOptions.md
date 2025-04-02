Set-VBRGlobalNotificationOptions
--------------------------------

### Synopsis
Modifies global notification settings.

---

### Description

This cmdlet modifies global notification settings.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRGlobalNotificationOptions](Get-VBRGlobalNotificationOptions)

---

### Examples
> Modifying Target Backup Repository Disk Space Threshold

```PowerShell
Set-VBRGlobalNotificationOptions -StorageSpaceThreshold 15 -StorageSpaceThresholdEnabled:$False
StorageSpaceThresholdEnabled   : True
StorageSpaceThreshold          : 15
DatastoreSpaceThresholdEnabled : True
DatastoreSpaceThreshold        : 10
SkipVMSpaceThresholdEnabled    : True
SkipVMSpaceThreshold           : 5
NotifyOnSupportExpiration      : True
NotifyOnOnUpdates              : True
This command sets the disk space threshold of the target backup repository to 15 percent.
```

---

### Parameters
#### **DatastoreSpaceThreshold**
Specifies a disk space threshold for production datastore in percent.
Default: 10.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **DatastoreSpaceThresholdEnabled**
Defines that Veeam Backup & Replication will display a warning message in the job session details when the disk space in a production datastore is below a specific value.
To specify a disk space threshold for a production datastore provide the DatastoreSpaceThreshold parameter.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnSupportExpiration**
Defines that Veeam Backup & Replication will notify about the support expiration date in every email notification.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnUpdates**
Defines that Veeam Backup & Replication will notify about new product versions and patches available on the Veeam website.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SkipVMSpaceThreshold**
Specifies a disk space threshold for production datastore in percent. Default: 5.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SkipVMSpaceThresholdEnabled**
Defines that Veeam Backup & Replication will stop backup jobs that work with production datastores before VM snapshots are taken if free disk space in this datastore is below the specified threshold.
To specify a disk space threshold for a production datastore provide the DatastoreSpaceThreshold parameter.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StorageSpaceThreshold**
Specifies a disk space threshold for backup repositories in percent.
Default: 10.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **StorageSpaceThresholdEnabled**
Defines that Veeam Backup & Replication will display a warning message in the job session details when the disk space in the target backup repository is below a specific value.
To specify a disk space threshold provide the  StorageSpaceThreshold parameter.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

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
Set-VBRGlobalNotificationOptions [-DatastoreSpaceThreshold <Int32>] [-DatastoreSpaceThresholdEnabled] [-NotifyOnSupportExpiration] [-NotifyOnUpdates] [-SkipVMSpaceThreshold <Int32>] 
```
```PowerShell
[-SkipVMSpaceThresholdEnabled] [-StorageSpaceThreshold <Int32>] [-StorageSpaceThresholdEnabled] [<CommonParameters>]
```
