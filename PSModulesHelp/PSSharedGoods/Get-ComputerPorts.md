Get-ComputerPorts
-----------------

### Synopsis
Retrieves TCP connection information from a specified computer.

---

### Description

The Get-ComputerPorts function retrieves information about TCP connections on a specified computer.
It can filter connections based on state, local address, remote address, applied setting, local port, and remote port.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerPorts -ComputerName 'AD1' -LocalPort 389, 636, 88, 53, 3268, 3269, 445, 135 | Sort-Object RemotePort | Format-Table -AutoSize *
Retrieves and displays TCP connection information from the computer 'AD1' for the specified local ports.
```
> EXAMPLE 2

```PowerShell
Get-ComputerPorts -ComputerName 'AD1' -State 'Established' | Sort-Object RemotePort | Format-Table -AutoSize *
Retrieves and displays TCP connection information from the computer 'AD1' for connections in the 'Established' state.
```
> EXAMPLE 3

```PowerShell
Get-ComputerPorts -ComputerName 'AD1' | ft -AutoSize
Retrieves and displays all TCP connection information from the computer 'AD1'.
```

---

### Parameters
#### **ComputerName**
The name of the computer from which to retrieve TCP connection information. If not specified, the local computer is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **State**
The state of the TCP connections to retrieve. Valid states include Bound, Closed, CloseWait, Closing, DeleteTCB, Established, FinWait1, FinWait2, LastAck, Listen, SynReceived, SynSent, and TimeWait.
Valid Values:

* Bound
* Closed
* CloseWait
* Closing
* DeleteTCB
* Established
* FinWait1
* FinWait2
* LastAck
* Listen
* SynReceived
* SynSent
* TimeWait

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **LocalAddress**
The local addresses of the TCP connections to retrieve.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **RemoteAddress**
The remote addresses of the TCP connections to retrieve.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **AppliedSetting**
The applied settings of the TCP connections to retrieve. Valid settings include Compat, Datacenter, DatacenterCustom, Internet, and InternetCustom.
Valid Values:

* Compat
* Datacenter
* DatacenterCustom
* Internet
* InternetCustom

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **LocalPort**
The local ports of the TCP connections to retrieve.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |6       |false        |

#### **RemotePort**
The remote ports of the TCP connections to retrieve.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |7       |false        |

---

### Notes
This function requires administrative privileges to retrieve process information.

---

### Syntax
```PowerShell
Get-ComputerPorts [[-ComputerName] <String>] [[-State] <String[]>] [[-LocalAddress] <String[]>] [[-RemoteAddress] <String[]>] [[-AppliedSetting] <String[]>] [[-LocalPort] <Int32[]>] [[-RemotePort] <Int32[]>] [<CommonParameters>]
```
