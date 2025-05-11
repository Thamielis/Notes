Get-Computer
------------

### Synopsis
Retrieves various information about a computer or server based on specified types.

---

### Description

This function retrieves information about a computer or server based on the specified types. It can gather details about applications, BIOS, CPU, RAM, Disk, Logical Disk, Network, Network Firewall, Operating System, Services, System, Startup, Time, and Windows Updates.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Computer -ComputerName "Server01" -Type "CPU", "RAM"
Retrieves CPU and RAM information from a remote server named Server01.
```
> EXAMPLE 2

```PowerShell
Get-Computer -ComputerName "Workstation01" -Type "Application" -AsHashtable
Retrieves application information from a workstation named Workstation01 and returns the output as a hashtable.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer or server to retrieve information from. Defaults to the local computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Type**
Specifies the types of information to retrieve. Valid values include 'Application', 'BIOS', 'CPU', 'RAM', 'Disk', 'DiskLogical', 'Network', 'NetworkFirewall', 'OperatingSystem', 'Services', 'System', 'Startup', 'Time', and 'WindowsUpdates'. If not specified, retrieves all available types.
Valid Values:

* Application
* BIOS
* CPU
* RAM
* Disk
* DiskLogical
* Network
* NetworkFirewall
* OperatingSystem
* Services
* System
* Startup
* Time
* WindowsUpdates

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **AsHashtable**
Indicates whether to return the output as a hashtable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-Computer [[-ComputerName] <String[]>] [[-Type] <String[]>] [-AsHashtable] [<CommonParameters>]
```
