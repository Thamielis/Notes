Set-VBRViProxy
--------------

### Synopsis
Modifies a VMware backup proxy.

---

### Description

This cmdlet modifies settings of the selected VMware backup proxy server.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRViProxy](Get-VBRViProxy)

---

### Examples
> Modifying VMware Backup Proxy

$proxy = Get-VBRViProxy -Name "LocalProxy"
Set-VBRViProxy -Proxy $proxy -TransportMode HotAdd -EnableFailoverToNBD
This example shows how to modify the VMware backup proxy named LocalProxy.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Set-VBRViProxy cmdlet. Set the $proxy variable as the Proxy parameter value. Set the HotAdd option for the TransportMode parameter. Provide the EnableFailoverToNBD parameter.

---

### Parameters
#### **ConnectedDatastoreMode**
Specifies the mode that a proxy will use to connect to datastores:
* Auto - Veeam Backup & Replication automatically detects all datastores that allow direct SAN or NFS connection.
* Manual - backup proxy has a direct SAN or NFS connection to datastores in the Datastore list. Use the Datastore parameter to specify the allowed datastores.
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
Specifies a description of a VMware proxy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableFailoverToNBD**
Enables failover to the Network transport mode if a backup proxy fails to transport data using the Direct storage access or Virtual appliance transport mode.
Default: True
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableHostToProxyEncryption**
Enables a VM data transportation over an encrypted SSL connection in the Network transport mode.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MaxTasks**
Specifies the number of concurrent tasks that can be assigned to a proxy simultaneously.
Allowed values: 1-100.
Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Proxy**
Specifies an array of VMware proxies you want to modify.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CViProxy]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.CViProxy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViProxy [-ConnectedDatastoreMode {Auto | Manual}] [-Datastore <VBRViDatastore[]>] [-Description <String>] [-EnableFailoverToNBD] [-EnableHostToProxyEncryption] [-MaxTasks <Int32>] -Proxy <CViProxy> 
```
```PowerShell
[-TransportMode {Auto | DirectStorageAccess | HotAdd | Nbd}] [<CommonParameters>]
```
