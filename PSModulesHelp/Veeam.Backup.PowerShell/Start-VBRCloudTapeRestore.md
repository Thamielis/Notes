Start-VBRCloudTapeRestore
-------------------------

### Synopsis
Starts a restore session of the tenant data from tape.

---

### Description

Starts a restore session of the tenant data from tape. Run the Stop-VBRCloudTapeRestore cmdlet to stop the restore session.

Important!
- Veeam Backup & Replication disables the tenant until the restore operation completes.
- For the restore to another cloud repository scenario you must create a new cloud tenant resource beforehand. Run the New-VBRCloudTenantResource cmdlet to create the cloud tenant resource.

---

### Related Links
* [Get-VBRCloudTapeBackupTenantRepository](Get-VBRCloudTapeBackupTenantRepository)

* [Get-VBRCloudTapeBackupTenant](Get-VBRCloudTapeBackupTenant)

* [Get-VBRCloudTapeBackupTenantJob](Get-VBRCloudTapeBackupTenantJob)

* [New-VBRCloudTenantResource](New-VBRCloudTenantResource)

* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRCloudTenantResource](New-VBRCloudTenantResource)

---

### Examples
> Example 1. Restoring Tenant Data from Tape to Original Location [Using Variable]

$repository = Get-VBRCloudTapeBackupTenantRepository -Name "Silver Cloud Repository"
$date = New-Object 2023, 10, 25, 15, 25, 45
Start-VBRCloudTapeRestore -BackupObject $repository -PointInTime $date
This example shows how to restore the tenant data from tape to original location. Veeam Backup & Replication will select the restore point that is the closest to Thursday, October 25, 2023 3:25:45 PM.

Perform the following steps:
1. Run Get-VBRCloudTapeBackupTenantRepository to get the tenant cloud repository. Save the result to the $repository variable.
2. Run New-Object to specify the date and time for the restore point. Save the result to the $date variable.
3. Run Start-VBRCloudTapeRestore with the $repository and $date variables.
> Example 2. Restoring Tenant Data from Tape to Another Cloud Repository [Using Variable]

$backupjob = Get-VBRCloudTapeBackupTenantJob -Name "Exchange Backup Job"
$repo = Get-VBRBackupRepository -Name "NewCloudRepository"
$newtenant = New-VBRCloudTenantResource -Repository $repo -RepositoryFriendlyName "Silver Cloud Repository" -Quota 100
$date = New-Object DateTime 2023, 11, 15, 13, 00, 31
Start-VBRCloudTapeRestore -BackupObject $backupjob -MappingTarget $newtenant -PointInTime $date
This example shows how to restore a tenant backup job from tape to another cloud repository. Veeam Backup & Replication will select the restore point that is the closest to Thursday, November 15, 2023 1:00:31 PM.

Perform the following steps:
1. Run Get-VBRCloudTapeBackupTenantJob to get the tenant backup job. Save the result to the $backupjob variable.
2. Run Get-VBRBackupRepository to get the cloud repository that you want to use as the target for restore. Save the result to the $repo variable.
3. Run New-VBRCloudTenantResource with the $repo variable to create new cloud tenant resource settings. Save the result to the $newtenant variable.
4. Run New-Object to specify the date and time for the restore point. Save the result to the $date variable.
5. Run Start-VBRCloudTapeRestore with the $backupjob, $newtenant and $date variables.
> Example 3. Restoring Tenant Data from Tape to Target Server [Using Variable]

$creds = Get-VBRCredentials -Name "Fileserver"
$tenant = Get-VBRCloudTapeBackupTenant -Name "New tenant"
$targetserver = Get-VBRServer -Name "New server"
$date = New-Object DateTime 2023, 10, 18, 13, 58, 31
Start-VBRCloudTapeRestore -BackupObject $tenant -Server $server -Path "D:\Backups" -Credentials $creds -PointInTime "11/16/23
This example shows how to restore the selected tenant to a folder on the Fileserver target server.  Veeam Backup & Replication will select the restore point that is closest to Thursday, October 23, 2023 1:58:31 PM.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
2. Run the Get-VBRCloudTapeBackupTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
3. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $targetserver variable.
4. Run the New-Object cmdlet to specify the date and time for the restore point. Save the result to the $date variable.
5. Run the Start-VBRCloudTapeRestore cmdlet. Specify the following settings:
- Set the $tenant variable as the BackupObject parameter value.
- Set the $targetserver variable as the Server parameter value.
- Specify the Path parameter value.
- Set the $creds variable as the Credentials parameter value.
- Set the $date variable as the PointInTime parameter value.

---

### Parameters
#### **BackupObject**
Specifies the tenant object that you want to restore. You can restore the following tenant objects:
* Tenants
* Tenants quotas
* Tenants jobs
Accepts the VBRCloudTapeBackupObject[] object. To get this object, run one of the following cmdlets:
* Get-VBRCloudTapeBackupTenant
* Get-VBRCloudTapeBackupTenantRepository
* Get-VBRCloudTapeBackupTenantJob

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRCloudTapeBackupObject[]]`|true    |0       |True (ByValue)|

#### **Credentials**
For export backup files to disk. Specifies credentials that Veeam Backup & Replication will use to connect to a server added to Veeam Backup & Replication infrastructure. Veeam Backup & Replication will restore tenant backups to the folder on this server. Accepts the CCredentials object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **MappingTarget**
For restore to another cloud repository. Specifies the target repository. The cmdlet will restore the backup to the specified location. Accepts the VBRCloudTenantResource[] object. Run the New-VBRCloudTenantResource cmdlet to create this object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource[]]`|true    |named   |False        |

#### **Overwrite**
For the following types of restore:
* To original location
* To another cloud repository
Defines that the cmdlet will overwrite the existing backup file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Path**
For exporting backup files to disk. Specifies the path to the folder. Veeam Backup & Replication will restore the files to the folder specified in the path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PointInTime**
Specifies the point in time. The cmdlet will select the restore point that is the closest to the selected point in time. For example, if you specify Thursday, October 25, 2023 3:25:45 PM as the point in time, the cmdlet will select the closest restore point to this point in time. NOTE: The date format depends on the date format of the OS where you run the script. Accepts the DateTime type.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
For exporting backup files to disk. Specifies a server in the Veeam Backup & Replication infrastructure. Veeam Backup & Replication will restore tenant backups to the folder on this server. Accepts the CHost object.  To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTapeBackupObject[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRCloudTapeRestore [-BackupObject] <VBRCloudTapeBackupObject[]> -Credentials <CCredentials> -Path <String> -PointInTime <DateTime> [-RunAsync] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Start-VBRCloudTapeRestore [-BackupObject] <VBRCloudTapeBackupObject[]> -MappingTarget <VBRCloudTenantResource[]> [-Overwrite] -PointInTime <DateTime> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Start-VBRCloudTapeRestore [-BackupObject] <VBRCloudTapeBackupObject[]> [-Overwrite] -PointInTime <DateTime> [-RunAsync] [<CommonParameters>]
```
