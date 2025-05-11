New-VBRCloudFailoverPlanObject
------------------------------

### Synopsis
Defines VM replicas that you want to add to a failover plan.

---

### Description

Detailed Description This cmdlet creates a new VBRCloudFailoverPlanObject object. This object contains VM replicas that you want to add to a cloud failover plan. You can add the following types of replicas for a failover plan:
- Simple cloud replicas
- vCD cloud replicas
Run the Add-VBRFailoverPlan cmdlet to create a failover plan. NOTE: You must create the VBRCloudFailoverPlanObject object for each replica that you want to add to the failover plan.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Example - Adding VM Replicas to Cloud Failover Plan

$DNS = Get-VBRRestorePoint -Name "DNSServer" | Sort-Object $_.creationtime -Descending | Select -First 1
$MSExchange01 = Get-VBRRestorePoint -Name "MS_Exchange_Server_01" | Sort-Object $_.creationtime -Descending | Select -First 1
$MSExchange02 = Get-VBRRestorePoint -Name "MS_Exchange_Server_02" | Sort-Object $_.creationtime -Descending | Select -First 1
New-VBRCloudFailoverPlanObject -RestorePoint $DNS -BootDelay 0
New-VBRFailoverPlanObject -RestorePoint $MSExchange01 -BootOrder 1 -BootDelay 180
New-VBRFailoverPlanObject -RestorePoint $MSExchange02 -BootOrder 2 -BootDelay 120
This example shows how to create VBRCloudFailoverPlanObject objects for three servers: a DNS server and two Microsoft Exchange servers. The servers will boot with the following order:
- The DNS server boots first.
- The first Microsoft Exchange server boots with the 180 seconds delay.
- The second Microsoft Exchange server boots with the 120 seconds delay.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Use the Sort-Object and the Select commands to select the first restore point. Save the result to the $DNS variable.
2. Run the Get-VBRRestorePoint cmdlet. Use the Sort-Object and the Select commands to select the first restore point. Save the result to the $MSExchange01 variable.
3. Run the Get-VBRRestorePoint cmdlet. Use the Sort-Object and the Select commands to select the first restore point. Save the result to the $MSExchange02 variable.
4. Run the New-VBRCloudFailoverPlanObject cmdlet. Set the $DNS variable as the RestorePoint parameter value. Set 0 as BootDelay parameter value.
5. Run the New-VBRCloudFailoverPlanObject cmdlet. Set the $MSExchange01 variable as the RestorePoint parameter value. Set 1 as the BootOrder parameter value and 180 as the BootDelay parameter value.
6. Run the New-VBRCloudFailoverPlanObject cmdlet. Set the $MSExchange02 variable as the RestorePoint parameter value. Set 2 as the BootOrder parameter value and 120 as the BootDelay parameter value.

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

#### **PublicIpRule**
Specifies the array of rules for mapping public IP and ports to the IP and ports of the replica VM. Accepts the VBRFailoverPlanPublicIPRule[] object.  To create this object, run the New-VBRFailoverPlanPublicIPRule cmdlet.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRFailoverPlanPublicIPRule[]]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the cloud replica that you want to add to the cloud failover plan. Accepts the COib object.  To create this object, run the Get-VBRRestorePoint cmdlet.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRCloudFailoverPlanObject [-BootDelay <Int32>] [-BootOrder <Int32>] [-PublicIpRule <VBRFailoverPlanPublicIPRule[]>] -RestorePoint <COib> [<CommonParameters>]
```
