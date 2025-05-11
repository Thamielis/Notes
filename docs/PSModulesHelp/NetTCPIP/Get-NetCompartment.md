Get-NetCompartment
------------------

### Synopsis
Gets all network compartments in the protocol stack.

---

### Description

The Get-NetCompartment cmdlet gets network compartments in the protocol stack. You can specify the ID of a compartment to get. If you do not specify the CompartmentId parameter, the cmdlet gets all compartments in the protocol stack.

---

### Related Links
* [Online Version:](http://go.microsoft.com/fwlink/?LinkId=313145)

* [Set-NetIPInterface](Set-NetIPInterface)

---

### Examples
> Example 1: Get a network compartment on the local host

```PowerShell
PS C:\>Find-NetCompartment -CompartmentId 1
CompartmentId          : 1
CompartmentDescription : Default Compartment
CompartmentGuid        : {b1062982-2b18-4b4f-b3d5-a78ddb9cdd49}
This command gets the network compartment that has the ID 1.
```

---

### Parameters
#### **CimSession**
Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.

|Type            |Required|Position|PipelineInput|Aliases|
|----------------|--------|--------|-------------|-------|
|`[CimSession[]]`|false   |named   |false        |Session|

#### **CompartmentId**
Specifies an array of identifiers of compartments.

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

---

### Outputs
* 

---

### Syntax
```PowerShell
Get-NetCompartment [-CimSession <CimSession[]>] [-CompartmentId <UInt32[]>] [-ThrottleLimit <Int32>] [<CommonParameters>]
```
