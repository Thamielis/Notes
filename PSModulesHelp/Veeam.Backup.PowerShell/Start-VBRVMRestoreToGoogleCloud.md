Start-VBRVMRestoreToGoogleCloud
-------------------------------

### Synopsis
Starts a restore session to Google Compute Engine.

---

### Description

This cmdlet starts a restore session to Google Compute Engine.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRGoogleCloudComputeRegion](Get-VBRGoogleCloudComputeRegion)

* [Get-VBRGoogleCloudComputeZone](Get-VBRGoogleCloudComputeZone)

* [Get-VBRGoogleCloudComputeInstanceType](Get-VBRGoogleCloudComputeInstanceType)

* [New-VBRGoogleCloudComputeDiskConfiguration](New-VBRGoogleCloudComputeDiskConfiguration)

* [Get-VBRGoogleCloudComputeSubnet](Get-VBRGoogleCloudComputeSubnet)

* [New-VBRGoogleCloudComputeLabel](New-VBRGoogleCloudComputeLabel)

---

### Examples
> Starting Session of Machine Restore to Google Compute Engine

$backup = Get-VBRBackup -Name "MSExchange Backup" 
$restorepoint = Get-VBRRestorePoint -backup $backup
$account = Get-VBRGoogleCloudComputeAccount -Name "GCP service acc 1"
$computeregion = Get-VBRGoogleCloudComputeRegion -Account $account
$computezone = Get-VBRGoogleCloudComputeZone -Region $computeregion
$instancetype = Get-VBRGoogleCloudComputeInstanceType -Zone $computezone
$diskconfig = New-VBRGoogleCloudComputeDiskConfiguration -DiskName "srv20.vhdx" -DiskType StandardPersistent
$subnet = Get-VBRGoogleCloudComputeSubnet -Region $computeregion
$label = New-VBRGoogleCloudComputeLabel -Key "location" -Value "west"
Start-VBRVMRestoreToGoogleCloud -RestorePoint $restorepoint -Zone $computezone -InstanceType $instancetype -VMName "Restored VM" -DiskConfiguration $diskconfig -Subnet $subnet -Reason "Data recovery" -EnableAntivirusScan -EnableEntireVolumeScan -VirusDetectionAction AbortRecovery -GoogleCloudLabel $label -AllocatePublicIP
This example shows how to restore machines to Google Compute Engine.

Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Provide the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the backup parameter. Save the result to the $restorepoint variable.
3. Run the Get-VBRGoogleCloudComputeAccount cmdlet. Provide the Name parameter value. Save the result to the $account variable.
4. Run the Get-VBRGoogleCloudComputeRegion cmdlet. Set the $account variable as the Account parameter. Save the result to the $computeregion variable.
5. Run the Get-VBRGoogleCloudComputeZone cmdlet. Set the $computeregion variable as the Region parameter. Save the result to the $computezone variable.
6. Run the Get-VBRGoogleCloudComputeInstanceType cmdlet. Set the $computezone variable as the Zone parameter. Save the result to the $instancetype variable.
7. Run the New-VBRGoogleCloudComputeDiskConfiguration cmdlet. Specify the DiskName and DiskType parameter values. Save the result to the $diskconfig variable.
8. Run the Get-VBRGoogleCloudComputeSubnet cmdlet. Set the $computeregion variable as the Region parameter. Save the result to the $subnet variable.
9. Run the New-VBRGoogleCloudComputeLabel cmdlet. Specify the Key and Value parameter values. Save the result to the $label variable.
10. Run the Start-VBRVMRestoreToGoogleCloud cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $computezone variable as the Zone parameter value.
- Set the $instancetype variable as the InstanceType parameter value.
- Specify the VMName parameter value.
- Set the $diskconfig variable as the DiskConfiguration parameter value.
- Set the $subnet variable as the Subnet parameter value.
- Specify the Reason parameter value.
- Provide the EnableAntivirusScan parameter.
- Provide the EnableEntireVolumeScan parameter.
- Set the AbortRecovery option for the VirusDetectionAction parameter value.
- Set the $label variable as the GoogleCloudLabel parameter value.
- Provide the AllocatePublicIP parameter.

---

### Parameters
#### **AllocatePublicIP**
Defines that the cmdlet will assign a public IP to the restored VM.
If you do not provide this parameter, the restored VM will remain without the public IP.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DiskConfiguration**
Specifies the array of disk settings for Google Cloud VM instances.
Accepts the VBRGoogleCloudComputeDiskConfiguration object.
To add this object, run the New-VBRGoogleCloudComputeDiskConfiguration cmdlet.

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeDiskConfiguration[]]`|true    |named   |False        |

#### **EnableAntivirusScan**
Enables secure restore.
If you provide this parameter, Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Enables VMs scan by an antivirus after the first virus threat is found.
If you provide this parameter, the cmdlet will generate a report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GoogleCloudLabel**
Specifies an array of Google Cloud labels.
The cmdlet will restore VMs with the specified labels.
Accepts the VBRGoogleCloudComputeLabel object.
To add this object, run the New-VBRGoogleCloudComputeLabel cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeLabel[]]`|false   |named   |False        |

