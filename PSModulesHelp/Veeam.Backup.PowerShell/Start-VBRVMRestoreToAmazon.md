Start-VBRVMRestoreToAmazon
--------------------------

### Synopsis
Starts a restore session of workloads to Amazon EC2 service.

---

### Description

This cmdlet starts a restore session of workloads to Amazon EC2 service.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

* [New-VBRAmazonEC2DiskConfiguration](New-VBRAmazonEC2DiskConfiguration)

* [Get-VBRAmazonEC2InstanceType](Get-VBRAmazonEC2InstanceType)

* [Get-VBRAmazonEC2VPC](Get-VBRAmazonEC2VPC)

* [Get-VBRAmazonEC2SecurityGroup](Get-VBRAmazonEC2SecurityGroup)

* [Get-VBRAmazonEC2Subnet](Get-VBRAmazonEC2Subnet)

---

### Examples
> Example 1. Restoring Workloads to Amazon EC2

$restorepoint = Get-VBRRestorePoint -Name *MSExchange02* -Backup $backup
$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$region = Get-VBRAmazonEC2Region -Account $account -RegionType Global -Name "ap-northeast-1"
$config = New-VBRAmazonEC2DiskConfiguration -DiskName "Virtual Disk" -Include -DiskType GeneralPurposeSSD
$instance = Get-VBRAmazonEC2InstanceType -Region $region
$vpc = Get-VBRAmazonEC2VPC -Region $region
$sgroup = Get-VBRAmazonEC2SecurityGroup -VPC $vpc
$subnet = Get-VBRAmazonEC2Subnet -VPC $vpc -AvailabilityZone "eu-west-1a"
Start-VBRVMRestoreToAmazon -RestorePoint $restorepoint -Region $region -LicenseType ProvidedByAWS -InstanceType $instance -VMName "Restored VM" -DiskConfiguration $config -VPC $vpc -SecurityGroup $sgroup -Subnet $subnet -Reason "Data recovery"
This example shows how to restore workloads to Amazon EC2.

Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
3. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
4. Run the Get-VBRAmazonEC2Region cmdlet.    Set the $account variable as the Account parameter value.
Set the Global value as the RegionType parameter value.
Specify the Name parameter value. Save the result to the $region variable.
5. Run the New-VBRAmazonEC2DiskConfiguration cmdlet.    Specify the DiskName parameter value.
Provide the Include parameter.
Set the GeneralPurposeSSD value as the DiskType parameter value.
Save the result to the $config variable.
6. Run the Get-VBRAmazonEC2InstanceType cmdlet.    Set the $region variable as the Region parameter value.
Save the result to the $instance variable.
7. Run the Get-VBRAmazonEC2VPC cmdlet.
Set the $region variable as the Region parameter value.
Save the result to the $vpc variable.
8. Run the Get-VBRAmazonEC2SecurityGroup cmdlet.
Set the $vpc variable as the VPC parameter value.
Save the result to the $sgroup variable.
9. Run the Get-VBRAmazonEC2Subnet cmdlet.
Set the $vpc variable as the VPC parameter value.
Specify the AvailabilityZone parameter value.
Save the result to the $subnet variable. 10. Run the Start-VBRVMRestoreToAmazon cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $region variable as the Region parameter value.
- Set the ProvidedByAWS value as the LicenseType parameter value.
- Set the $instance variable as the InstanceType parameter value.
- Specify the VMName parameter value.
- Set the $config variable as the DiskConfiguration parameter value.
- Set the $vpc variable as the VPC parameter value.
- Set the $sgroup variable as the SecurityGroup parameter value.
- Set the $subnet variable as the Subnet parameter value.
- Specify the Reason parameter value.

---

### Parameters
#### **AllocatePublicIP**
Defines that the cmdlet will assign a public IP to the restored VM.
If you do not provide this parameter, the restored VM will remain without the public IP.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AmazonEC2Tag**
Specifies AmazonEC2 tags.
The cmdlet will restore VMs with the specified tags.
Accepts the VBRAmazonEC2Tag[] object. To get this object, run the New-VBRAmazonEC2Tag cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRAmazonEC2Tag[]]`|false   |named   |False        |

#### **Credentials**
For restoring backups located on a network shared folder.
Specifies the credentials to authenticate with the network shared folder.
Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **DiskConfiguration**
Specifies an array of storage volume settings for Amazon EC2 instances.
If you do not specify this parameter, the cmdlet will restore all disks from the selected restore point.
Accepts the VBRAmazonEC2DiskConfiguration[] object. To get this object, run the New-VBRAmazonEC2DiskConfiguration cmdlet.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRAmazonEC2DiskConfiguration[]]`|false   |named   |False        |

