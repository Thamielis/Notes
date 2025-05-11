Add-VBRCDPProxy
---------------

### Synopsis
Adds VMware CDP proxies to the backup infrastructure.

---

### Description

This cmdlet adds VMware CDP proxies to the backup infrastructure.
When you add a proxy, you assign the role of the CDP proxy to a Windows-based or Linux-based server.
Note that the server to which you want to set a role of the CDP proxy, must be added to the backup infrastructure.
Run the Add-VBRWinServer cmdlet to add a Microsoft Windows server the backup infrastructure or the Add-VBRLinux cmdlet to add a Linux server.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Adding VMware CDP Proxy with Default Settings

$server = Get-VBRServer -Name "WindowsSRV05"
Add-VBRCDPProxy -Server $server -Description "CDPPRoxy05" -Force
This example shows how to add the WindowsSRV05 server as a VMware CDP proxy.

The proxy will be added with the default settings:
- The cmdlet will run without showing any warning in the PowerShell console.
- The global cache is located in the C:\VeeamCDP folder.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRCDPProxy cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Description parameter value.
- Provide the Force parameter.
> Example 2. Adding VMware CDP Proxy with Custom Cache Settings

$server = Get-VBRServer -Name "WindowsSRV05"
Add-VBRCDPProxy -Server $server -Description "CDPPRoxy05" -CacheSize "20" -CachePath "C:\CDPCache" -Force
This example shows how to add the WindowsSRV05 server as a VMware CDP proxy.

The proxy will be added with the custom global cache settings:
· The global cache size is set to 20 GB.
· The global cache is located in the C:\CDP?ache folder.
· The cmdlet will run without showing any warning in the PowerShell console.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRCDPProxy cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the CacheSize parameter value.
- Specify the CachePath parameter value.
- Specify the Description parameter value.
- Provide the Force parameter.

---

### Parameters
#### **CachePath**
Specifies a path to the folder where you want to keep a global cache.
Default:
* For Microsoft Windows servers: C:\VeeamCDP
* For Linux servers: /VeeamCDP

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CacheSize**
Specifies the cache size for a VMware CDP proxy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |False        |

#### **CacheSizeUnit**
For the CacheSize option.
Specifies the measure unit of the cache size. You can specify one of the following units: GB, TB.
Default: GB.
Valid Values:

* GB
* TB

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupCacheSizeUnit]`|false   |named   |False        |

#### **Description**
Specifies a description.
The cmdlet will add a VMware CDP proxy with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a VMware CDP proxy without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies a server that you want to add as a VMware CDP proxy.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SourceProxyTrafficPort**
Specifies a port number that a source host or cluster will use to communicate with a proxy.
This parameter applies if the proxy that you configure acts as a source proxy.
Permitted values: 30332 to 30339.
Default: 33032.
Note: Do not provide the same port number for the source and target proxy.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **TargetProxyTrafficPort**
Specifies a port number that a source proxy will use to communicate with a target proxy.
This parameter applies if the proxy that you configure acts as a target proxy.
Permitted values: 1 to 65535.
Default: 33033.
Note: Do not provide the same port number for the source and target proxy.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Add-VBRCDPProxy [-CachePath <String>] [-CacheSize <UInt32>] [-CacheSizeUnit {GB | TB}] [-Description <String>] [-Force] -Server <CHost> [-SourceProxyTrafficPort <Int32>] [-TargetProxyTrafficPort <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
