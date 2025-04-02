Set-VBRSureBackupStartupOptions
-------------------------------

### Synopsis
Modifies startup settings for VMs that are added to application groups and to jobs that are linked to SureBackup jobs.

---

### Description

This cmdlet modifies startup settings for VMs that are added to application groups and to jobs that are linked to SureBackup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSureBackupStartupOptions](New-VBRSureBackupStartupOptions)

---

### Examples
> Modifying Startup Settings

$startup = New-VBRSureBackupStartupOptions -MaximumBootTime 200 -ApplicationInitializationTimeout 120 -AllocatedMemory 60 -EnableVMPingCheck -EnableVMHeartbeatCheck
Set-VBRSureBackupStartupOptions -Options $startup -ApplicationInitializationTimeout 150 -AllocatedMemory 80
This example shows how to modify startup settings for VMs to add to application groups. The cmdlet will change the following settings:
- The timeout required to initialize applications on VMs will be changed from 120 to 150 seconds.
- The amount of memory provided for VMs will be changed from 60 to 80 percent.
Perform the following steps:
1. Run the New-VBRSureBackupStartupOptions cmdlet. Specify the necessary parameters. Save the result to the $startup variable.
2. Run the Set-VBRSureBackupStartupOptions cmdlet. Specify the following settings:
- Set the $startup as the Options parameter value.
- Specify the ApplicationInitializationTimeout parameter value.
- Specify the AllocatedMemory parameter value.

---

### Parameters
#### **AllocatedMemory**
Specifies the amount of memory that you want to pre-allocate to VMs when these VMs start.
Default: 100 percent.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ApplicationInitializationTimeout**
Specifies the timeout that is required to initialize applications on VMs.
Default: 120 seconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **DisableWindowsFirewall**
Defines that Veeam Backup & Replication will disable Windows Firewall.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVMHeartbeatCheck**
Defines that Veeam Backup & Replication will perform a heartbeat test for verified VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVMPingCheck**
Defines that Veeam Backup & Replication will perform a ping test for verified VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MaximumBootTime**
Specifies the period that is required for VMs to boot.
Default: 600 seconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Options**
Specifies the startup options that you want to modify.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRSureBackupStartupOptions]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSureBackupStartupOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSureBackupStartupOptions [-AllocatedMemory <Int32>] [-ApplicationInitializationTimeout <Int32>] [-DisableWindowsFirewall] [-EnableVMHeartbeatCheck] [-EnableVMPingCheck] [-MaximumBootTime <Int32>] 
```
```PowerShell
-Options <VBRSureBackupStartupOptions> [<CommonParameters>]
```
