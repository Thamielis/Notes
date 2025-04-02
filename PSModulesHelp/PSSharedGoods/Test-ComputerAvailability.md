Test-ComputerAvailability
-------------------------

### Synopsis
Tests the availability of specified servers using various methods.

---

### Description

This function tests the availability of specified servers by performing ping, WinRM, and port open tests. It provides detailed information about the availability status of each server.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-ComputerAvailability -Servers "Server1", "Server2" -Test Ping+WinRM
Tests the availability of Server1 and Server2 using both ping and WinRM methods.
```
> EXAMPLE 2

```PowerShell
Test-ComputerAvailability -Servers "Server3" -Test PortOpen -Ports 80,443 -PortsTimeout 200
Tests the availability of Server3 by checking if ports 80 and 443 are open within a timeout of 200 milliseconds.
```

---

### Parameters
#### **Servers**
Specifies an array of server names to test.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Test**
Specifies the type of tests to perform. Valid values are 'All', 'Ping', 'WinRM', 'PortOpen', 'Ping+WinRM', 'Ping+PortOpen', 'WinRM+PortOpen'. Default is 'All'.
Valid Values:

* All
* Ping
* WinRM
* PortOpen
* Ping+WinRM
* Ping+PortOpen
* WinRM+PortOpen

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Ports**
Specifies an array of TCP ports to test for port open. Default is 135.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |3       |false        |

#### **PortsTimeout**
Specifies the timeout value (in milliseconds) for testing port open. Default is 100.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **PingCount**
Specifies the number of ping attempts to make. Default is 1.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

---

### Syntax
```PowerShell
Test-ComputerAvailability [[-Servers] <String[]>] [[-Test] <Object>] [[-Ports] <Int32[]>] [[-PortsTimeout] <Int32>] [[-PingCount] <Int32>] [<CommonParameters>]
```
