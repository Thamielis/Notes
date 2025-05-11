Set-VBRViLinuxProxy
-------------------

### Synopsis
Modifies settings of Linux backup proxies.

---

### Description

This cmdlet modifies settings of Linux backup proxy servers.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRViProxy](Get-VBRViProxy)

---

### Examples
> Modifying Number of Concurrent Tasks

$proxy = Get-VBRViProxy -Name "LinProxy"
Set-VBRViLinuxProxy -Proxy $proxy -MaxTasks 4
This example shows how to modify a number of concurrent tasks for the Linux server.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Set-VBRViLinuxProxy cmdlet. Set the $proxy variable as the Proxy parameter value. Specify the MaxTasks parameter value.

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
Specifies a description of a Linux backup proxy.

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
Enables VM data transportation over an encrypted SSL connection in the Network transport mode. Default: False.

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

#### **Proxy**
Specifies a Linux backup proxy. The cmdlet will modify the settings of this backup proxy.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CViProxy]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ProxyVM**
Specifies a Linux VM that is added to the VMware environment. The cmdlet will assign a backup proxy role explicitly to this Linux VM.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CViVmItem]`|false   |named   |False        |

#### **TransportMode**
Specifies a data transport mode that the Linux proxy will apply to retrieve VM data from the source and write VM data to the target. You can specify one of the following transport mode type:
Specifies the transport mode used by the backup proxy: - Auto: Use this option to set the automatic proxy selection mode.
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
Veeam.Backup.Core.CViProxy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViLinuxProxy [-ConnectedDatastoreMode {Auto | Manual}] [-Datastore <VBRViDatastore[]>] [-Description <String>] [-EnableFailoverToNBD] [-EnableHostToProxyEncryption] [-Force] [-MaxTasks <Int32>] -Proxy 
```
```PowerShell
<CViProxy> [-ProxyVM <CViVmItem>] [-TransportMode {Auto | DirectStorageAccess | HotAdd | Nbd}] [<CommonParameters>]
```
