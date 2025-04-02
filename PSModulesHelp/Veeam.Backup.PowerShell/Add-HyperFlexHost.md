Add-HyperFlexHost
-----------------

### Synopsis
Adds Cisco HyperFlex storage systems to the backup infrastructure.

---

### Description

This cmdlet adds the Cisco HyperFlex storage systems to the backup infrastructure.
When you add storage systems to your backup infrastructure, Veeam Backup & Replication performs a rescan of storage systems. During the rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
For more information about the rescan, see the Adding Storage Systems section of the User Guide for VMware vSphere.

Tip
Use the SkipRescan parameter to skip the automatic rescan.
To rescan storage systems manually, run the Sync-HyperFlexHost cmdlet to rescan of the entire storage system.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRViProxy](Get-VBRViProxy)

---

### Examples
> Example 1. Adding Cisco HyperFlex Storage by Username and Password

```PowerShell
Add-HyperFlexHost -Name 192.0.2.1 -UserName "Cisco HX Administrator" -Password "SecurePa$$w0rd"
This command adds the 192.0.2.1 Cisco HyperFlex storage system by specifying user name and password.
```
> Example 2.  Adding Cisco HyperFlex Storage System Using Credentials

$credentials = Get-VBRCredentials -Name "Cisco HX Administrator"
Add-HyperFlexHost -Name 192.0.2.1 -Credentials $credentials
This example shows how to add the 192.0.2.1 Cisco HyperFlex storage system to the backup infrastructure using the Cisco HX Administrator credentials.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
2. Run the Add-HyperFlexHost cmdlet. Specify the Name parameter value. Set the $credentials variable as the Credentials parameter value.

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
Defines that the cmdlet will add a Cisco HyperFlex without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the storage IP address or DNS name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Proxy**
Specifies the array of proxies you want to use with this storage.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IProxy[]]`|false   |named   |False        |

#### **SkipRescan**
Defines that the cmdlet will not start the storage rescan automatically after you add storage systems to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UserName**
Specifies the user name that you want to use for authenticating with the storage.

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
Add-HyperFlexHost -Credentials <CInternalCredentials> [-Description <String>] [-Force] -Name <String> [-Proxy <IProxy[]>] [-SkipRescan] [<CommonParameters>]
```
```PowerShell
Add-HyperFlexHost [-Description <String>] [-Force] -Name <String> -Password <String> [-Proxy <IProxy[]>] [-SkipRescan] -UserName <String> [<CommonParameters>]
```