#### **InstanceType**
Specifies the Google Cloud VM instance type.
The cmdlet will restore the VM with the CPU and memory settings of the selected VM instance.
Accepts the VBRGoogleCloudComputeInstanceType object.
To get this object, run the Get-VBRGoogleCloudComputeInstanceType cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeInstanceType]`|true    |named   |False        |

#### **LicenseType**
Specifies the OS license. You can select the following types of licenses:
* BYOL - set this option if you want to restore the OS license from the backup. For more information, see Google Cloud documentation.
* ProvidedByGoogle - set this option if you want Google Compute Engine to provide the license on the restored VM.
Valid Values:

* BYOL
* ProvidedByGoogle

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRGoogleCloudLicenseType]`|false   |named   |False        |

#### **ProxyAppliance**
Specifies the Google Cloud proxy appliance.
Accepts the VBRGoogleCloudComputeProxyAppliance object.
To add this object, run the New-VBRGoogleCloudComputeProxyAppliance cmdlet.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeProxyAppliance]`|false   |named   |False        |

#### **Reason**
Specifies the restore reason.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of machines that you want to restore to Google Compute Engine.
Accepts the COib object.
To get this object, run the Get-VBRRestorePoint cmdlet.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[COib]`|true    |named   |False        |

#### **ShutdownVM**
Defines that the cmdlet will power off the restored VM after the restore is complete.
If you do not provide this parameter, the restored VM will remain powered on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Subnet**
Specifies the Google Cloud subnet.
Accepts the VBRGoogleCloudComputeSubnet object.
To get this object, run the Get-VBRGoogleCloudComputeSubnet cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeSubnet]`|true    |named   |False        |

#### **VirusDetectionAction**
For secure restore.
Specifies secure restore action when the virus threat is detected.
* ConnectToIsolatedNetwork - use this option if you want to restore the machine to an isolated Google Cloud network.
* AbortRecovery - use this option if you want to cancel the restore session.
Valid Values:

* ConnectToIsolatedNetwork
* AbortRecovery

|Type                                         |Required|Position|PipelineInput|
|---------------------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeVirusDetectionAction]`|false   |named   |False        |

#### **VirusIsolatedSubnet**
Specifies the Google Cloud subnet where the restore will be performed if Veeam Backup & Replication detects any virus threats.
Note: This parameter is required if you set the ConnectToIsolatedNetwork option for the VirusDetectionAction parameter value.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeSubnet]`|false   |named   |False        |

#### **VMName**
Specifies the name for the target Google Cloud instance.
Veeam Backup & Replication will restore the VM instance with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Wait**
Defines that the command will wait for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **YARAScanRule**
Specifies the YARA rule. Veeam Backup & Replication will scan VMs with this rule.
Note: Veeam Backup & Replication searches for YARA rules by the following path: C:\Program Files\Veeam\Backup and Replication\Backup\YaraRules.
To use the Yara rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Zone**
Specifies the Google Cloud availability zone.
The cmdlet will restore the VM to this Google Cloud availability zone.
Accepts the VBRGoogleCloudComputeZone object.
To get this object, run the Get-VBRGoogleCloudComputeZone cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeZone]`|true    |named   |False        |

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
Start-VBRVMRestoreToGoogleCloud [-AllocatePublicIP] -DiskConfiguration <VBRGoogleCloudComputeDiskConfiguration[]> [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-GoogleCloudLabel 
```
```PowerShell
<VBRGoogleCloudComputeLabel[]>] -InstanceType <VBRGoogleCloudComputeInstanceType> [-LicenseType {BYOL | ProvidedByGoogle}] [-ProxyAppliance <VBRGoogleCloudComputeProxyAppliance>] [-Reason <String>] 
```
```PowerShell
-RestorePoint <COib> [-ShutdownVM] -Subnet <VBRGoogleCloudComputeSubnet> [-VirusDetectionAction {ConnectToIsolatedNetwork | AbortRecovery}] [-VirusIsolatedSubnet <VBRGoogleCloudComputeSubnet>] -VMName <String> 
```
```PowerShell
[-Wait] [-YARAScanRule <String>] -Zone <VBRGoogleCloudComputeZone> [<CommonParameters>]
```
