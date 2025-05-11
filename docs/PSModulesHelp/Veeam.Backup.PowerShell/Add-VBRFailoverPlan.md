Add-VBRFailoverPlan
-------------------

### Synopsis
Creates failover plans or cloud failover plans.

---

### Description

This cmdlet creates the following types of failover plans:
- Failover plan
- Cloud failover plan

---

### Examples
> Example 1

$DNS = Find-VBRViEntity -Name "DNSServer" | New-VBRFailoverPlanObject -BootDelay 0
$MSExchange01 = Find-VBRViEntity -Name "MS_Exchange_Server_01" | New-VBRFailoverPlanObject -BootOrder 1  -BootDelay 180
$MSExchange02 = Find-VBRViEntity -Name "MS_Exchange_Server_02" | New-VBRFailoverPlanObject -BootOrder 2  -BootDelay 120
Add-VBRFailoverPlan -Name "MS Exchange Group Failover" -FailoverPlanObject $DNS, $MSexchange01, $MSExchange02 -Description "Failover plan for the mail servers group"
This example shows how to create a failover plan for a group of VMs: a DNS server and two Microsoft Exchange servers.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootDelay parameter value. Save the result to the $DNS variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootOrder and BootDelay parameter values. Save the result to the $MSExchange01 variable.
3. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootOrder and BootDelay parameter values. Save the result to the $MSExchange02 variable.
4. Run the Add-VBRFailoverPlan cmdlet. Specify the Name parameter value. Set the $DNS, $MSexchange01, $MSExchange02 variables as the FailoverPlanObject parameter value. Specify the Description parameter value.
> Example 2

$point = Get-VBRRestorePoint -Name "Cloud VM 01" | Sort-Object $_.creationtime -Descending | Select -First 1
$cloudreplica = New-VBRCloudFailoverPlanObject -RestorePoint $point -BootDelay 0
Add-VBRFailoverPlan -Name "Cloud Group Failover" -CloudFailoverPlanObject $cloudreplica -Description "Cloud replica failover plan"
[Cloud] This example shows how to create a cloud failover plan named Cloud Failover for a replica.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Use the Sort-Object and the Select commands to select the first restore point. Save the result to the $point variable.
2. Run the New-VBRCloudFailoverPlanObject cmdlet. Set the $point variable as the RestorePoint parameter value. Specify the BootDelay parameter value. Save the result to the $cloudreplica variable.
3. Run the Add-VBRFailoverPlan cmdlet. Specify the Name parameter value. Set the $cloudreplica variable as the CloudFailoverPlanObject parameter value. Specify the Description parameter value.

---

### Parameters
#### **CloudFailoverPlanObject**
Specifies the VM(s) replicated to cloud. These VMs will be added to the cloud failover plan. Accepts VBRCloudFailoverPlanObject. You can assign multiple VMs to this object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCloudFailoverPlanObject[]]`|true    |named   |False        |

#### **Description**
Specifies the description of the failover plan. If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnablePublicIpRule**
If set, the failover plan will use the public IP rules configured in the VBRFailoverPlanObject or VBRCloudFailoverPlanObject.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FailoverPlanObject**
Specifies the VM(s) you want to add to the failover plan. Accepts VBRFailoverPlanObject. You can assign multiple VMs to this object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRFailoverPlanObject[]]`|true    |named   |False        |

#### **Name**
Specifies the name that you want to assign to the failover plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PostfailoverCommand**
Specifies the path to the script you want to automatically run after failing over to replicas is complete. Veeam Backup & Replication provides a 10 minute timeout for the script. In case the script does not run successfully or timeout ends, the failover proceeds disregarding script failure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PrefailoverCommand**
Specifies the path to the script you want to automatically run before failing over to replicas. Veeam Backup & Replication provides a 10 minute timeout for the script. In case the script does not run successfully or timeout ends, the failover is not performed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRFailoverPlan -CloudFailoverPlanObject <VBRCloudFailoverPlanObject[]> [-Description <String>] [-EnablePublicIpRule] -Name <String> [-PostfailoverCommand <String>] [-PrefailoverCommand <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Add-VBRFailoverPlan [-Description <String>] [-EnablePublicIpRule] -FailoverPlanObject <VBRFailoverPlanObject[]> -Name <String> [-PostfailoverCommand <String>] [-PrefailoverCommand <String>] [<CommonParameters>]
```
