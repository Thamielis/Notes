Set-VBRApplicationGroupStartupOptions
-------------------------------------

### Synopsis
Modifies VM startup settings for staged restore.

---

### Description

The cmdlet modifies startup settings for staged restore.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRApplicationGroupStartupOptions](New-VBRApplicationGroupStartupOptions)

---

### Examples
> Modifying Startup Settings for VMs in Application Group

$startup = New-VBRApplicationGroupStartupOptions -MaximumBootTime 200 -ApplicationInitializationTimeout 150 -MemoryAllocationPercent 80
$newoptions = Set-VBRApplicationGroupStartupOptions -Options $startup -MaximumBootTime 250 -ApplicationInitializationTimeout 80 -MemoryAllocationPercent 67
This example shows how to modify startup settings for VMs added to an application group. Veeam Backup & Replication will perform staged restore with the following settings:
- The stabilization period is set to 200 sec.
- The period to initialize the guest applications is set to 150.
- The amount of memory provided for the VM is set to 80 percent.
Perform the following steps:
1. Run the New-VBRApplicationGroupStartupOptions cmdlet. Specify the MaximumBootTime, ApplicationInitializationTimeout and MemoryAllocationPercent parameter value. Save the result to the $startup variable.
2. Run the Set-VBRApplicationGroupStartupOptions cmdlet. Specify the following settings:
- Set the $startup variable as the Options parameter value.
- Specify the MaximumBootTime parameter value.
- Specify the ApplicationInitializationTimeout parameter value.
- Specify the MemoryAllocationPercent parameter value.

---

### Parameters
#### **ApplicationInitializationTimeout**
Specifies a timeout required to initialize applications on VMs.
Default: 120 sec.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
|`[Int32]`|false   |named   |False        |

#### **MemoryAllocationPercent**
Specifies the amount of memory that you want to pre-allocate to VMs when these VMs start.
Default: 100 percent.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Options**
Specifies the VM startup settings that you want to modify.

|Type                                 |Required|Position|PipelineInput |
|-------------------------------------|--------|--------|--------------|
|`[VBRApplicationGroupStartupOptions]`|true    |named   |True (ByValue)|

#### **PingCheck**
Defines that Veeam Backup & Replication will perform a ping test for verified VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRApplicationGroupStartupOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRApplicationGroupStartupOptions [-ApplicationInitializationTimeout <Int32>] [-HeartbeatCheck] [-MaximumBootTime <Int32>] [-MemoryAllocationPercent <Int32>] -Options <VBRApplicationGroupStartupOptions> 
```
```PowerShell
[-PingCheck] [<CommonParameters>]
```
