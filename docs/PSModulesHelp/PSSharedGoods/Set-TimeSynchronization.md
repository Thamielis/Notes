Set-TimeSynchronization
-----------------------

### Synopsis
Configures time synchronization settings on the local machine.

---

### Description

This function sets up time synchronization on the local machine by configuring the time source, server type, NTP settings, and time correction parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-TimeSynchronization -TimeSource 'time.windows.com' -MaxPosPhaseCorrection 86400 -MaxnegPhaseCorrection 86400 -PollInterval 1800
Configures time synchronization using default settings.
```
> EXAMPLE 2

```PowerShell
Set-TimeSynchronization -TimeSource 'pool.ntp.org' -MaxPosPhaseCorrection 43200 -MaxnegPhaseCorrection 43200 -PollInterval 3600
Configures time synchronization with a different time source and shorter time correction limits.
```

---

### Parameters
#### **TimeSource**
Specifies the time source to synchronize with. Default is 'time.windows.com'.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **MaxPosPhaseCorrection**
Specifies the maximum positive time correction in seconds. Default is 86400 seconds (24 hours).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **MaxnegPhaseCorrection**
Specifies the maximum negative time correction in seconds. Default is 86400 seconds (24 hours).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **PollInterval**
Specifies the poll interval in seconds. Default is 1800 seconds (30 minutes).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

---

### Syntax
```PowerShell
Set-TimeSynchronization [[-TimeSource] <String[]>] [[-MaxPosPhaseCorrection] <Int32>] [[-MaxnegPhaseCorrection] <Int32>] [[-PollInterval] <Int32>] [<CommonParameters>]
```
