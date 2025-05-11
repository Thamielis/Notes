Set-VBRSureBackupTestScript
---------------------------

### Synopsis
Modifies settings of custom recovery verification scripts for VMs.

---

### Description

This cmdlet modifies settings of custom recovery verification scripts for VMs that are added to application groups and to jobs that are linked to SureBackup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSureBackupTestScript](New-VBRSureBackupTestScript)

---

### Examples
> Example 1. Modifying Path to Custom Recovery Verification Script

$script = New-VBRSureBackupTestScript -Name "ScriptVerification" -Path "C:\scripts\verificationscript.bat" -Argument "192.0.2.5 53"
Set-VBRSureBackupTestScript -Script $script -Path "C:\scripts\script.bat"
This example shows how to modify a path to a custom script. The cmdlet will use the C:\scripts\script.bat path instead of the C:\scripts\verificationscript.bat to access the script.
Perform the following steps:
1. Run the New-VBRSureBackupTestScript cmdlet. Specify the Name, Path and Argument parameter values. Save the result to the $script variable.
2. Run the Set-VBRSureBackupTestScript cmdlet. Set the $script variable as the Script parameter value. Specify the Path parameter value.
> Example 2. Modifying IP Address and Port Number of Custom Recovery Verification Script

$script = New-VBRSureBackupTestScript -Name "ScriptVerification"  -Path "C:\scripts\pre-script.bat" -Argument "192.0.2.7 75"
Set-VBRSureBackupTestScript -Script $script -Argument "192.0.2.7 64"
This example shows how to modify a path to a custom script. The cmdlet will use the 192.0.2.7 IP address and the 64 port number to access the VM.
Perform the following steps:
1. Run the New-VBRSureBackupTestScript cmdlet. Specify the Name, Path and Argument parameter values. Save the result to the $script variable.
2. Run the Set-VBRSureBackupTestScript cmdlet. Set the $script variable as the Script parameter value. Specify the Argument parameter value.

---

### Parameters
#### **Argument**
Specifies an IP address and the port number.
The cmdlet will use this IP address and port to access the VM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a name for a script.
The cmdlet will modify a name of the script to the specified

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Path**
Specifies a path to a script.
The cmdlet will use this path to access the script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Script**
Specifies a script.
The cmdlet will modify settings of this script.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRCustomSureBackupTestScript]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCustomSureBackupTestScript

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSureBackupTestScript [-Argument <String>] [-Name <String>] [-Path <String>] -Script <VBRCustomSureBackupTestScript> [<CommonParameters>]
```
