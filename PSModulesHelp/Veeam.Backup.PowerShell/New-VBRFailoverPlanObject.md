New-VBRFailoverPlanObject
-------------------------

### Synopsis
Creates the VBRFailoverPlanObject object.

---

### Description

This cmdlet creates the VBRFailoverPlanObject object.
This object contains the VM that you want to add to a failover plan. It is used then in the Add-VBRFailoverPlan cmdlet.

You must create the VBRFailoverPlanObject object for each VM that you want to add to the failover plan. For each VM, you can set the boot order and the delay time.
- The boot order indicates the order in which the VMs will start by the failover plan. Make sure you set the dependent VMs to start after the VMs they depend on.
- The delay time is an interval between each VM start. Use delay intervals to make sure that some VMs are already running at the moment the dependent VMs start.

---

### Examples
> Example 1

$DNS = Find-VBRViEntity -Name "DNSServer" | New-VBRFailoverPlanObject -BootDelay 0
$MSExchange01 = Find-VBRViEntity -Name "MS_Exchange_Server_01" | New-VBRFailoverPlanObject -BootOrder 1  -BootDelay 180
$MSExchange02 = Find-VBRViEntity -Name "MS_Exchange_Server_02" | New-VBRFailoverPlanObject -BootOrder 2  -BootDelay 120
This example shows how to create three VBRFailoverPlanObject objects for the group of mail servers: a DNS server and two Microsoft Exchange servers. The DNS server starts first followed by the two Microsoft Exchange servers started with a delay.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootDelay parameter value. Save the result to the $DNS variable to be used with other cmdlets.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootOrder and BootDelay parameter values. Save the result to the $MSExchange01 variable to be used with other cmdlets.
3. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootOrder and BootDelay parameter values. Save the result to the $MSExchange02 variable to be used with other cmdlets.
> Example 2

$vm1 = Find-VBRViEntity -Name "MS_Exchange_Server_01"
$MSExchange01 = New-VBRFailoverPlanObject -Vm $vm1 -BootOrder 1 -BootDelay 180
This example shows how to create the VBRFailoverPlanObject objects for the MS_Exchange_Server_01 server.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm1 variable.
2. Run the New-VBRFailoverPlanObject cmdlet. Specify the following settings:
- Set the $vm1 variable as the Vm parameter value.
- Specify the BootOrder parameter value.
- Specify the BootDelay parameter value.
- Save the result to the $MSExchange01 variable to be used with other cmdlets.

---

### Parameters
#### **BootDelay**
Specifies the delay time for the VM to boot.
The delay time is set in seconds.
If omitted, the delay time will be set to 60 sec by default.
If you set boot delay to '0' to a number of VMs, these VMs will start simultaneously.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **BootOrder**
Specifies the order number by which the VM will boot.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the replica that you want to add to the cloud failover plan.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Vm**
Specifies the VM you want to add to the failover plan.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[IItem]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

Veeam.Backup.Common.IItem

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRFailoverPlanObject [-BootDelay <Int32>] [-BootOrder <Int32>] -RestorePoint <COib> [<CommonParameters>]
```
```PowerShell
New-VBRFailoverPlanObject [-BootDelay <Int32>] [-BootOrder <Int32>] -Vm <IItem> [<CommonParameters>]
```
