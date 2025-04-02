Set-NcStoragePort
-----------------

### Synopsis
Updates a storage port

---

### Description

Updates a storage port.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcStoragePort](Get-NcStoragePort)

* [Enable-NcStoragePort](Enable-NcStoragePort)

* [Disable-NcStoragePort](Disable-NcStoragePort)

---

### Examples
> Example 1

```PowerShell
Set-NcStoragePort -Node stiA400-689 -Port e0c -Mode storage
Node                       : stiA400-689
Port                       : e0c
Mode                       : storage
BoardName                  :
CableEndId                 :
CableIdentifier            :
CableLength                : 2m
ConnectionMode             :
ConnectorCapabilitiesArray :
ConnectorPartNumber        : 112-00574
ConnectorSerialNumber      : APF19499177578
ConnectorTechnology        :
ConnectorType              :
ConnectorVendor            :
CorrectiveAction           :
DateCode                   :
Description                : Dual 40G/100G Ethernet Controller CX5
ErrorSeverity              :
ErrorText                  :
ErrorType                  :
FirmwareRev                : 16.26.4012
MfgPartNumber              :
NcController               : 172.16.29.170
NvdataRev                  :
PartNumber                 :
Phys                       :
PortSpeed                  : 100
PortType                   : enet
SerialNumber               :
State                      : True
Status                     : online
Wwn                        :
Wwnn                       :
Wwpn                       :
MacAddress                 : d0:39:ea:9b:de:c3
Redundant                  : True
InUse                      : True

```

---

### Parameters
#### **Node**
Name of Node

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |0       |true (ByPropertyName)|NodeName|

#### **Port**
Name of the Port to modify

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Mode**
Mode of the Port
Valid Values:

* network
* storage

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StoragePort.StoragePortInfo

---

### Notes
Category: StoragePort
Api: storage/ports/{node.uuid}/ports
Family: Controller

---

### Syntax
```PowerShell
Set-NcStoragePort [-Node] <String> [-Port] <String> [-Mode] <String> [<CommonParameters>]
```
