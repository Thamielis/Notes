Set-VBRAdvancedLatencyOptions
-----------------------------

### Synopsis
Modifies latency settings for a specific datastore.

---

### Description

This cmdlet modifies latency settings for a specific datastore.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Get-VBRAdvancedLatencyOptions](Get-VBRAdvancedLatencyOptions)

---

### Examples
> Modifying I/O Latency Limit of New Tasks for Datastore

$server = Get-VBRServer -Name esx06.tech.local
$datastore = Find-VBRViDatastore -Server $server
$options = Get-VBRAdvancedLatencyOptions -ViDatastore $datastore -LatencyLimitMs 50
Set-VBRAdvancedLatencyOptions -Options $options -LatencyLimitMs 100
This example shows how to modify the I/O latency limit of new tasks that are targeted at the VMware datastore from 50 ms to 100 ms.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViDatastore cmdlet. Set the $server variable as the Server parameter value. Save the result to the $datastore variable.
3. Run the Get-VBRAdvancedLatencyOptions cmdlet. Set the $datastore variable as the ViDatastore parameter value. Specify the LatencyLimitMs parameter values. Save the result to the $options variable.
4. Run the Set-VBRAdvancedLatencyOptions cmdlet. Set the $options variable as the Options parameter value. Specify the LatencyLimitMs parameter value.

---

### Parameters
#### **LatencyLimitMs**
Specifies the I/O latency limit at which Veeam Backup & Replication will not assign new tasks that are targeted at the datastore.
Default: 20 ms.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Options**
Specifies the datastore latency settings that you want to remove.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRAdvancedLatencyOptions]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ThrottlingIOLimitMs**
Specifies the I/O latency speed limit.
When Veeam Backup & Replication reaches this limit, it will decrease the speed at which it either gets data from a datastore or writes data to it.
Default: 30 ms.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAdvancedLatencyOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAdvancedLatencyOptions [-LatencyLimitMs <Int32>] -Options <VBRAdvancedLatencyOptions> [-ThrottlingIOLimitMs <Int32>] [<CommonParameters>]
```
