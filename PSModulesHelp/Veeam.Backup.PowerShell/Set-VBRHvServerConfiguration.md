Set-VBRHvServerConfiguration
----------------------------

### Synopsis
Modifies settings of Microsoft Hyper-V hosts added to the backup infrastructure.

---

### Description

This cmdlet modifies settings of Microsoft Hyper-V hosts added to the backup infrastructure. To modify settings, you need to specify new values for the necessary parameters. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerConfiguration](Get-VBRHvServerConfiguration)

---

### Examples
> Example 1. Enabling Failover Options for Microsoft Hyper-V Host

$server = Get-VBRServer -Name hyperv09.tech.local
$settings = Get-VBRHvServerConfiguration -Server $server
Set-VBRHvServerConfiguration -Configuration $settings -EnableFailover
This example shows how to enable the failover option for the hyperv09.tech.local Microsoft Hyper-V host added to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerConfiguration cmdlet. Set the $server variable as the Server parameter value. Save the result to the $settings variable.
3. Run the Set-VBRHvServerConfiguration cmdlet. Set the $settings variable as the Configuration parameter value. Provide the EnableFailover parameter.
> Example 2. Enabling Changed Block Tracking Option for Microsoft Hyper-V Host

$server = Get-VBRServer -Name hyperv09.tech.local
$settings = Get-VBRHvServerConfiguration -Server $server
Set-VBRHvServerConfiguration -Configuration $settings -EnableCBT
This example shows how to enable the changed block tracking for processing the hyperv09.tech.local Microsoft Hyper-V host added to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerConfiguration cmdlet. Set the $server variable as the Server parameter value. Save the result to the $settings variable.
3. Run the Set-VBRHvServerConfiguration cmdlet. Set the $settings variable as the Configuration parameter value. Provide the EnableCBT parameter.

---

### Parameters
#### **Configuration**
Specifies an array of settings of Microsoft Hyper-V hosts. The cmdlet will modify these settings.

|Type                                |Required|Position|PipelineInput                 |
|------------------------------------|--------|--------|------------------------------|
|`[VBRHvServerConfigurationObject[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **EnableCBT**
Defines that the cmdlet will enable the changed block tracking option for processing the Microsoft Hyper-V VMs.
If you do not provide this parameter, the changed block tracking option will not be enabled.
Default: False.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

#### **EnableFailover**
Defines that the cmdlet will enable the failover option settings.
If you do not provide this parameter, Veeam Backup & Replication will fail over to a software VSS provider when the hardware VSS provider does not manage to create a volume snapshot.
Default: False.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRHvServerConfigurationObject[]

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvServerConfiguration -Configuration <VBRHvServerConfigurationObject[]> [-EnableCBT] [-EnableFailover] [<CommonParameters>]
```
