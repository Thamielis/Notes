Get-VBRCloudDatastore
---------------------

### Synopsis
Returns datastores or disk volumes allocated to you under your cloud resources.

---

### Description

This cmdlet returns datastores (for VMware) or volumes (for Hyper-V) in your cloud resources.

---

### Related Links
* [Get-VBRCloudServer](Get-VBRCloudServer)

---

### Examples
> Example 1. Getting Cloud Datastore by Name

```PowerShell
Get-VBRCloudDatastore -Name "Cloud Replicas"
This command returns the cloud datastore named "Cloud Replicas".
```
> Example 2. Getting Cloud Datastores of Selected Cloud Server

$cloudServer = Get-VBRCloudServer -Name "Hyper-V Silver"
Get-VBRCloudDatastore -CloudServer $cloudServer
This example shows how to return cloud datastores located on the cloud server named "Hyper-V Silver".

Perform the following steps:
1. Run the Get-VBRCloudServer cmdlet. Specify the Name parameter value. Save the result to the $cloudServer variable.
2. Run the Get-VBRCloudDatastore cmdlet. Set the $cloudServer variable as the CloudServer parameter value.

---

### Parameters
#### **CloudServer**
Specifies the cloud service provider. The cmdlet will return the datastores or volumes provided by this cloud service provider. Accepts the VBRCloudServer[] object.  To get this object, run the Get-VBRCloudServer cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRCloudServer[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies the ID of the datastore or volume  you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the name of the datastore or volume you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudDatastore [-CloudServer <VBRCloudServer[]>] [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudDatastore [-Id <Guid[]>] [-Name <String[]>] [<CommonParameters>]
```
