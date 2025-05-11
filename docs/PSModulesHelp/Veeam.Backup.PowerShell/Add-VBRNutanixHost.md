Add-VBRNutanixHost
------------------

### Synopsis
Adds Nutanix Files storage systems to the backup infrastructure.

---

### Description

This cmdlet adds Nutanix Files storage systems to the backup infrastructure.

When you add storage systems to your backup infrastructure, Veeam Backup & Replication performs rescan of storage systems. During the rescan operation Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure. For more information about rescan, see the Adding Storage Systems (https://helpcenter.veeam.com/docs/backup/vsphere/storage_configure_add_storage.html?ver=120)section of the User Guide for VMware vSphere.

TIP: Provide the SkipRescan parameter to skip the automatic rescan operation.
To rescan storage systems manually, use the following cmdlets:
- Run Sync-VBRNutanixHost to rescan of the entire storage system.
- Run Sync-VBRNutanixVolume to rescan Nutanix Files volumes added to backup infrastructure.

---

### Examples
> Example 1. Adding Nutanix Files Storage Systems by User Name and Password

```PowerShell
Add-VBRNutanixHost -Name 167.16.21.25 -UserName Administrator -Password XXXXXXXXXXX
This command adds Nutanix Files storage systems by user name and password.
```
> Example 2. Adding Nutanix Files Storage Systems by Credentials

$credentials = Get-VBRCredentials -Name *Administrator*
Add-VBRNutanixHost -Name 167.16.21.25 -Credentials $credentials
This example shows how to add Nutanix Files storage systems by credentials.

Perform the following steps: 1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
2. Run the Start-VBRViVirtualDiskRestore cmdlet. Specify the Name parameter value. Set the $credentials variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials that you want to use for authentication to the storage system.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|true    |named   |False        |

#### **Description**
Specifies a description of the storage system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add the storage system without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a storage system IP address or DNS name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **NASCreateRulesAutomatically**
Defines that the cmdlet will allow Veeam Backup & Replication to automatically create required SMB and NFS export rules in the storage system.
If you provide this parameter, the rules will be created automatically in case the proxies are unavailable. If you do not provide the parameter and use the NFS protocol, the rules will not be created, and you must create the rules manually in the Nutanix Files storage system. For the SMB protocol, no actions are required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NASNFS**
Defines that the storage system will work over the NFS protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NASProxy**
Specifies the array of proxies you want to use.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **NASSMB**
Defines that the storage system will work over the SMB protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authentication to the storage system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Port**
Specifies the port used to connect to the  storage system.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SkipRescan**
Defines that the cmdlet will not start storage rescan automatically after you add storage systems to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UserName**
Specifies the user name that you want to use for authentication to the storage system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Add-VBRNutanixHost -Credentials <CInternalCredentials> [-Description <String>] [-Force] -Name <String> [-NASCreateRulesAutomatically] [-NASNFS] [-NASProxy <VBRNASProxyServer[]>] [-NASSMB] [-Port <Int32>] 
```
```PowerShell
[-SkipRescan] [<CommonParameters>]
```
```PowerShell
Add-VBRNutanixHost [-Description <String>] [-Force] -Name <String> [-NASCreateRulesAutomatically] [-NASNFS] [-NASProxy <VBRNASProxyServer[]>] [-NASSMB] -Password <String> [-Port <Int32>] [-SkipRescan] -UserName 
```
```PowerShell
<String> [<CommonParameters>]
```
