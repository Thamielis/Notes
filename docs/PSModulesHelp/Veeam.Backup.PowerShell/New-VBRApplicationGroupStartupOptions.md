New-VBRApplicationGroupStartupOptions
-------------------------------------

### Synopsis
Creates VM startup settings for staged restore.

---

### Description

The cmdlet creates the VBRApplicationGroupStartupOptions object that contains VM startup settings for staged restore.
Run the Start-VBRRestoreVM cmdlet to restore VMware VMs with the staged restore option.
Run the Start-VBRHvRestoreVM cmdlet to restore Hyper-V VMs with the staged restore option.

---

### Examples
> Example 1. Defining Startup Settings

$startupoptions = New-VBRApplicationGroupStartupOptions -MaximumBootTime 200 -ApplicationInitializationTimeout 150 -MemoryAllocationPercent 80
This command defines startup settings for VMs added to an application group. Veeam Backup & Replication will perform staged restore with the following VM startup settings:
- The period that is required for VMs to boot is set to 200 sec.
- The timeout required to initialize applications on VMs is set to 150.
- The amount of memory provided for VMs is set to 80 percent.
> Example 2. Defining Startup Settings with Heartbeat and Ping Tests

$startupoptions = New-VBRApplicationGroupStartupOptions -MaximumBootTime 150 -ApplicationInitializationTimeout 130 -MemoryAllocationPercent 110 -HeartbeatCheck -PingCheck
This command defines startup settings for VMs added to an application group. Veeam Backup & Replication will perform staged restore with the following VM startup settings:
- The period that is required for VMs to boot is set to 150 sec.
- The timeout required to initialize applications on VMs is set to 130.
- The amount of memory provided for VMs is set to 110 percent.

---

### Parameters
#### **ApplicationInitializationTimeout**
Specifies the timeout required to initialize applications on VMs.
Default: 120 sec.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **HeartbeatCheck**
Defines that Veeam Backup & Replication will perform a heartbeat test for verified VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MaximumBootTime**
Specifies the period that is required for VMs to boot.
Default: 600 sec.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **MemoryAllocationPercent**
Specifies the amount of memory that you want to pre-allocate to VMs when these VMs start.
Default: 100 percent.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **PingCheck**
Defines that Veeam Backup & Replication will perform a ping test for verified VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
New-VBRApplicationGroupStartupOptions -ApplicationInitializationTimeout <Int32> [-HeartbeatCheck] -MaximumBootTime <Int32> -MemoryAllocationPercent <Int32> [-PingCheck] [<CommonParameters>]
```
