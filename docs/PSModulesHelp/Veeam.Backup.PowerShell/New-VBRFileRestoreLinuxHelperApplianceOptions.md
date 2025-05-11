New-VBRFileRestoreLinuxHelperApplianceOptions
---------------------------------------------

### Synopsis
Defines configuration settings for a temporary helper appliance.

---

### Description

This cmdlet defines configuration settings for a temporary helper appliance.

---

### Examples
> Example 1

$server = Get-VBRServer -Name "ESXi01"
$resoursepool = Find-VBRViResourcePool -Server $server -Name "Servers"
$helper = New-VBRFileRestoreLinuxHelperApplianceOptions -Server $server -ResourcePool $resoursepool
This example shows how to define settings for a temporary helper appliance for file restore from a CDP replica. The helper appliance will be deployed on the ESXi01 ESXi host in the Servers resource pool.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViResourcePool cmdlet. Specify the Name parameter value. Set the $server variable as the Server parameter value.
3. Run the New-VBRFileRestoreLinuxHelperApplianceOptions cmdlet. Set the $server variable as the Server parameter value. Set the $resoursepool variable as the ResourcePool parameter value.

---

### Parameters
#### **AlternateDNSServer**
Specifies the IPv4 address of the alternate DNS server in the network where the helper appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **EnableFTP**
Enables the FTP access to the restored file system.
If you provide this parameter, users will be able to access the helper appliance over FTP, browse the file system of the restored VM and download necessary files on their own.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FromNSS**
Defines that the cmdlet will deploy a specific appliance that supports the Novell Storage Services file system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Gateway**
Specifies the IPv4 address of the DNS server in the network where the helper appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IP**
Specifies the IPv4 address that you want to assign to the helper appliance.
Note: The helper appliance must be placed in the same network where the backup server resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6**
Specifies the IPv6 address that you want to assign to the helper appliance.
Note: The helper appliance must be placed in the same network where the backup server resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6AlternateDNSServer**
Specifies the IPv6 address of the alternate DNS server in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6Gateway**
Specifies the IPv6 address of the default gateway in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PreferredDNSServer**
Specifies the IPv6 address of the DNS server in the network where the helper appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PrefixLength**
For the IPv6 addresses specified.
Specifies the length of the IPv6 prefix.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **NetworkInfo**
Specifies the network settings for the helper appliance.
Note:
* The helper appliance must be placed in the same network where the backup server resides.
* If you do not provide this parameter, the cmdlet will apply the VM network settings for the helper appliance.
Accepts the IVBRServerNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[IVBRServerNetworkInfo]`|false   |named   |False        |

#### **NetworkMask**
For the IP parameter specified.
Specifies the network mask that you want to assign to the helper appliance.
Note: The helper appliance must be placed in the same network where the backup server resides.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PreferredDNSServer**
Specifies the IPv4 address of the alternate DNS server in the network where the helper appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **ResourcePool**
Specifies the resource pool to which the helper appliance must be placed.
Accepts the CViResourcePoolItem object. To get this object, run the Find-VBRViResourcePool cmdlet.

|Type                   |Required|Position|PipelineInput        |
|-----------------------|--------|--------|---------------------|
|`[CViResourcePoolItem]`|false   |named   |True (ByPropertyName)|

#### **Server**
Specifies the ESXi host on which the temporary helper appliance must be registered.
Note: If you specify a host for the Novell file system proxy appliance, make sure that it allows running VMs with 64-bit guest OSes.
Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[CHost]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

Veeam.Backup.Core.Infrastructure.CViResourcePoolItem

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRFileRestoreLinuxHelperApplianceOptions [-AlternateDNSServer <IPAddress>] [-EnableFTP] [-FromNSS] [-Gateway <IPAddress>] [-IP <IPAddress>] [-IPv6 <IPAddress>] [-IPv6AlternateDNSServer <IPAddress>] 
```
```PowerShell
[-IPv6Gateway <IPAddress>] [-IPv6PreferredDNSServer <IPAddress>] [-IPv6PrefixLength <Int32>] [-NetworkInfo <IVBRServerNetworkInfo>] [-NetworkMask <String>] [-PreferredDNSServer <IPAddress>] [-ResourcePool 
```
```PowerShell
<CViResourcePoolItem>] -Server <CHost> [<CommonParameters>]
```
