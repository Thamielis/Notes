Start-VBRPingTest
-----------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **IcmpEchoReplyTimeout**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetryTimeout**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Ttl**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **VirtualLab**

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ISbVirtualLab]`|false   |named   |False        |

#### **Vm**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[IItem]`|true    |named   |False        |

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
Start-VBRPingTest [-IcmpEchoReplyTimeout <Int32>] [-RetryCount <Int32>] [-RetryTimeout <Int32>] [-Ttl <Int32>] [-VirtualLab <ISbVirtualLab>] -Vm <IItem> [<CommonParameters>]
```
