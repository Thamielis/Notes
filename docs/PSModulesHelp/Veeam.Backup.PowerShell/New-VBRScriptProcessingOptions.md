New-VBRScriptProcessingOptions
------------------------------

### Synopsis
Creates pre-freeze and post-thaw scripts settings for Veeam Agent backup jobs.

---

### Description

This cmdlet creates the VBRScriptProcessingOptions object. This object contains pre-freeze and post-thaw scripts settings for the protected computer OS quiescence. You can use these scripts to create consistent backups of the protected computers that do not support Microsoft VSS.
For more information about custom scripts, see the Pre-Freeze and Post-Thaw Scripts section of the Veeam Agent Management Guide.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Creating Script Processing Settings for Veeam Agent Backup Job (Linux)

New-VBRScriptProcessingOptions -ProcessingAction RequireSuccess -ScriptPrefreezeCommand "C:\scripts\pre-script.bat" -ScriptPostthawCommand "C:\scripts\post-script.bat"
This command creates script processing settings for a Veeam Agent job that backs up Linux computers. The job will run with the following options:
- Veeam Backup & Replication will run the pre-freeze script before the job starts to quiesce the protected computer OS.
- Veeam Backup & Replication will run the post-thaw script after the snapshot is created to bring the protected computer back to the initial state.
> Example 2. Creating Script Processing Settings for Veeam Agent Backup Job (Windows)

$creds = Get-VBRCredentials
New-VBRScriptProcessingOptions -ProcessingAction IgnoreFailures -ScriptPrefreezeCommand "C:\script\pre-script.bat" -ScriptPostthawCommand "C:\script\post-script.bat" -Credentials $creds
This example shows how to create script processing settings for a Veeam Agent job that backs up Windows computers. The job will run with the following options:
- Veeam Backup & Replication will use the user account credentials to run pre-freeze and post-thaw scripts.
- Veeam Backup & Replication will continue to run the job even if scripts fail.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $creds variable.
2. Run the New-VBRScriptProcessingOptions cmdlet. Specify the following settings:
- Set the IgnoreFailures option for the ProcessingAction parameter.
- Specify the ScriptPrefreezeCommand parameter value.
- Specify the ScriptPostthawCommand parameter value.
- Set the $creds variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the user account credentials with local administrator privileges on the VM guest OS. Veeam Backup & Replication will use these credentials to run pre-freeze and post-thaw scripts.
By default, Veeam Agent for Microsoft Windows will use the credentials that you specified for the protection group.
Note: this option works for Veeam Agent jobs that back up Windows computers only.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **ProcessingAction**
Specifies script processing settings:
* IgnoreFailures: use this option if you want to continue the backup process even if script errors occur.
* RequireSuccess: use this option if you want Veeam Backup & Replication to stop the backup process if the scripts fail.
* DisableCompletely: use this option if you do not want to run scripts.
Note: The IgnoreFailures option does not work for Veeam Agent jobs that back up Linux computers. Use the RequireSuccess option to enable script execution for these types of jobs.
Valid Values:

* DisableCompletely
* IgnoreFailures
* RequireSuccess

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRGeneralProcessingAction]`|true    |named   |False        |

#### **ScriptPostJobCommand**
Specifies a post-freeze script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ScriptPostthawCommand**
Specifies the path on your backup server to a local folder with the post-thaw script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ScriptPrefreezeCommand**
Specifies the path on your backup server to a local folder with the pre-freeze script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ScriptPreJobCommand**
Specifies a post-thaw script.

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
New-VBRScriptProcessingOptions [-Credentials <CCredentials>] -ProcessingAction {DisableCompletely | IgnoreFailures | RequireSuccess} [-ScriptPostJobCommand <String>] [-ScriptPostthawCommand <String>] 
```
```PowerShell
[-ScriptPrefreezeCommand <String>] [-ScriptPreJobCommand <String>] [<CommonParameters>]
```
