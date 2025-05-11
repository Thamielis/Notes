Set-VBRDiscoveredComputerUpdate
-------------------------------

### Synopsis
Assigns Veeam Agent private fixes to discovered computers.

---

### Description

This cmdlet assigns Veeam Agent private fixes to selected discovered computers. You can use this cmdlet to instruct Veeam Backup & Replication to send specified private fixes only to the associated discovered computers.
If you configured protection group deployment settings to automatically upgrade Veeam Agents, Veeam Backup & Replication will send private fixes from the distribution server to discovered computers and install them at the next scheduled discovery operation.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

* [Get-VBRDiscoveredComputerUpdate](Get-VBRDiscoveredComputerUpdate)

---

### Examples
> Example 1. Assigning Private Fix to Discovered Computers of Protection Group

$group = Get-VBRProtectionGroup -Name "Support_East"
$discovered = Get-VBRDiscoveredComputer -ProtectionGroup $group
$fix = Get-VBRDiscoveredComputerUpdate -Id "188235"
Set-VBRDiscoveredComputerUpdate -DiscoveredComputer $discovered -Update $fix -PassThru

Id                      : 188235
AgentType               : Windows
AgentVersion            : 2.1.10.304
OperatingSystemPlatform : Unknown
OperatingSystemVersion  :
Path                    : C:\Program Files\Veeam\Veeam Distribution Service\Fixes\VAW\kb.188235
AppliedTo               : {81a586bd-efc7-4280-8591-2bed0b43296f, 38d778f1-1906-44b0-871a-1db9097581a8}
Name                    : VAW.kb.188235.exe
This example shows how to assign a private fix to discovered computers of a protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Save the result to the $discovered variable.
3. Run the Get-VBRDiscoveredComputerUpdate cmdlet. Specify the Id parameter value. Save the result to the $fix variable.
4. Run the Set-VBRDiscoveredComputerUpdate cmdlet. Set the $discovered variable as the DiscoveredComputer parameter value. Set the $fix variable as the Update parameter value. Provide the PassThru parameter.
> Example 2. Removing Association Between Private Fix and Discovered Computers

$fix = Get-VBRDiscoveredComputerUpdate -Id "188235"
Set-VBRDiscoveredComputerUpdate -Update $fix -PassThru

Id                      : 188235
AgentType               : Windows
AgentVersion            : 2.1.10.304
OperatingSystemPlatform : Unknown
OperatingSystemVersion  :
Path                    : C:\Program Files\Veeam\Veeam Distribution Service\Fixes\VAW\kb.188235
AppliedTo               : {}
Name                    : VAW.kb.188235.exe
This example shows how to remove association between a private fix and discovered computers.
Perform the following steps:
1. Run the Get-VBRDiscoveredComputerUpdate cmdlet. Specify the Id parameter value. Save the result to the $fix variable.
2. Run the Set-VBRDiscoveredComputerUpdate cmdlet. Set the $fix variable as the Update parameter value. Provide the PassThru parameter.

---

### Parameters
#### **DiscoveredComputer**
Specifies the array of discovered computers. The cmdlet will assign private fixes to these computers.

|Type                       |Required|Position|PipelineInput        |
|---------------------------|--------|--------|---------------------|
|`[VBRDiscoveredComputer[]]`|false   |named   |True (ByPropertyName)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Update**
Specifies the array of private fixes. The cmdlet will assign these private fixes to discovered computers.
Note: Every time you run the cmdlet, Veeam Backup & Replication re-assigns selected private fixes to a new set of discovered computers specified by the DiscoveredComputer parameter.
To unassign private fixes from discovered computers, run the cmdlet without the DiscoveredComputer parameter.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputerUpdate[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputerUpdate[]

Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRDiscoveredComputerUpdate [-DiscoveredComputer <VBRDiscoveredComputer[]>] [-PassThru] -Update <VBRDiscoveredComputerUpdate[]> [<CommonParameters>]
```
