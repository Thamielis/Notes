New-NcFcpInterface
------------------

### Synopsis
Creates an FC interfaces.Fibre Channel (FC) interfaces are the logical endpoints for FC network connections to an SVM. An FC interface provides FC access to storage within the interface SVM using either Fibre Channel Protocol (FCP) or NVMe over FC (NVMe/FC).

---

### Description

Creates an FC interfaces.Fibre Channel (FC) interfaces are the logical endpoints for FC network connections to an SVM. An FC interface provides FC access to storage within the interface SVM using either Fibre Channel Protocol (FCP) or NVMe over FC (NVMe/FC). This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcFcpInterface](Get-NcFcpInterface)

* [Remove-NcFcpInterface](Remove-NcFcpInterface)

---

### Examples
> Example 1

```PowerShell
New-NcFcpInterface -Interface fcp_lif_1 -DataProtocol fcp -Vserver vs0 -HomePortName 1a -HomeNodeName sti11-vsim-ucs573z -Enabled $true -Comment Cmnt
DataProtocol            : fcp
Vserver                 : vs0
Enabled                 : True
Comment                 : Cmnt
CurrentNode             : sti11-vsim-ucs573z
CurrentPort             : 1a
InterfaceName           : fcp_lif_1
NcController            : 10.234.38.181
NodeName                :
PortAddress             : 4a4fedba
PortName                : 20:08:00:50:56:a7:a9:f5
RelativePortId          :
Recommend               :
Statistics              :
Metric                  :
Location                : DataONTAP.C.Types.Fcp.Location
State                   : down
Wwnn                    :
Uuid                    : 4642a70a-e588-11ec-9f3d-005056a77908
RelativePortIdSpecified : False

```
> Example 2(With port Uuid Only)

```PowerShell
New-NcFcpInterface -Interface abc -DataProtocol fcp -Vserver vs0 -HomePortUuid 634dc00c-d79f-11ec-9f3c-005056a77908
DataProtocol            : fcp
Vserver                 : vs0
Enabled                 : True
Comment                 :
CurrentNode             : sti11-vsim-ucs573y
CurrentPort             : 1a
InterfaceName           : abc
NcController            : 10.234.38.181
NodeName                :
PortAddress             : 280021df
PortName                : 20:06:00:50:56:a7:a9:f5
RelativePortId          :
Recommend               :
Statistics              :
Metric                  :
Location                : DataONTAP.C.Types.Fcp.Location
State                   : down
Wwnn                    :
Uuid                    : e892bff7-e256-11ec-9f3d-005056a77908
RelativePortIdSpecified : False

```

---

### Parameters
#### **Interface**
Name of the Destination.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |0       |true (ByPropertyName)|InterfaceName|

#### **DataProtocol**
The data protocol for which the FC interface is configured.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
The name of svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **HomePortName**
The name of port.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **HomeNodeName**
The name of home node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **HomePortUuid**
Home port uuid

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Enabled**
The administrative state of the FC interface..

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[bool]`|false   |named   |true (ByPropertyName)|

#### **Comment**
A user configurable comment.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpInterfaceInfo

---

### Notes
Category: fcp
Api: api/network/fc/interfaces
Family: Controller

---

### Syntax
```PowerShell
New-NcFcpInterface [-Interface] <String> [-DataProtocol] <String> [-Vserver] <String> [-HomePortName] <String> [-HomeNodeName] <String> [-Enabled <bool>] [-Comment] <String> 
```
```PowerShell
[<CommonParameters>]
```
