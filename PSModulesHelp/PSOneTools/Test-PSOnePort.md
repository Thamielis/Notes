Test-PSOnePort
--------------

### Synopsis
Tests a network port on a remote computer

---

### Description

Tests whether a port on a remote computer is responding.

---

### Related Links
* [https://powershell.one/tricks/network/porttest](https://powershell.one/tricks/network/porttest)

---

### Examples
> EXAMPLE 1

```PowerShell
Test-PSOnePort -ComputerName 127.0.0.1 -Port 4000 -Timeout 1000 
Tests whether port 4000 on the local computer is responding, 
and waits a maximum of 1000 milliseconds
```
> EXAMPLE 2

```PowerShell
Test-PSOnePort -ComputerName 127.0.0.1 -Port 4000 -Timeout 1000 -Count 30 -Delay 2000
Tests 30 times whether port 4000 on the local computer is responding, 
and waits a maximum of 1000 milliseconds inbetween each test
```
> EXAMPLE 3

```PowerShell
Test-PSOnePort -ComputerName 127.0.0.1 -Port 4000 -Timeout 1000 -Count 0 -Delay 2000 -ExitOnSuccess
Continuously tests whether port 4000 on the local computer is responding, 
waits a maximum of 1000 milliseconds inbetween each test, 
and exits as soon as the port is responding
```

---

### Parameters
#### **ComputerName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Port**
port number to test

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |2       |false        |

#### **Timeout**
timeout in milliseconds

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Count**
number of tries. A value of 0 indicates countinuous testing

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **Delay**
delay (in milliseconds) inbetween continuous tests

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **ExitOnSuccess**
when enabled, function returns as soon as port is available

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Test-PSOnePort [-ComputerName] <String> [-Port] <Int32> [[-Timeout] <Int32>] [[-Count] <Int32>] [[-Delay] <Object>] [-ExitOnSuccess] [<CommonParameters>]
```
