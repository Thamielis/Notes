Get-NetPrefixPolicy
-------------------

### Synopsis
Gets the prefix policy.

---

### Description

The Get-NetPrefixPolicy cmdlet gets the prefix policy. A computer uses a prefix policy to select source and destination addresses. A prefix policy establishes selection criteria based on the precedence of destination addresses and on labels that are attached to source addresses. For more information, see RFC 3484.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=288387)

---

### Examples
> Example 1: Get a prefix policy

```PowerShell
PS C:\>Get-NetPrefixPolicy
This command gets the prefix policy on the computer on which you run the command.
```
> Example 2: Get a prefix policy by precedence

```PowerShell
PS C:\>Get-NetPrefixPolicy –Precedence 1
This command gets the prefix policy that has a precedence of 1.
```

---

### Parameters
#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **Label**
Specifies an array of labels for a prefix policy. A label value identifies a preference for a particular source address prefix in conjunction with a destination address prefix.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **Precedence**
Specifies an array of precedence values. A precedence value identifies a value that is used to sort destination addresses.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt32[]]`|false   |named   |false        |

#### **Prefix**
Specifies an array of prefixes. A prefix identifies the IP address prefix that is used to select source and destination addresses.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

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
* Microsoft.Management.Infrastructure.CimInstance#root\StandardCimv2\MSFT_NetPrefixPolicy

---

### Syntax
```PowerShell
Get-NetPrefixPolicy [[-Prefix] <String[]>] [-CimSession <CimSession[]>] [-Label <UInt32[]>] [-Precedence <UInt32[]>] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
