Set-VBRMailNotificationConfiguration
------------------------------------

### Synopsis
Modifies global email notification settings.

---

### Description

This cmdelt modifies global email notification settings.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Examples
> Modifying Global Email Notification Settings

Set-VBRMailNotificationConfiguration -SmtpServer 172.17.53.12 -Sender backup@tech.com -Recipient administrator@tech.com -Subject %BackupJobs% -NotifyOnFailure
This command modifes the global notification settings. Veeam Backup & Replication will send notification settings with the following options:
- The IP address of the SMTP server that Veeam Backup & Replication will use to send messages is 172.17.53.12.
- The messages are sent from the backup@tech.com email address.
- The messages are sent to the administrator@tech.com email address.
- The subject of the messages is %BackupJobs%.
- Veeam Backup & Replication will send messages if the backup job fails.

---

### Parameters
#### **Credentials**
Specifies the user credentials that Veeam Backup & Replication will use connect to the SMTP server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **DailyReportsTime**
Specifies the time when Veeam Backup & Replication will send daily reports.
Default: 1/1/2019 10:00:00 PM

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **EnableAuth**
Defines that Veeam Backup & Replication will use user credentials to connect to the SMTP server.
Default: Disabled

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSSL**
Enables SSL.
If you provide this parameter, Veeam Backup & Replication will send email notifications over secure connection.
Default: Disabled

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify global email notification settings without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnFailure**
Defines that Veeam Backup & Replication will send email notifications if a job does not complete successfully.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnLastRetryOnly**
Defines that Veeam Backup & Replication will send  email notifications about the final job status.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnSuccess**
Defines that Veeam Backup & Replication will send email notifications if a job runs successfully.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnWarning**
Defines that Veeam Backup & Replication will send email notifications if a job completes with a warning.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Port**
Specifies the port number. The SMTP server will send messages over this port.
Default: 25

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Recipient**
Specifies the recipient addresses.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Sender**
Specifies an email address. The cmdlet will send email notifications from this address.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SmtpServer**
Specifies a full DNS name or an IP address of the SMTP server. The cmdlet will use this server to send email notifications.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Subject**
Specifies the subject of the email notifications.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Timeout**
Specifies the connection timeout for the SMTP server.
Default: 100000

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Set-VBRMailNotificationConfiguration [-Credentials <CCredentials>] [-DailyReportsTime <DateTime>] [-EnableAuth] [-EnableSSL] [-Force] [-NotifyOnFailure] [-NotifyOnLastRetryOnly] [-NotifyOnSuccess] 
```
```PowerShell
[-NotifyOnWarning] [-Port <Int32>] [-Recipient <String>] [-Sender <String>] [-SmtpServer <String>] [-Subject <String>] [-Timeout <Int32>] [<CommonParameters>]
```
