Get-VBRHvVssProvider
--------------------

### Synopsis
Returns VSS providers.

---

### Description

This cmdlet returns an array of VSS providers that are available on Microsoft Hyper-V hosts.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Getting all VSS Providers

$server = Get-VBRServer -Name hyperv09.tech.local
Get-VBRHvVssProvider -Server $server
This example shows how to get all VSS providers that are available on the hyperv09.tech.local Microsoft Hyper-V host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvVssProvider cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Getting VSS Provider by Name

$server = Get-VBRServer -Name hyperv09.tech.local
Get-VBRHvVssProvider -Server $server -Name "Microsoft CSV Shadow Copy Helper Provider"
This example shows how to get the Microsoft CSV Shadow Copy Helper Provider VSS provider that is available on the hyperv09.tech.local Microsoft Hyper-V host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvVssProvider cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value.
> Example 3. Getting VSS Provider by ID

$server = Get-VBRServer -Name hyperv09.tech.local
Get-VBRHvVssProvider -Server $server -Id "6ca4d514-5f94-4913-800c-48fc0d87c75c"
This example shows how to get the 6ca4d514-5f94-4913-800c-48fc0d87c75c VSS provider that is available on the hyperv09.tech.local Microsoft Hyper-V host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvVssProvider cmdlet. Set the $server variable as the Server parameter value. Specify the Id parameter value.

---

### Parameters
#### **Id**
Specifies an ID of a VSS provider. The cmdlet will return the VSS provider with this ID.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[Guid]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies a name of a VSS provider. The cmdlet will return the VSS provider with this name.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Server**
Specifies a Microsoft Hyper-V host added to the backup infrastructure. The cmdlet will return VSS providers that are available on this Microsoft Hyper-V host.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

System.String

System.Guid

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRHvVssProvider [-Id <Guid>] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Get-VBRHvVssProvider [-Name <String>] -Server <CHost> [<CommonParameters>]
```
