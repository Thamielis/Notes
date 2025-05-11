Get-VBRCloudServer
------------------

### Synopsis
Returns cloud hosts allocated by a service provider.

---

### Description

This cmdlet returns cloud hosts that are allocated by a service provider.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

---

### Examples
> Example 1. Getting Cloud Server by Name

```PowerShell
Get-VBRCloudServer -Name "Hyper-V Silver"
This command returns cloud server named "Hyper-V Silver".
```
> Example 2.  Getting Cloud Servers of Selected Cloud Service Provider

$cloudProvider = Get-VBRCloudProvider -Name "104.45.95.227"
Get-VBRCloudServer -CloudProvider $cloudProvider
This example shows how to return cloud servers of the server provider with the 104.45.95.227 IP address.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $cloudProvider variable.
2. Run the Get-VBRCloudServer cmdket. Set the $cloudProvider variable as the CloudProvider parameter value.

---

### Parameters
#### **CloudProvider**
Specifies the array of the  cloud providers. The cmdlet will return the hosts that are provided to you by these providers. Accepts the VBRCloudProvider[] object.  To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRCloudProvider[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies the array of the IDs of the host you want to get. The cmdlet will return the hosts with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies the array of the host names you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudProvider[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudServer -CloudProvider <VBRCloudProvider[]> [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudServer -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRCloudServer -Name <String[]> [<CommonParameters>]
```
