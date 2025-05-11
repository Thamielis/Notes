Add-VBRViProxy
--------------

### Synopsis
Adds a VMware backup proxy to the backup infrastructure.

---

### Description

This cmdlet adds a VMware backup proxy server to the backup infrastructure.
When you add a proxy, you assign the role of the backup proxy to a Windows-based or Linux-based server that you add to the backup infrastructure. To add a new proxy, you must add the necessary server to the backup infrastructure beforehand.
Run the Add-VBRWinServer cmdlet to add a Microsoft Windows server the backup infrastructure.
Run the Add-VBRLinux cmdlet to add a Linux server to the backup infrastructure.
Run the Add-VBRHvProxy cmdlet to add Hyper-V backup proxies.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Adding New VMware Backup Proxy [Using Pipeline]

Get-VBRServer -Name "VMware Local Server" | Add-VBRViProxy -Description "Local Backup Proxy" -MaxTasks 6
This example shows how to add a new VMware backup proxy. The Description is Local Backup Proxy. The max concurrent tasks number is set to 6.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Add-VBRViProxy cmdlet. Specify the Description parameter value. Specify the MaxTasks parameter value.
> Example 2. Adding New VMware Backup Proxy [Using Variable]

$server = Get-VBRServer -Name "VMware Local Server"
Add-VBRViProxy -Server $server -Description "Local Backup Proxy"
This example shows how to add a new VMware backup proxy. The description of the proxy is Local Backup Proxy. The max concurrent tasks number is set to 2 by default.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRViProxy cmdlet. Set the $server variable as the Server parameter value. Specify the Description parameter value.
> Example 3. Adding New VMware Backup Proxy with Virtual Appliance Transport Mode

$server = Get-VBRServer -Name "VMware Local Server"
Add-VBRViProxy -Server $server -Description "Local Backup Proxy" -TransportMode HotAdd -EnableFailoverToNBD:$false
This example shows how to add a new VMware backup proxy with the Virtual appliance transport mode. The failover to the network transport mode option is disabled.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRViProxy cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Description parameter value.
- Set the HotAdd option for the TransportMode parameter.
- Set the EnableFailoverToNBD parameter to $false.

---

### Parameters
#### **ConnectedDatastoreMode**
Specifies the mode a proxy will use to connect to datastores:
* Auto - Veeam Backup & Replication automatically detects all datastores that allow direct SAN or NFS connection.
* Manual - A backup proxy has a direct SAN or NFS connection to the datastores. Use the Datastore parameter to specify the allowed datastores.
Default: Auto.
Valid Values:

* Auto
* Manual

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRProxyConnectedDatastoreMode]`|false   |named   |False        |

#### **Datastore**
Specifies a list of datastores to which a backup proxy has a direct SAN or NFS connection.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRViDatastore[]]`|false   |named   |False        |

#### **Description**
Specifies the description of a VMware proxy.

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

#### **MaxTasks**
Specifies the number of concurrent tasks that can be assigned to a proxy simultaneously.
Permitted values: 1-100.
Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies a server that will act as a VMware backup proxy.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **TransportMode**
Specifies the transport mode used by a backup proxy:
* Auto: Use this option to set the automatic proxy selection mode.
* DirectStorageAccess: Use this option to set the direct storage access transport mode (Direct SAN access or Direct NFS access).
* HotAdd: Use this option to set the virtual appliance transport mode.
* Nbd: Use this option to set the network transport mode.
Default: Auto.
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
Add-VBRViProxy [-ConnectedDatastoreMode {Auto | Manual}] [-Datastore <VBRViDatastore[]>] [-Description <String>] [-EnableFailoverToNBD] [-EnableHostToProxyEncryption] [-MaxTasks <Int32>] -Server <CHost> 
```
```PowerShell
[-TransportMode {Auto | DirectStorageAccess | HotAdd | Nbd}] [<CommonParameters>]
```
