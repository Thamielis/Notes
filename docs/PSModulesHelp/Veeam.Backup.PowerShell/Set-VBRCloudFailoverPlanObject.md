Set-VBRCloudFailoverPlanObject
------------------------------

### Synopsis
Modifies VMs in cloud failover plans.

---

### Description

This cmdlet modifies VMs added to a cloud failover plan. Run the Set-VBRFailoverPlanObject cmdlet to modify VMs in non-cloud failover plans.

To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRFailoverPlan](Get-VBRFailoverPlan)

---

### Examples
> Example 1. Changing Boot Order of Replica VM

$MSExchange01 = Get-VBRRestorePoint -Name "MS_Exchange_Server_01" | Sort-Object $_.creationtime -Descending | Select -First 1 | New-VBRFailoverPlanObject -BootOrder 1
Set-VBRCloudFailoverPlanObject -Object $MSExchange01 -BootOrder 2
This example shows how to change the boot order of a replica VM.

Perform the following steps:
1. Run the Get-VBRRestorepoint cmdlet. Specify the Name parameter value. Use the Sort-Object and the Select commands to select the first restore point. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootOrder parameter value. Save it to $MSExchange01 variable.
2. Run the Set-VBRCloudFailoverPlanObject cmdlet. Set the $MSExchange01 variable as the Object parameter value. Specify the BootOrder parameter value.
> Example 2. Changing Boot Delay of Replica VM

$MSExchange02 = Get-VBRRestorePoint -Name "MS_Exchange_Server_02" | Sort-Object $_.creationtime -Descending | Select -First 1 | New-VBRFailoverPlanObject -BootDelay 120
Set-VBRCloudFailoverPlanObject -Object $MSExchange02 -BootDelay 240
This example shows how to change the boot delay of a replica VM.

Perform the following steps:
1. Run the Get-VBRRestorepoint cmdlet. Specify the Name parameter value. Use the Sort-Object and the Select commands to select the first restore point. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootDelay parameter value. Save it to $MSExchange02 variable.
2. Run the Set-VBRCloudFailoverPlanObject cmdlet. Set the $MSExchange02 variable as the Object parameter value. Specify the BootDelay parameter value.

---

### Parameters
#### **BootDelay**
Specifies the delay time for the replica to boot. The delay time is set in seconds. If omitted, the delay time will be set to 60 sec by default. If you set boot delay to '0' to a number of replicas, these replicas will start simultaneously.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **BootOrder**
Specifies the order number by which the replica will boot.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Object**
Specifies the failover plan object you want to modify. VBRCloudFailoverPlanObject object.  To get this object, run the New-VBRCloudFailoverPlanObject and Get-VBRRestorePoint cmdlets.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRCloudFailoverPlanObject]`|true    |named   |True (ByPropertyName, ByValue)|

#### **PublicIpRule**
Specifies the array of rules for mapping public IP and ports to the IP and ports of the replica VM. Accepts VBRFailoverPlanPublicIPRule type.  To create this object, run the New-VBRFailoverPlanPublicIPRule cmdlet.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRFailoverPlanPublicIPRule[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudFailoverPlanObject

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudFailoverPlanObject [-BootDelay <Int32>] [-BootOrder <Int32>] -Object <VBRCloudFailoverPlanObject> [-PublicIpRule <VBRFailoverPlanPublicIPRule[]>] [<CommonParameters>]
```
