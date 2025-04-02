Find-VBRViDatastore
-------------------

### Synopsis
Looks for VMware datastores.

---

### Description

This cmdlet looks for VMware datastores connected to the specified ESXi host or that are compatible with a particular VMware storage policy profile.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViStoragePolicy](Find-VBRViStoragePolicy)

---

### Examples
> Example 1. Looking for VMware Datastores Connected to Specific ESXi Host

$server = Get-VBRServer -Type ESXi -Name "esx05.tech.local"
Find-VBRViDatastore -Server $server
This example shows how to get a list of datastores connected to the esx05.tech.local ESXi hosts.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViDatastore cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Looking for VMware Datastores Compatible with Specific Storage Policy Profiles

$server = Get-VBRServer -Type ESXi -Name "esx05.tech.local"
$policy = Find-VBRViStoragePolicy -Server $server -Name "SP Virtual SAN Default"
Find-VBRViDatastore -StoragePolicy $policy -Name "MSExchange", "LocalStore_0*"
This example shows how to get the list of the MSExchange datastores and datastores which names start with LocalStore_0*. These datastores are compatible with the SP Virtual SAN Default storage policy profile.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViStoragePolicy cmdlet. Specify the Server and Name parameter values. Save the result to the $policy variable.
3. Run the Find-VBRViDatastore cmdlet. Set the $policy variable as the StoragePolicy parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies an array of datastores names. The cmdlet will return datastores with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies an ESXi host. The cmdlet will return datastores connected to this host.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **StoragePolicy**
Specifies the VMware storage policy profile. The cmdlet will return datastores compatible with this profile.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRViStoragePolicy]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

Veeam.Backup.PowerShell.Infos.VBRViStoragePolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRViDatastore [-Name <String[]>] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Find-VBRViDatastore [-Name <String[]>] -StoragePolicy <VBRViStoragePolicy> [<CommonParameters>]
```
