Remove-VBRAdvancedLatencyOptions
--------------------------------

### Synopsis
Removes datastore latency settings from Veeam Backup & Replication settings.

---

### Description

This cmdlet removes datastore latency settings from Veeam Backup & Replication general settings.

---

### Related Links
* [Get-VBRAdvancedLatencyOptions](Get-VBRAdvancedLatencyOptions)

---

### Examples
> Removing Datastore Latency Settings

$latency = Get-VBRAdvancedLatencyOptions
Remove-VBRAdvancedLatencyOptions -Options $latency
This example shows how to remove datastore latency settings from Veeam Backup & Replication general settings.
Perform the following steps:
1. Run the Get-VBRAdvancedLatencyOptions cmdlet. Save the result to the $latency variable.
2. Run the Remove-VBRAdvancedLatencyOptions cmdlet. Set the $latency variable as the Options parameter value.

---

### Parameters
#### **Options**
Specifies the datastore latency settings that you want to remove.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRAdvancedLatencyOptions]`|true    |named   |True (ByPropertyName, ByValue)|

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
Remove-VBRAdvancedLatencyOptions -Options <VBRAdvancedLatencyOptions> [<CommonParameters>]
```
