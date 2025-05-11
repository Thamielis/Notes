Get-NetUDPSetting
-----------------

### Synopsis
Gets UDP settings.

---

### Description

The Get-NetUDPSetting cmdlet gets UDP settings for the IP interface. The cmdlet gets the starting port and the number of ports for a dynamic port range that the IP interface uses to send and receive UDP traffic. Use this cmdlet with the Set-NetUDPSetting to specify a dynamic port range to modify. If you do not specify any parameters, the cmdlet gets all dynamic port ranges for UDP from the IP interface.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288393)

* [Get-NetTransportFilter](Get-NetTransportFilter)

* [Set-NetTCPSetting](Set-NetTCPSetting)

* [Set-NetUDPSetting](Set-NetUDPSetting)

---

### Examples
> Example 1: Get all dynamic port ranges for UDP

```PowerShell
PS C:\>Get-NetUDPSetting
This command gets all UDP settings. The command gets all dynamic port ranges for UDP from the IP interface.
```

---

### Parameters
#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DynamicPortRangeNumberOfPorts**
Specifies an array of values for the number of ports for a dynamic port range that starts from the port that you specify for the DynamicPortRangeStartPort parameter. The cmdlet gets the UDP settings that have these values.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |2       |false        |

#### **DynamicPortRangeStartPort**
Specifies an array of values for the starting port of the dynamic port range. The cmdlet gets the UDP settings that have these values. The acceptable values for this parameter are: 1 through 65535.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt16[]]`|false   |1       |false        |

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
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetUDPSetting

---

### Syntax
```PowerShell
Get-NetUDPSetting [[-DynamicPortRangeStartPort] <UInt16[]>] [[-DynamicPortRangeNumberOfPorts] <UInt16[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
