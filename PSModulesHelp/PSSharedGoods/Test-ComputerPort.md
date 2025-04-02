Test-ComputerPort
-----------------

### Synopsis
Tests the connectivity of a computer on specified TCP and UDP ports.

---

### Description

The Test-ComputerPort function tests the connectivity of a computer on specified TCP and UDP ports. It checks if the specified ports are open and reachable on the target computer.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-ComputerPort -ComputerName "Server01" -PortTCP 80,443 -PortUDP 53 -Timeout 3000
Tests the connectivity of Server01 on TCP ports 80 and 443, UDP port 53 with a timeout of 3000 milliseconds.
```
> EXAMPLE 2

```PowerShell
Test-ComputerPort -ComputerName "Server02" -PortTCP 3389 -PortUDP 123
Tests the connectivity of Server02 on TCP port 3389, UDP port 123 with the default timeout of 5000 milliseconds.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer to test the port connectivity.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |1       |false        |Server |

#### **PortTCP**
Specifies an array of TCP ports to test connectivity.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |2       |false        |

#### **PortUDP**
Specifies an array of UDP ports to test connectivity.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |3       |false        |

#### **Timeout**
Specifies the timeout value in milliseconds for the connection test. Default is 5000 milliseconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

---

### Syntax
```PowerShell
Test-ComputerPort [[-ComputerName] <String[]>] [[-PortTCP] <Int32[]>] [[-PortUDP] <Int32[]>] [[-Timeout] <Int32>] [<CommonParameters>]
```
