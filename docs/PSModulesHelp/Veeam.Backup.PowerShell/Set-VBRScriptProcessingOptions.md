Set-VBRScriptProcessingOptions
------------------------------

### Synopsis
Modifies pre-freeze and post-thaw scripts settings for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies pre-freeze and post-thaw scripts settings for the protected computer OS quiescence.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRScriptProcessingOptions](New-VBRScriptProcessingOptions)

---

### Examples
> Modifying Script Processing Settings for Veeam Agent Job (Windows)

$script = New-VBRScriptProcessingOptions -ProcessingAction IgnoreFailures -ScriptPrefreezeCommand "C:\script\pre-script.bat" -ScriptPostthawCommand "C:\script\post-script.bat"
Set-VBRScriptProcessingOptions -Options $script -ProcessingAction RequireSuccess
This example shows how to modify the existing script processing settings for a Veeam Agent job that backs up Windows computers.
Perform the following steps:
1. Run the New-VBRScriptProcessingOptions cmdlet. Set the IgnoreFailures option for the ProcessingAction parameter. Specify the ScriptPrefreezeCommand and ScriptPostthawCommand parameter values. Save the result to the $script variable.
2. Run the Set-VBRScriptProcessingOptions cmdlet. Set the $script variable as the Options parameter value. Set the RequireSuccess option for the ProcessingAction parameter.

---

### Parameters
#### **Credentials**
Specifies the user account credentials with local administrator privileges on the VM guest OS. Veeam Backup & Replication will use these credentials to run pre-freeze and post-thaw scripts.
By default, Veeam Agent for Microsoft Windows will use the credentials that you specified for the protection group.
Note: This option works for Veeam Agent jobs that back up Windows computers only.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Options**
Specifies script processing options that you want to modify.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRScriptProcessingOptions]`|true    |named   |True (ByValue)|

#### **ProcessingAction**
Specifies script processing settings.
* DisableCompletely: use this option if you do not want to run scripts.
* IgnoreFailures: use this option if you want to continue the backup process even if script errors occur.
* RequireSuccess: use this option if you want Veeam Backup & Replication to stop the backup process if the script fails.
Note: The IgnoreFailures option does not work for Veeam Agent backup jobs that back up Linux computers. Use the RequireSuccess option to enable script execution for these types of jobs.
Valid Values:

* DisableCompletely
* IgnoreFailures
* RequireSuccess

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRGeneralProcessingAction]`|false   |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRScriptProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRScriptProcessingOptions [-Credentials <CCredentials>] -Options <VBRScriptProcessingOptions> [-ProcessingAction {DisableCompletely | IgnoreFailures | RequireSuccess}] [-ScriptPostJobCommand <String>] 
```
```PowerShell
[-ScriptPostthawCommand <String>] [-ScriptPrefreezeCommand <String>] [-ScriptPreJobCommand <String>] [<CommonParameters>]
```