#### **EnableAntivirusScan**
Indicates that the cmdlet will perform secure restore.
Veeam Backup & Replication will trigger the antivirus software to scan selected machines before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Enables the option for the antivirus to continue VMs scan after the first virus threat is found.
Use this option if you want to get the report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **InstanceType**
Specifies the Amazon EC2 instance type.
The cmdlet will restore the VM with the CPU and memory settings of the selected instance.
Accepts the VBRAmazonEC2InstanceType object. To get this object, run the Get-VBRAmazonEC2InstanceType cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRAmazonEC2InstanceType]`|true    |named   |False        |

#### **LicenseType**
Specifies the OS license. You can select the following types of licenses:
* BYOL - set this option if you want to use your existing licenses for Microsoft software.
* ProvidedByAWS - set this option if you want Amazon EC2 to update the license on the restored VM.
Valid Values:

* BYOL
* ProvidedByAWS

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRAmazonEC2LicenseType]`|true    |named   |False        |

#### **ProxyAppliance**
Specifies the AmazonEC2 proxy appliance.
Accepts the VBRAmazonEC2ProxyAppliance object. To get this object, run the New-VBRAmazonEC2ProxyAppliance cmdlet.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRAmazonEC2ProxyAppliance]`|false   |named   |False        |

#### **Reason**
Specifies the restore reason.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Region**
Specifies the Amazon EC2 region.
The cmdlet will restore the VM to this Amazon EC2 region.
Accepts the VBRAmazonEC2Region object. To get this object, run the Get-VBRAmazonEC2Region cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRAmazonEC2Region]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of workloads that you want to restore to Amazon EC2.
Accepts the COib object. To get this object, run the Get-VBRRestorePoint cmdlet.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[COib]`|true    |named   |False        |

#### **SecurityGroup**
Specifies the Amazon VPC security group.
Accepts the VBRAmazonEC2SecurityGroup object.
To get this object, run the Get-VBRAmazonEC2SecurityGroup cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRAmazonEC2SecurityGroup]`|true    |named   |False        |

#### **ShutdownVM**
Defines that the cmdlet will power on the restored VM after the restore is complete.
If you do not provide this parameter, the restored VM will remain powered off.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Subnet**
Specifies the Amazon VPC subnet.
Accepts the VBRAmazonEC2Subnet object. To get this object, run the Get-VBRAmazonEC2Subnet cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRAmazonEC2Subnet]`|true    |named   |False        |

#### **VirusDetectionAction**
For secure restore.
Specifies secure restore action when the virus threat is detected.
* ConnectToIsolatedSecurityGroup - Select this action if you want to restore the machine to a different AWS security group. Use the VirusIsolatedSecurityGroup parameter to specify the security group.
* AbortRecovery - use this option if you want to cancel the restore session.
Valid Values:

* ConnectToIsolatedSecurityGroup
* AbortRecovery

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRAmazonEC2VirusDetectionAction]`|false   |named   |False        |

#### **VirusIsolatedSecurityGroup**
For secure restore.
Specifies the AmazonEC2 security group. Veeam Backup & Replication will restore the infected the machine to the selected security group.
Accepts the VBRAmazonEC2SecurityGroup object.  To get this object, run the Get-VBRAmazonEC2SecurityGroup cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRAmazonEC2SecurityGroup]`|false   |named   |False        |

#### **VMName**
Specifies the name for the target EC2 instance.
Veeam Backup & Replication will restore the instance with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **VPC**
Specifies the Amazon VPC.
Accepts the VBRAmazonEC2VPC object. To get this object, run the Get-VBRAmazonEC2VPC cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRAmazonEC2VPC]`|false   |named   |False        |

#### **Wait**
Indicates that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **YARAScanRule**
Specifies the YARA rule. Veeam Backup & Replication will scan VMs with this rule.
Veeam Backup & Replication searches for YARA rules by the following path: C:\Program Files\Veeam\Backup and Replication\Backup\YaraRules.
To use the Yara rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.

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
Start-VBRVMRestoreToAmazon [-AllocatePublicIP] [-AmazonEC2Tag <VBRAmazonEC2Tag[]>] [-Credentials <CCredentials>] [-DiskConfiguration <VBRAmazonEC2DiskConfiguration[]>] [-EnableAntivirusScan] 
```
```PowerShell
[-EnableEntireVolumeScan] [-EnableYARAScan] -InstanceType <VBRAmazonEC2InstanceType> -LicenseType {BYOL | ProvidedByAWS} [-ProxyAppliance <VBRAmazonEC2ProxyAppliance>] [-Reason <String>] [-Region 
```
```PowerShell
<VBRAmazonEC2Region>] -RestorePoint <COib> -SecurityGroup <VBRAmazonEC2SecurityGroup> [-ShutdownVM] -Subnet <VBRAmazonEC2Subnet> [-VirusDetectionAction {ConnectToIsolatedSecurityGroup | AbortRecovery}] 
```
```PowerShell
[-VirusIsolatedSecurityGroup <VBRAmazonEC2SecurityGroup>] -VMName <String> [-VPC <VBRAmazonEC2VPC>] [-Wait] [-YARAScanRule <String>] [<CommonParameters>]
```
