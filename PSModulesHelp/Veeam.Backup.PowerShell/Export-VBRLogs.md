Export-VBRLogs
--------------

### Synopsis
Collects system logs for export.

---

### Description

This cmdlet collects system logs. The log files are written to the folder you specify in this cmdlet.
You can use this cmdlet to collect logs you can send to the Veeam support.
You can get logs for all kind of virtual host, any jobs including SureBackup jobs, entities including VMware or Hyper-V VMs, or any backup. Use an appropriate parameter set for each case.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

---

### Examples
> Example 1. Collecting Logs for Servers

$server = Get-VBRServer -Name "Active_Directory"
Export-VBRLogs -Server $server -FolderPath "C:\Logs" -Compress -LastDays 7
This example shows how to collect log files from the Active_Directory server with the following settings:
- The destination path is C:\Logs.
- The period for collecting data is last 7 days.
- The logs compression is enabled.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Export-VBRLogs cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the FolderPath parameter value.
- Specify the LastDays parameter value.
> Example 2. Collecting Logs for Jobs

$job = Get-VBRSureBackupJob -Name "DC SureJob"
Export-VBRLogs -Job $job -FolderPath "C:\Logs\SureBackup Logs" -Compress:$false
This example shows how to collect log files for the DC SureJob SureBackup job with the following settings:
- The destination path is C:\Logs\SureBackup Logs.
- The period for collecting data is not set to collect all the data for the job.
- The logs compression is disabled.
Perform the following steps:
- Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
- Run the Export-VBRLogs cmdlet. Set the $job variable as the Job parameter value. Specify the FolderPath parameter value. Set the Compress parameter to $false.
> Example 3. Collecting Logs for VM

$vm = Find-VBRViEntity -Name "DC"
Export-VBRLogs -Entity $vm -FolderPath "C:\Logs" -LastDays 30
This example shows how to collect log files for the DC VM with the following settings:
- The destination path is C:\Logs.
- The period for collecting data is last 30 days.
- The logs compression is enabled.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Export-VBRLogs cmdlet. Specify the following settings:
- Set the $vm variable as the Entity parameter value.
- Specify the FolderPath parameter value.
- Specify the LastDays parameter value.
> Example 4. Collecting Logs for Backups

$backup = Get-VBRBackup -Name "srv2049-job"
Export-VBRLogs -CBackup $backup -FolderPath "C:\Logs" -LastDays 14
This example shows how to collect log files for the srv2049-job backup with the following settings:
- The destination path is C:\Logs.
- The period for collecting data is last 14 days.
- The logs compression is enabled.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Export-VBRLogs cmdlet. Specify the following settings:
- Set the $backup variable as the CBackup parameter value.
- Specify the FolderPath parameter value.
- Specify the LastDays parameter value.
> Example 5. Collecting Logs for Protected Computers

$machines = Get-VBRDiscoveredComputer -Type Computer
Export-VBRLogs -Computer $machines[3] -FolderPath "C:\Logs" -LastDays 10
This example shows how to collect log files for protected computers with the following settings:
- The destination path is C:\Logs.
- The period for collecting data is last 10 days.
- The logs compression is enabled.
Perform the following steps:
1. Run the Get-VBRDiscoveredComputer cmdlet. Set the Computer option for the Type parameter. Save the result to the $machines variable.
The Get-VBRDiscoveredComputer cmdlet will return an array of protected computers. Mind the ordinal number of the necessary protected computer (in our example, it is the fourth computer in the array).
2. Run the Export-VBRLogs cmdlet. Specify the following settings:
- Set the $machines[3] variable as the Computer parameter value.
- Specify the FolderPath parameter value.
- Specify the LastDays parameter value.

---

### Parameters
#### **Backup**
Specifies an array of backups. The cmdlet will collect logs of these backups.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Compress**
Defines that the log files will be compressed.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Computer**
Specifies an array of protected computers. The cmdlet will collect logs of these computers.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputer[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Entity**
Specifies an array of VMs. The cmdlet will collect logs of these VMs.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IVmItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **FolderPath**
Specifies the destination folder. The cmdlet will export  logs to this folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **From**
Specifies the start date to collect the logs for export. Enter the date in format set in your workstation Date and Time settings. Note: This parameter is deprecated and will be marked as obsolete in the future. You must re-write your scripts by using the LastDays parameter. Otherwise, the script will return an error.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Job**
Specifies an array of jobs. The cmdlet will collect logs of these jobs.
Accepts all kinds of jobs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[IJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **LastDays**
Specifies the number of last days to collect the logs for.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies an array of servers. The cmdlet will collect logs from these servers.
Note: The selected servers must be running and available over the network.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CHost[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Tenant**
Specifies an array of cloud tenants. The cmdlet will collect logs of these cloud tenants.
Note: This parameter does not return logs of VMware Cloud Director and Active Directory tenant accounts.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRCloudTenant[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **To**
Specifies the end date to collect the logs for export. Enter the date in format set in your workstation Date and Time settings. Note: This parameter is deprecated and will be marked as obsolete in the future. You must re-write your scripts by using the LastDays parameter. Otherwise, the script will return an error.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Wait**
Defines that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Common.CHost[]

Veeam.Backup.Core.IJob[]

Veeam.Backup.Core.IVmItem[]

Veeam.Backup.Core.CBackup[]

Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputer[]

Veeam.Backup.PowerShell.Infos.VBRCloudTenant[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Export-VBRLogs -Backup <CBackup[]> [-Compress] -FolderPath <String> [-From <DateTime>] [-LastDays <Int32>] [-To <DateTime>] [-Wait] [<CommonParameters>]
```
```PowerShell
Export-VBRLogs [-Compress] -Computer <VBRDiscoveredComputer[]> -FolderPath <String> [-From <DateTime>] [-LastDays <Int32>] [-To <DateTime>] [-Wait] [<CommonParameters>]
```
```PowerShell
Export-VBRLogs [-Compress] -Entity <IVmItem[]> -FolderPath <String> [-From <DateTime>] [-LastDays <Int32>] [-To <DateTime>] [-Wait] [<CommonParameters>]
```
```PowerShell
Export-VBRLogs [-Compress] -FolderPath <String> [-From <DateTime>] -Job <IJob[]> [-LastDays <Int32>] [-To <DateTime>] [-Wait] [<CommonParameters>]
```
```PowerShell
Export-VBRLogs [-Compress] -FolderPath <String> [-From <DateTime>] [-LastDays <Int32>] -Server <CHost[]> [-To <DateTime>] [-Wait] [<CommonParameters>]
```
```PowerShell
Export-VBRLogs [-Compress] -FolderPath <String> [-From <DateTime>] [-LastDays <Int32>] -Tenant <VBRCloudTenant[]> [-To <DateTime>] [-Wait] [<CommonParameters>]
```
