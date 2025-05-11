Get-NetUDPEndpoint
------------------

### Synopsis
Gets current UDP endpoint statistics.

---

### Description

The Get-NetUDPEndpoint cmdlet gets current statistics for a UDP endpoint. The cmdlet returns UDP end point properties, such as local and remote UDP ports. If you do not specify any parameters, the cmdlet gets statistics for all UDP end points.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288392)

* [Get-NetUDPSetting](Get-NetUDPSetting)

* [Get-NetUDPEndpoint](Get-NetUDPEndpoint)

---

### Examples
> Example 1: Get statistics for all UDP endpoints

```PowerShell
PS C:\>Get-NetUDPEndpoint
This example gets current statistics for all UDP endpoints.
```
> Example 2: Get statistics for UDP traffic

```PowerShell
PS C:\>Get-NetUDPEndpoint –LocalAddress 127.0.0.1
This command gets statistics for recent UDP traffic that was sent and received on the IPv4 loopback address.
```

---

### Parameters
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
Specifies an array of local IP addresses. The cmdlet gets the UDP endpoint statistics that have these values.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |1       |true (ByPropertyName)|IPAddress|

#### **LocalPort**
Specifies an array of local ports. The cmdlet gets the UDP endpoint statistics that have these values.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |2       |false        |

#### **OwningProcess**
Specifies the PID of the owning process of a bound UDP socket.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

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
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetUDPEndpoint

---

### Syntax
```PowerShell
Get-NetUDPEndpoint [[-LocalAddress] <String[]>] [[-LocalPort] <UInt16[]>] [-CimSession <CimSession[]>] [-CreationTime <DateTime[]>] [-OwningProcess <UInt32[]>] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
