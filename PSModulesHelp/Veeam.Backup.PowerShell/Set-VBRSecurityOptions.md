Set-VBRSecurityOptions
----------------------

### Synopsis
Modifies Veeam Backup & Replication security settings.

---

### Description

This cmdlet modifies the following Veeam Backup & Replication security settings:
- Trust policy for Linux hosts
- Audit logs settings
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRSecurityOptions](Get-VBRSecurityOptions)

* [Get-VBRLinuxTrustedHostPolicy](Get-VBRLinuxTrustedHostPolicy)

---

### Examples
> Example 1. Modifying Trust Policy for Linux Hosts

$policy = Get-VBRLinuxTrustedHostPolicy
Set-VBRSecurityOptions -HostPolicy $policy
This example shows how to modify the trust policy for Linux hosts.
Perform the following steps:
1. Run the Get-VBRLinuxTrustedHostPolicy cmdlet. Save the result to the $policy variable.
2. Run the Set-VBRSecurityOptions cmdlet. Set the $policy variable as the HostPolicy parameter value.
> Example 2. Modifying Audit logs Settings

Set-VBRSecurityOptions -AuditLogPath "C:\Users\Administrator\Documents\Logs"
This example shows how to modify audit logs settings. Veeam Backup & Replication will store logs in the C:\Users\Administrator\Documents\Logs folder.

---

### Parameters
#### **AuditLogPath**
Specifies the path to the folder where Veeam Backup & Replication stores audit logs.
Default: %ProgramData%\Veeam\Backup\Audit.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CompressAuditLogs**
Defines that the cmdlet will compress the previous versions of audit logs. If you do not provide this parameter, Veeam Backup & Replication will keep all logs without compression.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableFipsCompliantMode**
Enables the FIPS-compliant operation mode. If you provide this parameter, the cmdlet will restrict connection to non-compliant platforms.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify the security settings without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HostPolicy**
Specifies the trust policy for Linux hosts.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRLinuxTrustedHostPolicy]`|false   |named   |False        |

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
Set-VBRSecurityOptions [-AuditLogPath <String>] [-CompressAuditLogs] [-EnableFipsCompliantMode] [-Force] [-HostPolicy <VBRLinuxTrustedHostPolicy>] [<CommonParameters>]
```
