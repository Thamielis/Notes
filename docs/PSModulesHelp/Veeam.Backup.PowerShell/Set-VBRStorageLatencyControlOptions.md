Set-VBRStorageLatencyControlOptions
-----------------------------------

### Synopsis
Modifies storage latency control settings on the production datastores.

---

### Description

This cmdlet modifies storage latency control settings on the production datastores.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Examples
> Example 1. Modifying I/O Latency Tasks Limit

```PowerShell
Set-VBRStorageLatencyControlOptions -LatencyLimitMs 50
This command sets the I/O latency limit of new tasks that are targeted at the datastore to 50 ms.
```
> Example 2. Modifying I/O Latency Speed Limit

```PowerShell
Set-VBRStorageLatencyControlOptions -ThrottlingIOLimitMs 40
This command sets the I/O latency speed limit to 40 ms.
```

---

### Parameters
#### **LatencyLimitMs**
Specifies the I/O latency limit at which Veeam Backup & Replication will not assign new tasks that are targeted at the datastore.
Default: 20 ms.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ThrottlingIOLimitMs**
Specifies the I/O latency speed limit.
When Veeam Backup & Replication reaches this limit, it will decrease the speed at which it either gets data from a datastore or writes data to it.
Default: 30 ms.

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
Set-VBRStorageLatencyControlOptions [-LatencyLimitMs <Int32>] [-ThrottlingIOLimitMs <Int32>] [<CommonParameters>]
```
