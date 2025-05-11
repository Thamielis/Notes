Get-VBRStorageLatencyControlOptions
-----------------------------------

### Synopsis
Returns storage latency control settings on the production datastores.

---

### Description

This cmdlet returns settings of the storage latency control on the production datastores.

---

### Examples
> Getting Settings of Storage Latency Control on Production Datastore

Get-VBRStorageLatencyControlOptions
Enabled LatencyLimitMs ThrottlingIOLimitMs AdvancedOptions
------- -------------- ------------------- ---------------
  False             20                  30 {}
This command returns settings of the storage latency control on the production datastore.
The cmdlet output will contain the following details on the storage latency control: Enable, LatencyLimitMs, ThrottlingIOLimitMs and AdvancedOptions.

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
Get-VBRStorageLatencyControlOptions [<CommonParameters>]
```
