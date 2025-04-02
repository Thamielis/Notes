Set-VBRNetworkTrafficRuleOptions
--------------------------------

### Synopsis
Modifies settings of global network traffic rules.

---

### Description

This cmdlet modifies settings of global network traffic rules.

---

### Examples
> Modifying Settings of Global Network Traffic Rules

```PowerShell
Set-VBRNetworkTrafficRuleOptions -EnableMultipleUploadStreams -StreamsPerJobCount 8
This command enables multithreaded data transfer and sets a number of TCP/IP transfer connection for every job session to 8.
```

---

### Parameters
#### **EnableIPv6**
Enables the IPv4/IPv6 dual stack mode is enabled or disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableMultipleUploadStreams**
Enables multithreaded data transfer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StreamsPerJobCount**
Specifies a number of TCP/IP transfer connection for every job session.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Set-VBRNetworkTrafficRuleOptions [-EnableIPv6] [-EnableMultipleUploadStreams] [-StreamsPerJobCount <Int32>] [<CommonParameters>]
```
