Get-VBRViCloudVM
----------------

### Synopsis
Returns VMs available in cloud hosts allocated by cloud resources.

---

### Description

Returns VMs available in cloud hosts that are allocated to you by your cloud resources.

---

### Related Links
* [Get-VBRCloudServer](Get-VBRCloudServer)

---

### Examples
> Example 1. Getting all VMs Available in Cloud Host

$cloudserver = Get-VBRCloudServer
Get-VBRViCloudVM -Server $cloudserver
This example shows how to get all VMs available in the cloud host.

Perform the following steps:
1.	Run the Get-VBRCloudServer cmdlet. Save the result to the $cloudserver variable.
2.	Run the Get-VBRViCloudVM cmdlet. Set the $cloudserver variable as the Server parameter value.
> Example 2. Getting VMs Available in Cloud Host by Names

$cloudserver = Get-VBRCloudServer
Get-VBRViCloudVM -Server $cloudserver -Name "srv50", "srv59", "srv45"
This example shows how to get the srv50, srv59, srv45 VMs available in cloud hosts.
Perform the following steps:
1.	Run the Get-VBRCloudServer cmdlet. Save the result to the $cloudserver variable.
2.	Run the Get-VBRViCloudVM cmdlet. Set the $cloudserver variable as the Server parameter value. Specify the Name parameter values.
> Example 3. Getting VMs Available in Cloud Host by ID

$cloudserver = Get-VBRCloudServer
Get-VBRViCloudVM -Server $cloudserver -Id "4ddb76ea-c11f-4c93-9147-06facf7c2186", "d3cff5ea-58f0-4fbd-8f58-87896e755dc5"
This example shows how to get the "4ddb76ea-c11f-4c93-9147-06facf7c2186","d3cff5ea-58f0-4fbd-8f58-87896e755dc5 VMs available in cloud hosts.

Perform the following steps:
1.	Run the Get-VBRCloudServer cmdlet. Save the result to the $cloudserver variable.
2.	Run the Get-VBRViCloudVM cmdlet. Set the $cloudserver variable as the Server parameter value.  Specify the Id parameter values.

---

### Parameters
#### **Id**
Specifies an array of IDs for VMs. The cmdlet will return VMs with these IDs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **Name**
Specifies an array of VM names. The cmdlet will return VMs with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **Server**
Specifies cloud hosts. The cmdlet will return VMs available in these hosts.
Accepts the VBRCloudServer object. To create this object, run the Get-VBRCloudServer cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRCloudServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRViCloudVM -Id <String[]> -Server <VBRCloudServer> [<CommonParameters>]
```
```PowerShell
Get-VBRViCloudVM -Name <String[]> -Server <VBRCloudServer> [<CommonParameters>]
```
