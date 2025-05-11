Find-VBRvCloudEntity
--------------------

### Synopsis
Looks for Cloud Director entities.

---

### Description

This cmdlet looks for Cloud Director entities. Use this cmdlet to get Cloud Director entities from the Service Provider's Veeam backup server.

To get Cloud Director entities from the Tenant Veeam Backup & Replication, use the following cmdlets:
- Run the Get-VBRvCDCloudOrganizationvDC cmdlet to get the organization VDC.
- Run the Get-VBRvCDCloudStoragePolicy cmdlet to get the Cloud Director storage policy.
- Run the Get-VBRvCDCloudvApp cmdlet to get Cloud Director vApps.
- Run the Get-VBRvCDCloudOrganizationUser cmdlet to get the organization users.
Important: - This cmdlet works from the Service Provider side only.
- The cmdlet will not return users with administrator roles.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1

$server = Get-VBRServer -Name "172.16.1.13"
Find-VBRvCloudEntity -Server $server -Full
This example shows how to look for all vCloud entities registered on the server.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Run the Find-VBRvCloudEntity cmdlet. Set the $server variable as the Server parameter value. Provide the Full parameter.
> Example 2

$server = Get-VBRServer -Name "172.16.1.13"
Find-VBRvCloudEntity -Server $server -Name *SQL*
This example shows how to look for the particular vCloud entity.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRvCloudEntity cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value.
> Example 3

$server = Get-VBRServer -Name "Cloud Server"
Find-VBRvCloudEntity -Server $server -VApp
This example shows how to get the vApps on the particular vCloud entity.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRvCloudEntity cmdlet. Set the $server variable as the Server parameter value. Provide the VApp parameter.
> Example 4

$server = Get-VBRServer -Name "Cloud Server"
Find-VBRvCloudEntity -Server $server -Datastore -Name "Datastore 04"
This example shows how to get the datastore on the particular vCloud entity.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRvCloudEntity cmdlet. Set the $server variable as the Server parameter value. Provide the Datastore parameter. Specify the Name parameter value.
> Example 5

```PowerShell
Find-VBRvCloudEntity -OrganizationVdc
This command gets all Organization DCs.
```

---

### Parameters
#### **Datastore**
Defines that the cmdlet will return only datastores.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EntityRef**
Specifies one of the following Cloud Director entities:
* VM
* vApp
* OrganizationVDC
* Organization
The cmdlet will return these entities.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Full**
Defines that the cmdlet will return only Cloud Director entities.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the array of Cloud Director entity names.
The cmdlet will return entities with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Organization**
Defines that the cmdlet will return only Organizations.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OrganizationUser**
Defines that the cmdlet will return only Organization users.
Note: The cmdlet will not return users with administrator roles.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OrganizationVdc**
Defines that the cmdlet will return only organization VDCs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the array of servers. The cmdlet will return Cloud Director entities located on these servers.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **StorageProfile**
Defines that the cmdlet will return only storage profiles.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Template**
Defines that the cmdlet will return only vApp templates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VApp**
Defines that the cmdlet will return only vApps.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Vc**
Defines that the cmdlet will return only vCenter Servers managed by Cloud Director.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Vm**
Defines that the cmdlet will return only VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VmTemplate**
Defines that the cmdlet will return only VM templates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Common.CHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRvCloudEntity [-Datastore] [-EntityRef <String>] [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Full] [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-Organization] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-OrganizationUser] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-OrganizationVdc] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-Server <CHost[]>] [-StorageProfile] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-Server <CHost[]>] [-Template] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-Server <CHost[]>] [-VApp] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-Server <CHost[]>] [-Vc] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-Server <CHost[]>] [-Vm] [<CommonParameters>]
```
```PowerShell
Find-VBRvCloudEntity [-EntityRef <String>] [-Name <String[]>] [-Server <CHost[]>] [-VmTemplate] [<CommonParameters>]
```
