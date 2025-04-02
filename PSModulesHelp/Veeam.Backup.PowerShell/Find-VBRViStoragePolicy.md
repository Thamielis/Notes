Find-VBRViStoragePolicy
-----------------------

### Synopsis
Looks for VMware storage policy profiles.

---

### Description

This cmdlet returns VMware storage policy profiles created on a vCenter Server.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

---

### Examples
> Example 1. Looking for all Storage Policy Profiles

$server = Get-VBRServer -Type ESXi -Name "tech.local"
Find-VBRViStoragePolicy -Server $server
This example shows how to get a list of all storage policy profiles registered for the tech.local host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViStoragePolicy cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Looking for Storage Policy Profile by its Name

$server = Get-VBRServer -Type ESXi -Name "tech.local"
Find-VBRViStoragePolicy -Server $server -Name "Virtual SAN Default Storage Policy"
This example shows how to get the Virtual SAN Default Storage Policy storage policy profile registered for the tech.local host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViStoragePolicy cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value.
> Example 3. Looking for Storage Policy Profile by its ID

$server = Get-VBRServer -Type ESXi -Name "tech.local"
Find-VBRViStoragePolicy -Server $server -Id "4da512dc-dee7-465b-a507-72d44a9ba752"
This example shows how to get the 4da512dc-dee7-465b-a507-72d44a9ba752 storage policy profile registered for the tech.local host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViStoragePolicy cmdlet. Set the $server variable as the Server parameter value. Specify the Id parameter value.

---

### Parameters
#### **Datastore**
Specifies a datastore. The cmdlet will return storage policy profiles compatible with this datastore.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **Id**
Specifies an array of storage policy profile IDs. The cmdlet will return profiles with these IDs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Name**
Specifies an array of storage policy profile names. The cmdlet will return profiles with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies the vCenter Server where the storage policy profiles are created.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRViStoragePolicy [-Datastore <VBRViDatastoreBase>] [-Id <String[]>] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Find-VBRViStoragePolicy [-Datastore <VBRViDatastoreBase>] [-Name <String[]>] -Server <CHost> [<CommonParameters>]
```
