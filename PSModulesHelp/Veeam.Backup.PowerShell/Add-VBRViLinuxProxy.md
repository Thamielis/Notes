Add-VBRViLinuxProxy
-------------------

### Synopsis
Adds Linux backup proxies to the backup infrastructure.

---

### Description

This cmdlet adds Linux backup proxies to the backup infrastructure.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Example 1. Adding Linux Backup Proxy Server

$linuxsrv = Get-VBRServer -Name "LinSrv2045"
Add-VBRViLinuxProxy -Server $linuxsrv -MaxTasks 3 -Force
This example shows how to add the LinSrv2045 VM as a Linux backup proxy to the infrastructure. The backup proxy is assigned 3 maximum concurrent tasks.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $linuxsrv variable.
2. Run the Add-VBRViLinuxProxy cmdlet. Set the $linuxsrv variable as the Server parameter value. Specify the MaxTasks parameter value. Provide the Force parameter.
> Example 2. Adding Linux Backup Proxy Server and Assigning Backup Proxy Role Explicitly

$linuxsrv = Get-VBRServer -Name "LinSrv2045"
$proxy = Find-VBRViEntity -Name "LinSrv2045"
Add-VBRViLinuxProxy -Server $linuxsrv -ProxyVM $proxy -Force
This example shows how to add a Linux backup proxy to the backup infrastructure. The backup proxy will be configured with 2 maximum concurrent tasks.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $linuxsrv variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
3. Run the Add-VBRViLinuxProxy cmdlet. Specify the following settings:
- Set the $linuxsrv variable as the Server parameter value.
- Set the $proxy variable as the ProxyVM parameter value.
- Provide the Force parameter.

---

### Parameters
#### **ConnectedDatastoreMode**
Specifies the mode the Linux proxy will use to connect to datastores:
* Auto: Veeam Backup & Replication automatically detects all datastores that allow direct SAN or NFS connection.
* Manual: Backup proxy has a direct SAN or NFS connection to datastores in the Datastore list. Use the Datastore parameter to specify the allowed datastores.
Default: Auto.
Valid Values:

* Auto
* Manual

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRProxyConnectedDatastoreMode]`|false   |named   |False        |

#### **Datastore**
Specifies an array of datastores to which the backup proxy has a direct SAN or NFS connection.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRViDatastore[]]`|false   |named   |False        |

#### **Description**
Specifies the description of the Linux backup proxy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableFailoverToNBD**
Enables failover to the Network transport mode if a backup proxy fails to transport data using the Direct storage access or Virtual appliance transport mode.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableHostToProxyEncryption**
Enables VM data transportation over an encrypted SSL connection in the Network transport mode.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a Linux backup proxy without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MaxTasks**
Specifies the number of concurrent tasks that can be assigned to the backup proxy simultaneously.
Permitted values: 1-100.
Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ProxyVM**
Specifies a Linux VM that is added to the VMware environment. The cmdlet will assign a backup proxy role explicitly to this Linux VM.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CViVmItem]`|false   |named   |False        |

#### **Server**
Specifies a Linux VM which will act as a backup proxy. The cmdlet will assign a role of a backup proxy to the Linux server that is added to the backup infrastructure.
Note: You must provide the ProxyVM parameter in the following cases:
* If Veeam Backup & Replication can not get the BIOS UUID of the Linux VM that you want to add as a backup proxy.
* If the disk.EnableUUID parameter in the vSphere configuration settings is set to False for the Linux VM that you want to add as a backup proxy.
* If the Linux VM that you want to add as a backup proxy has been cloned or converted and this duplicate VM has the same BIOS UUID as the original one.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **TransportMode**
Specifies a data transport mode that the Linux proxy will apply to retrieve VM data from the source and write VM data to the target. You can specify one of the following transport mode type:
Specifies the transport mode used by the backup proxy:
Auto: Use this option to set the automatic proxy selection mode.
DirectStorageAccess: Use this option to set the direct storage access transport mode (Direct SAN access or Direct NFS access).
HotAdd: Use this option to set the virtual appliance transport mode.
Nbd: Use this option to set the network transport mode.
Default: Auto
Valid Values:

* Auto
* DirectStorageAccess
* HotAdd
* Nbd

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRProxyTransportMode]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRViLinuxProxy [-ConnectedDatastoreMode {Auto | Manual}] [-Datastore <VBRViDatastore[]>] [-Description <String>] [-EnableFailoverToNBD] [-EnableHostToProxyEncryption] [-Force] [-MaxTasks <Int32>] [-ProxyVM 
```
```PowerShell
<CViVmItem>] -Server <CHost> [-TransportMode {Auto | DirectStorageAccess | HotAdd | Nbd}] [<CommonParameters>]
```
