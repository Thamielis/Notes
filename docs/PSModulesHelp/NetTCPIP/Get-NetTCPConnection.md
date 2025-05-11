Get-NetTCPConnection
--------------------

### Synopsis
Gets TCP connections.

---

### Description

The Get-NetTCPConnection cmdlet gets current TCP connections. Use this cmdlet to view TCP connection properties such as local or remote IP address, local or remote port, and connection state.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkID=288389)

---

### Examples
> Example 1: Get all connections

```PowerShell
PS C:\>Get-NetTCPConnection
This command gets all current TCP connections.
```
> Example 2: Get established connections

```PowerShell
PS C:\>Get-NetTCPConnection –State Established
This command gets all TCP connections that have an Established state.
```
> Example 3: Get Internet TCP connections

```PowerShell
PS C:\>Get-NetTCPConnection –AppliedSetting Internet
This command gets all TCP connections that use a TCP applied setting of Internet.
```

---

### Parameters
#### **AppliedSetting**
Specifies an array of values of applied settings. The cmdlet gets connections that match the settings that you specify. The acceptable values for this parameter are:
-- Internet
-- Datacenter
-- Compat
-- Custom
Valid Values:

* Internet
* Datacenter
* Compat
* DatacenterCustom
* InternetCustom

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[AppliedSetting[]]`|false   |named   |false        |

#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **CreationTime**
Specifies an array of DateTime objects. To get a DateTime object, use the Get-Date cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[DateTime[]]`|false   |named   |false        |

#### **LocalAddress**
Specifies an array of local IP addresses. The cmdlet gets connections for the addresses that you specify.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |1       |true (ByPropertyName)|IPAddress|

#### **LocalPort**
Specifies an array of local ports. The cmdlet gets connections for the ports that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |2       |false        |

#### **OffloadState**
Specifies the offload state of a TCP connection.
Valid Values:

* InHost
* Offloading
* Offloaded
* Uploading

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[OffloadState[]]`|false   |named   |false        |

#### **OwningProcess**
Specifies the PID of the owning process of a TCP connection.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **RemoteAddress**
Specifies an array of remote IP addresses. The cmdlet gets connections for the addresses that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **RemotePort**
Specifies an array of remote ports. The cmdlet gets connections for the ports that you specify.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |named   |false        |

#### **State**
Specifies an array of TCP states. The cmdlet gets connections that match the states that you specify. The acceptable values for this parameter are:
-- Closed
-- CloseWait
-- Closing
-- DeleteTCB
-- Established
-- FinWait1
-- FinWait2
-- LastAck
-- Listen
-- SynReceived
-- SynSent
-- TimeWait
Valid Values:

* Closed
* Listen
* SynSent
* SynReceived
* Established
* FinWait1
* FinWait2
* CloseWait
* Closing
* LastAck
* TimeWait
* DeleteTCB
* Bound

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[State[]]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetTCPConnection

---

### Syntax
```PowerShell
Get-NetTCPConnection [[-LocalAddress] <String[]>] [[-LocalPort] <UInt16[]>] [-AppliedSetting <AppliedSetting[]>] [-CimSession <CimSession[]>] [-CreationTime <DateTime[]>] [-OffloadState <OffloadState[]>] [-OwningProcess <UInt32[]>] [-RemoteAddress <String[]>] [-RemotePort <UInt16[]>] [-State <State[]>] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
