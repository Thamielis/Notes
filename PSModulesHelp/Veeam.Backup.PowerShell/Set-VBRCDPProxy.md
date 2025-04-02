Set-VBRCDPProxy
---------------

### Synopsis
Modifies settings of VMware CDP proxies added to the backup infrastructure.

---

### Description

This cmdlet modifies settings of VMware CDP proxies added to the backup infrastructure.

---

### Related Links
* [Get-VBRCDPProxy](Get-VBRCDPProxy)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Modifying VMware CDP Proxy Cache Size

$proxy = Get-VBRCDPProxy -Name "Proxy05"
Set-VBRCDPProxy -Proxy $proxy -CacheSize "25"
This example shows how to modify a size of the cache that is used by the Proxy05 VMware CDP proxy.

Perform the following steps:
1. Run the Get-VBRCDPProxy cmdlet. Save the result to the $proxy variable.
2. Run the Set-VBRCDPProxy cmdlet. Set the $proxy variable as the Proxy parameter value. Specify the CacheSize parameter value.
> Example 2. Modifying VMware CDP Proxy Cache Location

$proxy = Get-VBRCDPProxy
Set-VBRCDPProxy -Proxy $proxy -CachePath "C:\CacheFolder"
This example shows how to modify a path to the folder where the Proxy05 VMware CDP proxy keeps the cache.

Perform the following steps:
1. Run the Get-VBRCDPProxy cmdlet. Save the result to the $proxy variable.  2. Run the Set-VBRCDPProxy cmdlet. Set the $proxy variable as the Proxy parameter value. Specify the CachePath parameter value.

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
Note: When you specify the cache size, keep in mind the following recommendations:
* You need to allocate 1 GB for each protected VM.
* You need to leave 10 percent of the proxy storage free.

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
Specifies a description for a VMware CDP proxy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify a VMware CDP proxy without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Proxy**
Specifies a VMware CDP proxy.
The cmdlet will modify the settings of this proxy.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[VBRCDPProxy]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SourceProxyTrafficPort**
Specifies the port number of the source proxy.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **TargetProxyTrafficPort**
Specifies the port number of the target proxy.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCDPProxy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCDPProxy [-CachePath <String>] [-CacheSize <UInt32>] [-CacheSizeUnit {GB | TB}] [-Description <String>] [-Force] -Proxy <VBRCDPProxy> [-SourceProxyTrafficPort <Int32>] [-TargetProxyTrafficPort <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
