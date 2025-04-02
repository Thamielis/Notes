New-VBRSureBackupStartupOptions
-------------------------------

### Synopsis
Defines startup settings for VMs.

---

### Description

This cmdlet creates the VBRSureBackupStartupOptions object that defines startup settings for VMs that are added to application groups and to jobs that are linked to SureBackup jobs.

---

### Examples
> Example 1. Defining Startup Settings for VMs Added to Application Groups

New-VBRSureBackupStartupOptions -MaximumBootTime 200 -ApplicationInitializationTimeout 150 -AllocatedMemory 80 -EnableVMPingCheck -EnableVMHeartbeatCheck
This command specifies startup settings for VMs added to an application group. Veeam Backup & Replication will perform staged restore with the following VM startup settings:
- The period that is required for VMs to boot is set to 200 seconds.
- The timeout required to initialize applications on VMs is set to 150 seconds.
- The amount of memory provided for VMs is set to 80 percent.
- Veeam Backup & Replication will perform heartbeat and ping tests.
> Example 2. Defining Startup Settings with Disabled Verification Tests for VMs Added to Application Groups

New-VBRSureBackupStartupOptions -MaximumBootTime 100 -ApplicationInitializationTimeout 200 -AllocatedMemory 90 -EnableVMPingCheck:$False -EnableVMHeartbeatCheck:$False
This command specifies the following startup settings for VMs added to an application group. Veeam Backup & Replication will perform staged restore with the following VM startup settings:
- The period that is required for VMs to boot is set to 100 seconds.
- The timeout required to initialize applications on VMs is set to 200 seconds.
- The amount of memory provided for VMs is set to 90 percent.
- Veeam Backup & Replication will perform not heartbeat and ping tests.

---

### Parameters
#### **AllocatedMemory**
Specifies the amount of memory that you want to pre-allocate to VMs when these VMs start.
Default: 100 percent.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **ApplicationInitializationTimeout**
Specifies the timeout that is required to initialize applications on VMs.
Default: 120 seconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **DisableWindowsFirewall**
Defines that Veeam Backup & Replication will disable Windows Firewall.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVMHeartbeatCheck**
Defines that Veeam Backup & Replication will enable a heartbeat test for verified VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **EnableVMPingCheck**
Defines that Veeam Backup & Replication will enable a ping test for verified VMs.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **MaximumBootTime**
Specifies the period that is required for VMs to boot.
Default: 600 seconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

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
New-VBRSureBackupStartupOptions -AllocatedMemory <Int32> -ApplicationInitializationTimeout <Int32> [-DisableWindowsFirewall] -EnableVMHeartbeatCheck -EnableVMPingCheck -MaximumBootTime <Int32> 
```
```PowerShell
[<CommonParameters>]
```
