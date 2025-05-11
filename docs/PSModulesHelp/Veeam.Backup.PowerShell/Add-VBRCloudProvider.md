Add-VBRCloudProvider
--------------------

### Synopsis
Adds cloud service providers.

---

### Description

This cmdlet adds a new service provider to Veeam Backup & Replication. You can add several providers using one cloud gateway to your Veeam backup console. The provider credentials must have different user names. You must set a network extension appliance if you plan to replicate your VMs to the cloud. Pre-configure the network extension appliance in advance. For details, see Network Appliance.

Important! The CCredentials type object for the Credentials parameter is not accepted any longer. Run the Add-VBRCloudProviderCredentials cmdlet to specify the cloud provider credentials records.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRCloudProviderNetworkAppliance](Get-VBRCloudProviderNetworkAppliance)

---

### Examples
> Example 1. Adding Cloud Service Provider with Default Settings

$credentials = Get-VBRCloudProviderCredentials -Name "Tenant1"
Add-VBRCloudProvider -Address "198.51.100.11" -Credentials $credentials
This example shows how to add a cloud service provider to Veeam Backup & Replication using default settings. The service provider IP address is 198.51.100.11.

Perform the following steps:
1. Run the Get-VBRCloudProviderCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
2. Run the Add-VBRCloudProvider cmdlet. Specify the Address parameter value. Set the $credentials variable as the Credentials parameter value.
> Example 2. Adding Cloud Service Provider with Specific Settings

$credentials = Get-VBRCredentials -Name "Cloud Provider Administrator"
Add-VBRCloudProvider -Address "104.45.95.227" -Description "Cloud gateway for SP" -Port 6252 -Credentials $credentials -VerifyCertificate -CertificateThumbprint "e6 c0 e5 1a db 73 0c 13 b3 c3 74 d4 ee 93 ab d0 08 3f 7a a8"
This example shows how to add a cloud service provider with the following settings:
- The service provider IP address is 104.45.95.227.
- The service provider uses port 6252 for connection.
- The SSL certificate thumbprint verification is enabled.
The thumbprint is "e6 c0 e5 1a db 73 0c 13 b3 c3 74 d4 ee 93 ab d0 08 3f 7a a8".

Perform the following steps:
1. Run the Get-VBRCloudProviderCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
2. Run the Add-VBRCloudProvider cmdlet. Specify the following settings:
- Specify the Address and the Description parameter values.
- Specify the Port parameter value.
- Set the $credentials variable as the Credentials parameter value.
- Provide the VerifyCertificate parameter.
- Specify the CertificateThumbprint parameter value.
> Example 3. Adding Cloud Service Provider and Configuring Network Extension Appliance

$server = Get-VBRServer -Type HvServer -Name "srv02.tech.local"
$folder = "C:\Datastore"
$network = Get-VBRHvServerNetworkInfo -Server $server  | Where { $_.NetworkName -eq "VM Network" }
$viAppl = New-VBRCloudProviderNetworkAppliance -Server $server -Network $network -Folder $folder
$credentials = Get-VBRCloudProviderCredentials -Name "Tenant1"
Add-VBRCloudProvider -Address "198.51.100.11" -Credentials $credentials -Appliance $viAppl
This example shows how to add a service provider and configure a network extension appliance. The service provider IP address is 104.45.95.227.

Perform the following steps:
1. Create a network extension appliance:
- Run the Get-VBRServer cmdlet. Set the HvServer option for the Type parameter. Specify the Name parameter value. Save the server to the $server variable.
- Assign the C:\Datastore value to the $folder variable.
- Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value and use the Where-Object statement to filter the networks by the .NetworkName property. Save the network to the $network variable.
- Run the New-VBRCloudProviderNetworkAppliance cmdlet. Specify the Server, Network and Folder parameter values. Save the result to the $viAppl variable.
2. Run the Get-VBRCloudProviderCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
3. Run the Add-VBRCloudProvider cmdlet. Specify the Address parameter value. Set the $credentials variable as the Credentials parameter value. Set the $viAppl variable as the Appliance parameter value.

---

### Parameters
#### **Address**
Specifies a full DNS name or IP address of the cloud gateway configured on the service provider side.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Appliance**
Specifies the network extension appliance on the user side.  You must configure a network extension appliance if you want to replicate to the cloud. Accepts the VBRHvCloudProviderNetworkAppliance[] object. To get this object, run the New-VBRCloudProviderNetworkAppliance cmdlet.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRCloudProviderNetworkAppliance[]]`|false   |named   |False        |

#### **CertificateThumbprint**
Specifies the thumbprint that will be compared to the TLS certificate thumbprint.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Credentials**
Specifies credentials for the user account registered on the service provider Veeam backup server. Accepts the VBRCloudProviderCredentials object.  To get this object, run the Get-VBRCloudProviderCredentials cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCloudProviderCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the service provider.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will skip the certificate verification if the verification fails.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **InstallManagementAgent**
Defines that the service provider must manage the Veeam backup server under the Backup as a Service agreement. The cmdlet will install the Veeam Managed Backup Portal agent on the Veeam backup server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Port**
Specifies the port over which user's Veeam backup server will communicate with the cloud gateway. Permitted values: 1 to 65535. Default: 6180.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **VerifyCertificate**
Defines if the TLS certificate must be verified by the thumbprints. Use the CertificateThumbprint parameter to set the thumbprint that will be compared to the TLS certificate thumbprint.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Add-VBRCloudProvider -Address <String> [-Appliance <VBRCloudProviderNetworkAppliance[]>] [-CertificateThumbprint <String>] -Credentials <VBRCloudProviderCredentials> [-Description <String>] [-Force] 
```
```PowerShell
[-InstallManagementAgent] [-Port <Int32>] [-VerifyCertificate] [<CommonParameters>]
```
