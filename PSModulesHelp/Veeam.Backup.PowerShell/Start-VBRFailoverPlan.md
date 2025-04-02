Start-VBRFailoverPlan
---------------------

### Synopsis
Starts failover by failover plan.

---

### Description

This cmdlet starts failover by failover plan. With this cmdlet, you can start a number of failover processes.

---

### Examples
> Example 1

Get-VBRFailoverPlan -Name "MS Exchange Group Failover" | Start-VBRFailoverPlan
This command starts failover process by the MS Exchange Group Failover failover plan. The VMs in the failover group are failed over to the latest restore point.

Perform the following steps:
1. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Start-VBRFailoverPlan cmdlet.
> Example 2

$MSExchangeGroup = Get-VBRFailoverPlan -Name "MS Exchange Group Failover"
Start-VBRFailoverPlan -FailoverPlan $MSExchangeGroup
This example shows how to start failover process by the MS Exchange Group Failover failover plan. The VMs in the failover group are failed over to the latest restore point.

Perform the following steps:
1. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value. Save the result to the $MSExchangeGroup variable.  2. Run the Start-VBRFailoverPlan cmdlet. Set the $MSExchangeGroup variable as the FailoverPlan parameter value.
> Example 3

$date = Get-Date
Get-VBRFailoverPlan -Name "MS Exchange Group Failover", "SQLServers Group Failover" | Start-VBRFailoverPlan -FromDate $date.AddDays(-7) -Wait
This example shows how to start failover processes by the MS Exchange Group Failover and SQLServers Group Failover failover plans. The VMs are failed over to a week ago state. The VM groups are failed over one by one.

Perform the following steps:
1. The date is obtained with the Get-Date command. Save it to the $date variable.
2. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Start-VBRFailoverPlan cmdlet. Set the $date variable as the FromDate parameter value. Provide the Wait parameter.

---

### Parameters
#### **FailoverPlan**
Specifies the array of failover plans you want to start.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRFailoverPlan[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Used for cloud failovers to start full failover after the user's site is already partially failed over to cloud replicas.
If you provide this parameter, the cmdlet turns off the user appliance without notifying the user. Otherwise, the cmdlet will display a warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FromDate**
Use this parameter to fail over to a particular restore point.
Specifies the date and time to which you want to fail over. Veeam Backup & Replication will find a restore point closest to this moment.
If omitted, Veeam Backup & Replication will fail over to the latest restore point.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Test**
Defines that the failover runs in test mode.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Wait**
Use this parameter to manage starting multiple failover processes.
If you provide this parameter, the next failover process will wait for the previous to end.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFailoverPlan[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRFailoverPlan -FailoverPlan <VBRFailoverPlan[]> [-Force] [-FromDate <DateTime>] [-Wait] [<CommonParameters>]
```
```PowerShell
Start-VBRFailoverPlan -FailoverPlan <VBRFailoverPlan[]> [-Force] [-Test] [-Wait] [<CommonParameters>]
```
