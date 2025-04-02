Set-VBRSureBackupJobVerificationOptions
---------------------------------------

### Synopsis
Modifies additional settings for the SureBackup job.

---

### Description

This cmdlet modifies additional settings for the SureBackup job.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSureBackupJobVerificationOptions](New-VBRSureBackupJobVerificationOptions)

---

### Examples
> Modifying Email Notifications Address

$options = New-VBRSureBackupJobVerificationOptions -EnableEmailNotification -Address "administrator@tech.com"
Set-VBRSureBackupJobVerificationOptions -VerificationOptions $options -Address "administrator@tech.com, tech@tech.com"
This example shows how to modify the emall notification address for the SureBackup job. Veeam Backup & Replication will send email notifications to the administrator@tech.com and tech@tech.com email addresses.
Perform the following steps:
1. Run the New-VBRSureBackupJobVerificationOptions cmdlet. Provide the EnableEmailNotification parameter. Specify the Address parameter value. Save the result to the $options variable.
2. Run the Set-VBRSureBackupJobVerificationOptions cmdlet. Set the $options variable as the VerificationOptions parameter value. Specify the Address parameter value.

---

### Parameters
#### **Address**
Specifies an array of email addresses. Veeam Backup & Replication will send notifications to these email addresses.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **DisableApplicationGroupMalwareScan**
Defines that Veeam Backup & Replication will not perform an antivirus scan of VMs from an application group and will scan VMs from linked jobs only.
If you want to perform an antivirus scan of VMs from an application group, provide the :$false value for the parameter.
Default: True.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DisableApplicationGroupValidation**
Defines that Veeam Backup & Replication will not apply the CRC test to backup files of VMs from an application group.
If you want to apply CRC test to backup files of VMs from application groups, provide the :$false value for the parameter.
Default: True.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableDiskContentValidation**
Defines that Veeam Backup & Replication will validate backup files of VMs with a CRC check to make sure that the file is not corrupted.
If you do not provide this parameter, Veeam Backup & Replication will not apply the CRC check to backup files.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEmailNotification**
Defines that Veeam Backup & Replication will send email notifications on the job state.
If you do not provide this parameter, email notifications will not be sent.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireImageScan**
For the antivirus scan option.
Defines that the antivirus software will continue scanning VMs after the first malware is found.
If you do not provide this parameter, the antivirus software will stop scanning VMs after the first malware is found.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableMalwareScan**
Defines that Veeam Backup & Replication will scan VMs with antivirus software.
If you do not specify this parameter, Veeam Backup & Replication will not scan VMs with antivirus software.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSNMPNotification**
Defines that Veeam Backup & Replication will send SNMP traps.
If you do not provide this parameter, SNMP traps will not be sent.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Defines that Veeam Backup & Replication will scan VMs with the specified YARA rule.
If you do not provide this parameter, Veeam Backup & Replication will not scan VMs with the YARA rule.
Use the YARAScanRule parameter to specify the YARA rule.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnError**
Defines that Veeam Backup & Replication will send email notifications on error.
If you do not provide the EnableEmailNotification parameter, email notifications will not be sent.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnSuccess**
Defines that Veeam Backup & Replication will send email notifications on success.
If you do not provide the EnableEmailNotification parameter, email notifications will not be sent.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnWarning**
Defines that Veeam Backup & Replication will send email notifications on warning.
If you do not provide the EnableEmailNotification parameter, email notifications will not be sent.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Subject**
Specifies the email subject.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **UseCustomEmailSettings**
Defines that Veeam Backup & Replication will use custom settings email instead of global email settings.
If you do not provide this parameter, global email settings will be used.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VerificationOptions**
Specifies additional settings for the SureBackup job. The cmdlet will modify these settings.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobVerificationOptions]`|true    |named   |False        |

#### **YARAScanRule**
Specifies the YARA rule. Veeam Backup & Replication will scan VMs with this rule.
Note: Veeam Backup & Replication searches for YARA rules by the following path: \Program Files\Veeam\Backup and Replication\Backup\YaraRules.
To use the YARA rule, you must specify its name and extension. Veeam Backup & Replication accepts only the .yar and .yara extensions.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Set-VBRSureBackupJobVerificationOptions [-Address <String[]>] [-DisableApplicationGroupMalwareScan] [-DisableApplicationGroupValidation] [-EnableDiskContentValidation] [-EnableEmailNotification] 
```
```PowerShell
[-EnableEntireImageScan] [-EnableMalwareScan] [-EnableSNMPNotification] [-EnableYARAScan] [-NotifyOnError] [-NotifyOnSuccess] [-NotifyOnWarning] [-Subject <String>] [-UseCustomEmailSettings] 
```
```PowerShell
-VerificationOptions <VBRSureBackupJobVerificationOptions> [-YARAScanRule <String>] [<CommonParameters>]
```
