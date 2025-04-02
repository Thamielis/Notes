Set-VBRSanIntegrationOptions
----------------------------

### Synopsis
Modifies storage integration settings for the Veeam Agent backup job.

---

### Description

This cmdlet modifies storage integration settings for the Veeam Agent backup job.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [Get-VBRComputerFileProxyServer](Get-VBRComputerFileProxyServer)

* [Set-VBRComputerBackupJob](Set-VBRComputerBackupJob)

---

### Examples
> Example 1. Replacing File Proxy Server

$job = Get-VBRComputerBackupJob -Name "Daily Backup"
$currentSanIntOpt = $job.SanIntegrationOptions
$proxy = Get-VBRComputerFileProxyServer -Name "File Proxy 02"
Set-VBRSanIntegrationOptions -SanIntegrationOptions $currentSanIntOpt -Proxy $proxy
This command shows how to replace a file proxy server. Veeam Backup & Replication will create Veeam Agent backups from the storage snapshots using a new file proxy.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Get the current storage integration settings of the Veeam Agent backup job. Use the VBRSanIntegrationOptions parameter of the $job variable. Save it to the $currentSanIntOpt variable.
3. Run the Get-VBRComputerFileProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
4. Run the Set-VBRSanIntegrationOptions cmdlet. Set the $currentSanIntOpt variable as the SanIntegrationOptions parameter value. Set the $proxy variable as the Proxy parameter value.
> Example 2. Disabling Storage Integration for Veeam Agent Backup Job

$job = Get-VBRComputerBackupJob -Name "Daily Backup"
$currentSanIntOpt = $job.SanIntegrationOptions
$NewSanIntOpt = Set-VBRSanIntegrationOptions -SanIntegrationOptions $currentSanIntOpt -EnableSanSnapshots:$false
Set-VBRComputerBackupJob -Job $job -SanIntegrationOptions $NewSanIntOpt
This example shows how to disable storage integration for the Veeam Agent backup job. Veeam Backup & Replication will create Veeam Agent backups using a software VSS provider.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Get the current storage integration settings of the Veeam Agent backup job. Use the VBRSanIntegrationOptions parameter of the $job variable. Save it to the $currentSanIntOpt variable.
3. Run the Set-VBRSanIntegrationOptions cmdlet. Set the $currentSanIntOpt variable as the SanIntegrationOptions parameter value. Specify the EnableSanSnapshots parameter value. Save the result to the $NewSanIntOpt variable.
4. Run the Set-VBRComputerBackupJob cmdlet. Specify the $job variable as the Job parameter value. Set the $NewSanIntOpt variable as the SanIntegrationOptions parameter value.

---

### Parameters
#### **EnableFailoverFromSan**
Enables the option for Veeam Backup & Replication to failover to a backup operation with a software VSS provider.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSanProxyAutodetect**
Enables the option to use all file proxies that are added to your Veeam Backup & Replication environment.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSanSnapshots**
Enables the option to create Veeam Agent backups from native storage snapshots.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Proxy**
Specifies the server which will act as a file proxy.
If not specified, the SanProxyAutodetectEnabled option must have the True value.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRComputerFileProxyServer[]]`|false   |named   |False        |

#### **SanIntegrationOptions**
Specifies the set of storage integration settings which Veeam Backup & Replication will modify.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[VBRSanIntegrationOptions]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSanIntegrationOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSanIntegrationOptions [-EnableFailoverFromSan] [-EnableSanProxyAutodetect] [-EnableSanSnapshots] [-Proxy <VBRComputerFileProxyServer[]>] -SanIntegrationOptions <VBRSanIntegrationOptions> 
```
```PowerShell
[<CommonParameters>]
```
