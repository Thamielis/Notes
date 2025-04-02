Set-VBRCloudProvider
--------------------

### Synopsis
Modifies service providers.

---

### Description

This cmdlet modifies settings of service provider added to Veeam Backup & Replication. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Set-VBRCloudProviderNetworkAppliance](Set-VBRCloudProviderNetworkAppliance)

* [Get-VBRCloudProvider](Get-VBRCloudProvider)

---

### Examples
> Example 1. Enabling TLS Certificate Verification for Service Provider [Using Variable]

$CloudProvider = Get-VBRCloudProvider -Name "104.45.95.227"
Set-VBRCloudProvider -CloudProvider $CloudProvider -VerifyCertificate -CertificateThumbprint "e6 c0 e5 1a db 73 0c 13 b3 c3 74 d4 ee 93 ab d0 08 3f 7a a8"
This example shows how to enable the TLS certificate verification for a service provider.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $CloudProvider variable.
2. Run the Set-VBRCloudProvider cmdlet. Set the $CloudProvider variable as the CloudProvider parameter value. Provide the VerifyCertificate parameter. Specify the CertificateThumbprint parameter value.
> Example 2. Setting Cloud Gateway Port [Using Pipeline]

Get-VBRCloudProvider -Name "104.45.95.227"  | Set-VBRCloudProvider -Port 6180
This example shows how to set the cloud gateway port to the default value.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRCloudProvider cmdlet. Specify the Port parameter value.
> Example 3. Configuring Network Extension Appliance of Service Provider [Using Variable]

$provider = Get-VBRCloudProvider -Name "104.45.95.227"
$viAppl = Get-VBRCloudProviderNetworkAppliance -CloudProvider $provider
$newFolder = "C:\Users\admin"
$newAppliance = Set-VBRCloudProviderNetworkAppliance -NetworkAppliance $hvAppl -Folder $newFolder
$CloudProvider = Get-VBRCloudProvider -Name "104.45.95.227"
Set-VBRCloudProvider -CloudProvider $CloudProvider -Appliance $newAppliance
This example shows how to edit configuration of the network extension appliance configured for the service provider.

Perform the following steps:
1. Modify the network extension appliance:
- Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter values. Save the result to the $provider variable.
- Run the Get-VBRCloudProviderNetworkAppliance cmdlet. Set the $provider variable as the CloudProvider parameter value. Save the result to the $viAppl variable.
- Assign the $newFolder variable the C:\Users\admin value.
- Run the Set-VBRCloudProviderNetworkAppliance cmdlet for instructions. Specify the NetworkAppliance and Folder parameter values. Save the result to the $newAppliance variable.
2. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $CloudProvider variable.
3. Run the Set-VBRCloudProvider cmdlet. Set the $CloudProvider variable as the CloudProvider parameter value. Set the $newAppliance variable as the Appliance parameter value.

---

### Parameters
#### **Address**
Specifies a full DNS name or IP address of the cloud gateway configured on the service provider side.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Appliance**
Specifies the appliance on the user side that will be used for the partial failover. Accepts the VBRHvCloudProviderNetworkAppliance[] object. To get this object, run the Set-VBRCloudProviderNetworkAppliance cmdlet.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRCloudProviderNetworkAppliance[]]`|false   |named   |False        |

#### **CertificateThumbprint**
Specifies the thumbprint that will be compared to the TLS certificate thumbprint.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CloudProvider**
Specifies the service provider you want to modify. Accepts the VBRCloudProvider object. To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRCloudProvider]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Credentials**
Specifies credentials for the user account registered on the service provider Veeam backup server. Accepts the VBRCloudProviderCredentials object.  To get this object, run the Get-VBRCloudProviderCredentials cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCloudProviderCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the service provider.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the command will skip the certificate verification if the verification fails.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **InstallManagementAgent**
Defines that the service provider must manage the Veeam backup server under the Backup as a Service agreement. The cmdlet will install the Veeam Managed Backup Portal agent on the Veeam backup server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
Defines that the command will return the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Port**
Specifies the port over which user's Veeam backup server will communicate with the cloud gateway. Permitted values: 1 to 65535. Default: 6180.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **VerifyCertificate**
Defines if the TLS certificate must be verified by the thumbprints. Use the CertificateTumbprint parameter to set the thumbprint that will be compared to the TLS certificate thumbprint.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudProvider

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudProvider [-Address <String>] [-Appliance <VBRCloudProviderNetworkAppliance[]>] [-CertificateThumbprint <String>] -CloudProvider <VBRCloudProvider> [-Credentials <VBRCloudProviderCredentials>] 
```
```PowerShell
[-Description <String>] [-Force] [-InstallManagementAgent] [-PassThru] [-Port <Int32>] [-VerifyCertificate] [<CommonParameters>]
```
