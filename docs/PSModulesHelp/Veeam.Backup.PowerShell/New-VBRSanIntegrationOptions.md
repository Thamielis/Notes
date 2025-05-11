New-VBRSanIntegrationOptions
----------------------------

### Synopsis
Defines storage integration for the Veeam Agent backup job.

---

### Description

This cmdlet defines Veeam Agent integration settings of the storage system.
You can run this cmdlet to allow Veeam Backup & Replication to create Veeam Agent backups from the storage native snapshots.

---

### Related Links
* [Get-VBRComputerFileProxyServer](Get-VBRComputerFileProxyServer)

---

### Examples
> Example 1. Defining Veeam Agent Integration Settings with Automatic File Proxy Selection

New-VBRSanIntegrationOptions -EnableSanSnapshots
This command defines integration settings for the Veeam Agent backup job and allow Veeam Backup & Replication to select suitable file proxies for data transfer.
> Example 2. Defining Veeam Agent Integration Settings with Specific File Proxy Server

$proxy = Get-VBRComputerFileProxyServer -Name "File Proxy 01"
New-VBRSanIntegrationOptions -Proxy $proxy -EnableSanSnapshots
This example shows how to define integration settings and specify a file proxy server for data transfer. Veeam Backup & Replication will create Veeam Agent backups from the storage snapshots using the specified file proxy.
Perform the following steps:
1. Run the Get-VBRComputerFileProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the New-VBRSanIntegrationOptions cmdlet. Set the $proxy variable as the Proxy parameter value. Provide the EnableSanSnapshots parameter.

---

### Parameters
#### **EnableFailoverFromSan**
Enables the option for Veeam Backup & Replication to failover to a backup operation with a software VSS provider.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSanSnapshots**
Enables the option to create Veeam Agent backups from native storage snapshots.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OsPlatform**
Specifies the OS of protected computers. The cmdlet will define Veeam Agent integration settings of the storage system for these types of computers:
* Windows: for Windows computers.
* Linux: for Linux computers.
* Mac: for macOS computers.
* Unix: for Unix computers.
Default: Windows.
Note: Veeam Agent integration settings of the storage system are not supported for Linux and macOS computers in current version of Veeam PowerShell.
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRAgentType]`|false   |named   |False        |

#### **Proxy**
Specifies the server which will act as a file proxy.
If not specified, Veeam Backup & Replication will select suitable file proxies from your Veeam Backup & Replication environment.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRComputerFileProxyServer[]]`|false   |named   |False        |

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
New-VBRSanIntegrationOptions [-EnableFailoverFromSan] [-EnableSanSnapshots] [-OsPlatform {Windows | Linux | Mac | Unix}] [-Proxy <VBRComputerFileProxyServer[]>] [<CommonParameters>]
```
