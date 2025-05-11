Get-VBRCloudServerNetworkInfo
-----------------------------

### Synopsis
Returns networks available in your cloud resources.

---

### Description

This cmdlet returns networks that are allocated to you by your cloud resources.

---

### Related Links
* [Get-VBRCloudServer](Get-VBRCloudServer)

---

### Examples
> Example 1. Getting Network by Name

```PowerShell
Get-VBRCloudServerNetworkInfo -Name "Lab Isolated Network"
This command looks for a network by name.
```
> Example 2. Getting Networks Connected to Selected Cloud Server

$cloudServer = Get-VBRCloudServer -Name "Hyper-V Silver"
Get-VBRCloudServerNetworkInfo -CloudServer $cloudServer
This example shows how to return networks connected to a selected cloud server.

Perform the following steps:
1. Run the Get-VBRCloudServer cmdlet. Specify the Name parameter value. Save the result to the $cloudServer variable.
2. Run the Get-VBRCloudServerNetworkInfo cmdlet. Set the $cloudServer variable as the CloudServer parameter value.

---

### Parameters
#### **CloudServer**
Specifies the cloud server.  The cmdlet will return networks connected to this server. Accepts the VBRCloudServer[] object.  To get this object, run the Get-VBRCloudServer cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRCloudServer[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies the ID of the network you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the name of the network you want to get.

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
Get-VBRCloudServerNetworkInfo [-CloudServer <VBRCloudServer[]>] [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudServerNetworkInfo [-Id <Guid[]>] [-Name <String[]>] [<CommonParameters>]
```
