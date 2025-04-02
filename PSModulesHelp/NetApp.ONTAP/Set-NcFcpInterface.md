Set-NcFcpInterface
------------------

### Synopsis
Updates an FC interface.

---

### Description

Updates an FC interface.
Disabling an FC interface, Moving an FC interface to a new node and port, Renaming the FC interface. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcFcpInterface](Get-NcFcpInterface)

* [New-NcFcpInterface](New-NcFcpInterface)

* [Remove-NcFcpInterface](Remove-NcFcpInterface)

---

### Examples
> Example 1

Set-NcFcpInterface -HomeNodeName sti9-vsim-ucs387e -HomePortName 1a -Interface new -Vserver vs0 -Comment "Testing"
Move fcp interface 'new' to HomeNodeName 'sti9-vsim-ucs387e'.

InterfaceName                    NodeName                   PortName                   Vserver
-------------                    --------                   --------                   -------
new                                                         20:00:00:50:56:ac:a4:d4    vs0

---

### Parameters
#### **Interface**
The name of the FC interface

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|true    |1       |false        |InterfaceName|

#### **Vserver**
The name of the SVM

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **HomePortName**
The name of the FC port

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HomeNodeName**
The name of the node on which the FC port is located

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Enabled**
The administrative state of the FC interface. The FC interface can be disabled to block all FC communication with the SVM through this interface.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **NewName**
The new name of the FC interface

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Comment**
A user configurable comment

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpInterfaceInfo

---

### Notes
Category: fcp
API: /api/network/fc/interfaces
Family: cluster

---

### Syntax
```PowerShell
Set-NcFcpInterface [-Interface] <String> [-Vserver] <String> [-HomePortName <String>] [-HomeNodeName <String>] [<CommonParameters>]
```
```PowerShell
Set-NcFcpInterface [-Interface] <String> [-Vserver] <String> [-Enabled <Boolean>] [<CommonParameters>]
```
```PowerShell
Set-NcFcpInterface [-Interface] <String> [-Vserver] <String> [-NewName <String>] [<CommonParameters>]
```
