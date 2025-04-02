Add-VBRIsilonHost
-----------------

### Synopsis
Adds Dell PowerScale (formerly Isilon) storage systems to Veeam Backup & Replication.

---

### Description

This cmdlet adds selected Dell PowerScale storage systems to the backup infrastructure.
When you add storage systems to your backup infrastructure, Veeam Backup & Replication performs a rescan of storage systems. During the rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
For more information about the rescan, see the Adding Storage Systems section of the User Guide for VMware vSphere.
Tip:  Provide the SkipRescan parameter to skip the automatic rescan.
To rescan storage systems manually, use the following cmdlets:
- Run the Sync-VBRIsilonHost cmdlet to rescan of the entire storage system.
- Run the Sync-VBRIsilonVolume cmdlet to rescan selected Dell VNX volumes added to backup infrastructure.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding Dell PowerScale Storage by Username and Password

```PowerShell
Add-VBRIsilonHost -Name 172.16.21.105 -UserName "Isilon Administrator" -Password "SecurePa$$w0rd"
This command adds the Isilon Administrator Dell PowerScale storage system by specifying username and password.
```
> Example 2. Adding Dell PowerScale Storage System Using Credentials

$credentials = Get-VBRCredentials -Name "Isilon Administrator"
Add-IsilonHost -Name 172.16.21.105 -Credentials $credentials -Proxy $proxy
This example shows how to add the Isilon Administrator Dell PowerScale storage system to the backup infrastructure using credentials.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
2. Run the Add-IsilonHost cmdlet. Specify the Name parameter value. Set the $credentials variable as the Credentials parameter value. Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the storage.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a Dell PowerScale without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the storage IP address or DNS name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **NASCreateRulesAutomatically**
Defines that the cmdlet will allow Veeam Backup & Replication to automatically create required SMB and NFS export rules on the storage system.
If you provide this parameter, the rules will be created automatically in case the proxies are unavailable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NASNFS**
Defines that the storage will work over the NFS protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NASProxy**
Specifies the array of proxies you want to use.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **NASSMB**
Defines that the storage will work over the SMB protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Port**
Sets a port used to connect to the PowerScale storage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SkipRescan**
Defines that the cmdlet will not start the storage rescan automatically after you add storage systems to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UserName**
Specifies the user name that you want to use for authentication to the storage.

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
Add-VBRIsilonHost -Credentials <CInternalCredentials> [-Description <String>] [-Force] -Name <String> [-NASCreateRulesAutomatically] [-NASNFS] [-NASProxy <VBRNASProxyServer[]>] [-NASSMB] [-Port <Int32>] 
```
```PowerShell
[-SkipRescan] [<CommonParameters>]
```
```PowerShell
Add-VBRIsilonHost [-Description <String>] [-Force] -Name <String> [-NASCreateRulesAutomatically] [-NASNFS] [-NASProxy <VBRNASProxyServer[]>] [-NASSMB] -Password <String> [-Port <Int32>] [-SkipRescan] -UserName 
```
```PowerShell
<String> [<CommonParameters>]
```
