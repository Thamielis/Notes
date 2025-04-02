Set-VBRJobAdvancedNotificationOptions
-------------------------------------

### Synopsis
Customizes job notification settings.

---

### Description

This cmdlet sets notification options for the selected job.
You can set SNMP and email notifications on job run results.
IMPORTANT! Veeam Backup & Replication will send email notifications and SNMP notifications only in case these options are set up in the Veeam Backup & Replication general settings. Note that you cannot enable email notifications and SNMP notifications with Veeam PowerShell. Read more about job notification settings in Veeam Backup & Replication user guide at http://www.veeam.com/vmware-backup/help-center.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Setting SNMP and Email Notifications for Backup Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01" | Set-VBRJobAdvancedNotificationOptions -SnmpNotification $True -EmailNotification $True -EmailNotificationAddresses "administrator@veeam.com"
This example shows how to set SNMP and email notifications for the backup job named Backup Job 01.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedNotificationOptions cmdlet. Specify the following settings:
- Provide the $True value for the SnmpNotification parameter.
- Provide the $True value for the EmailNotification parameter.
- Specify the EmailNotificationAddresses parameter value.
> Example 2. Turning off Previously Set Email Notification for Backup Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01" | Set-VBRJobAdvancedNotificationOptions -EmailNotification $False
This example shows how to turn off the previously set email notification for the backup job named Backup Job 01.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedNotificationOptions cmdlet. Provide the $False value for the EmailNotification parameter.

---

### Parameters
#### **EmailNotification**
Defines whether the job will send notifications to email address(es). Use the EmailNotificationAddresses parameter to specify the addresses.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **EmailNotificationAddresses**
Specifies the email address(es) to use for email notification. You can write multiple addresses separated by semicolon.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs. The cmdlet will modify notification options of these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SnmpNotification**
Defines whether the job will send the SNMP notification. You need to have the SNMP notification pre-configured.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRJobAdvancedNotificationOptions [-EmailNotification <Boolean>] [-EmailNotificationAddresses <String>] -Job <CBackupJob[]> [-SnmpNotification <Boolean>] [<CommonParameters>]
```
