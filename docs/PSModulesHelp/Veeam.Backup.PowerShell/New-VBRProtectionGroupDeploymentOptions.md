New-VBRProtectionGroupDeploymentOptions
---------------------------------------

### Synopsis
Defines protection group deployment settings.

---

### Description

The cmdlet creates the VBRProtectionGroupDeploymentOptions object. This object contains the deployment settings for a protection group. You can use these settings to automatically install and upgrade Veeam Agent or Veeam Plug-ins on discovered computers.
Run the Set-VBRProtectionGroup cmdlet to apply deployment settings to a protection group.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Set-VBRProtectionGroup](Set-VBRProtectionGroup)

---

### Examples
> Example 1. Creating Discovery Schedule for Protection Group

$server = Get-VBRServer -Name support.east.local
New-VBRProtectionGroupDeploymentOptions -DistributionServer $server -InstallAgent -UpgradeAutomatically
This example shows how to create an object containing the following Veeam Agent deployment settings:
- Veeam Agents will be installed automatically on discovered computers.
- Veeam Agents will be upgraded automatically to the version of Veeam Agent on the distribution server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the New-VBRProtectionGroupDeploymentOptions cmdlet. Set the $server variable as the DistributionServer parameter value. Provide the InstallAgent and UpgradeAutomatically parameters.
> Example 2. Creating and Applying Discovery Schedule for Protection Group

$server = Get-VBRServer -Name support.east.local
$deployment = New-VBRProtectionGroupDeploymentOptions -DistributionServer $server -InstallAgent -UpgradeAutomatically
$group = Get-VBRProtectionGroup -Name "East Computers"
Set-VBRProtectionGroup -ProtectionGroup $group -DeploymentOptions $deployment
This example shows how to apply Veeam Agent deployment settings to a protection group. Per these settings, Veeam Backup & Replication will automatically install Veeam Agents on discovered computers and automatically upgrade them.
Perform the following steps:
1. Create an object with Veeam Agent deployment settings:
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the New-VBRProtectionGroupDeploymentOptions cmdlet. Set the $server variable as the DistributionServer parameter value. Provide the InstallAgent and UpgradeAutomatically parameters. Save the result to the $deployment variable.
2. Apply Veeam Agent deployment settings to a protection group:
To do this, perform the following steps:
- Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
- Run the Set-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value. Set the $deployment variable as the DeploymentOptions parameter value.

---

### Parameters
#### **ApplicationTypes**
Specifies an array of Veeam Plug-ins that you want to install on the protected computers:
* OracleRMAN: for Veeam Plug-in for Oracle RMAN
* SAPHANA: for Veeam Plug-in for SAP HANA
* SAPOnOracle: for Veeam Plug-in for SAP on Oracle
Valid Values:

* OracleRMAN
* SAPHANA
* SAPOnOracle

|Type                    |Required|Position|PipelineInput        |
|------------------------|--------|--------|---------------------|
|`[VBRApplicationType[]]`|false   |named   |True (ByPropertyName)|

#### **DistributionRepository**
For protection groups for cloud machines.
Specifies an object storage repository (either Microsoft Azure blob storage or Amazon S3 object storage repository) that will act as a distribution repository. Veeam Backup & Replication will use this repository to upload Veeam Agent setup files to cloud machines added to the protection group.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageRepository]`|false   |named   |True (ByPropertyName, ByValue)|

#### **DistributionServer**
Specifies a distribution server. The cmdlet will instruct Veeam Backup & Replication to use this server to upload Veeam Agent or Veeam Plug-in setup files and private fixes to computers added to the protection group.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|false   |named   |True (ByPropertyName, ByValue)|

#### **InstallAgent**
Defines that Veeam Backup & Replication will automatically install Veeam Agent or Veeam Plug-in on all discovered computers of the protection group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **InstallApplicationPlugins**
Defines that the cmdlet will define deployment settings for the Veeam Plug-in protection group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **InstallDriver**
Used only for Veeam Agent for Microsoft Windows.
Defines that Veeam Backup & Replication will automatically install the CBT driver on discovered computers.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **RebootIfRequired**
Defines that Veeam Backup & Replication will reboot discovered computers if required.
Note: Reboot is required after the CBT driver installation.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **UpgradeAutomatically**
Defines that Veeam Backup & Replication will automatically upgrade Veeam Agent or Veeam Plug-in on discovered computers when the new Veeam Agent version or private fix appears on the distribution server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository

System.Management.Automation.SwitchParameter

Veeam.Backup.PowerShell.Infos.VBRApplicationType[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRProtectionGroupDeploymentOptions [-ApplicationTypes {OracleRMAN | SAPHANA | SAPOnOracle}] [-DistributionRepository <VBRObjectStorageRepository>] [-DistributionServer <CHost>] [-InstallAgent] 
```
```PowerShell
[-InstallApplicationPlugins] [-InstallDriver] [-RebootIfRequired] [-UpgradeAutomatically] [<CommonParameters>]
```
