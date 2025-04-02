Get-VBRCDPTaskSession
---------------------

### Synopsis
Returns VMs processed during CDP policy sessions.

---

### Description

This cmdlet returns VMs performed during CDP policy sessions.

---

### Related Links
* [Get-VBRCDPPolicy](Get-VBRCDPPolicy)

* [Get-VBRCDPSession](Get-VBRCDPSession)

---

### Examples
> Example 1. Getting VMs Processed During Specific CDP Policy Session

$policy = Get-VBRCDPPolicy -Name "VM079"
$session Get-VBRCDPSession -Job $policy -Last
Get-VBRCDPTaskSession -Session $session
This example shows how to get VMs processed during the CDP policy session.
Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $policy variable.
2. Run the Get-VBRCDPSession cmdlet. Set the $policy variable as the Job parameter value. Provide the Last parameter. Save the result to the $session variable.
3. Run the Get-VBRCDPTaskSession cmdlet. Set the $session variable as the Session parameter value.
> Example 2. Getting VMs Processed During CDP Policy Session by Session ID

```PowerShell
Get-VBRCDPTaskSession -Id "402e082c-4a6d-4a9b-86c8-3330f35e9773"
This command returns the VMs processed during the 402e082c-4a6d-4a9b-86c8-3330f35e9773 CDP policy session.
```
> Example 3. Getting VM Processed During CDP Policy Session by VMs ID

Get-VBRCDPTaskSession -ObjectId "15e56946-b75c-444a-9022-99f15ee0b9a2
This command returns the 15e56946-b75c-444a-9022-99f15ee0b9a2 VM processed during a CDP policy session.
> Example 4. Getting Last VM Processed During CDP Policy Session

```PowerShell
Get-VBRCDPTaskSession -Last
This command returns the last VMs processed during a CDP policy session.
```

---

### Parameters
#### **Id**
Specifies an ID of a session that you want to get.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Guid]`|false   |named   |True (ByPropertyName)|

#### **Last**
Defines that the cmdlet will return the last VMs that were processed during a CDP policy session.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObjectId**
Specifies an ID of VMs that processed during a CDP policy session.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |False        |

#### **ObjectName**
Specifies a name of VMs that processed during a CDP policy session.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Session**
Specifies a CDP policy session that processes VMs. The cmdlt will return these VMs.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRCDPSession]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid

Veeam.Backup.PowerShell.Infos.VBRCDPSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCDPTaskSession [-Id <Guid>] [<CommonParameters>]
```
```PowerShell
Get-VBRCDPTaskSession [-Last] -Session <VBRCDPSession> [<CommonParameters>]
```
```PowerShell
Get-VBRCDPTaskSession [-Last] [-ObjectId <Guid>] [<CommonParameters>]
```
```PowerShell
Get-VBRCDPTaskSession [-Last] [-ObjectName <String>] [<CommonParameters>]
```
