Set-VBRViVirtualMachineConfiguration
------------------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **PrepareDc**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ReIpRule**

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRViReplicaReIpRule[]]`|false   |named   |False        |

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SourceNetwork**

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|true    |named   |False        |

#### **TargetNetwork**

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|true    |named   |False        |

#### **VirtualLab**

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ISbVirtualLab]`|true    |named   |False        |

#### **Vm**

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CViVmItem]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Infrastructure.CViVmItem

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViVirtualMachineConfiguration [-PrepareDc] [-ReIpRule <VBRViReplicaReIpRule[]>] [-RunAsync] -SourceNetwork <VBRViNetworkInfo[]> -TargetNetwork <VBRViNetworkInfo[]> -Vm <CViVmItem> [<CommonParameters>]
```
```PowerShell
Set-VBRViVirtualMachineConfiguration [-PrepareDc] [-ReIpRule <VBRViReplicaReIpRule[]>] [-RunAsync] -VirtualLab <ISbVirtualLab> -Vm <CViVmItem> [<CommonParameters>]
```
