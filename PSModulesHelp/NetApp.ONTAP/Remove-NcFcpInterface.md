Remove-NcFcpInterface
---------------------

### Synopsis
Deletes an FC interface.

---

### Description

Deletes an FC interface 

Note: The FC interface must be disabled before being deleted. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcFcpInterface](Get-NcFcpInterface)

* [New-NcFcpInterface](New-NcFcpInterface)

* [Set-NcFcpInterface](Set-NcFcpInterface)

---

### Examples
> Example 1

```PowerShell
Remove-NcFcpInterface new vs0
Deletes fc interface 'new'.
```

---

### Parameters
#### **Interface**
The name of the FC interface.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|true    |1       |false        |InterfaceName|

#### **Vserver**
The name of the SVM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: fcp
Api: /api/network/fc/interfaces
Family: cluster

---

### Syntax
```PowerShell
Remove-NcFcpInterface [-Interface] <String> [-Vserver] <String> [<CommonParameters>]
```
