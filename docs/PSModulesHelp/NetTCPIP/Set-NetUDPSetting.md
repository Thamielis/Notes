Set-NetUDPSetting
-----------------

### Synopsis
Modifies UDP settings.

---

### Description

The Set-NetUDPSetting cmdlet modifies UDP settings of the IP interface. Use this cmdlet to change the starting port and the number of ports for the dynamic port range. You can use the InputObject parameter to specify a NetUDPSetting object for the input to this cmdlet. Use the Get-NetUDPSetting to get a NetUDPSetting object.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=289173)

* [Get-NetTransportFilter](Get-NetTransportFilter)

* [Get-NetUDPSetting](Get-NetUDPSetting)

* [Set-NetTCPSetting](Set-NetTCPSetting)

---

### Examples
> Example 1: Modify the dynamic port range for UDP

```PowerShell
PS C:\>Set-NetUDPSetting –DynamicPortRangeStartPort 49152 –DynamicPortRangeNumberOfPorts 1700
This command modifies the port range from which applications can send and receive UDP traffic.
```

---

### Parameters
#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **DynamicPortRangeNumberOfPorts**
Specifies the number of ports for the dynamic port range that starts from the port that you specify for the DynamicPortRangeStartPort parameter. The cmdlet modifies the number of ports to the value you specify.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **DynamicPortRangeStartPort**
Specifies the starting port for the dynamic port range. The cmdlet modifies the value for starting port to the value you specify. This parameter sets the starting port to send and receive UDP traffic. The acceptable values for this parameter are:1 through 65535.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt16]`|false   |named   |false        |

#### **PassThru**
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ThrottleLimit**
Specifies the maximum number of concurrent operations that can be established to run the cmdlet. If this parameter is omitted or a value of 0 is entered, then Windows PowerShell® calculates an optimum throttle limit for the cmdlet based on the number of CIM cmdlets that are running on the computer. The throttle limit applies only to the current cmdlet, not to the session or to the computer.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetPrefixPolicy

The Microsoft.Management.Infrastructure.CimInstance object is a wrapper class that displays Windows Management Instrumentation (WMI) objects. The path after the pound sign (#) provides the namespace and class name for the underlying WMI object.

---

### Outputs
* None

---

### Syntax
```PowerShell
Set-NetUDPSetting [-CimSession <CimSession[]>] [-DynamicPortRangeNumberOfPorts <UInt16>] [-DynamicPortRangeStartPort <UInt16>] [-PassThru] [-ThrottleLimit <Int32>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
