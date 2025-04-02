Get-WinADForestDetails
----------------------

### Synopsis
Get details about Active Directory Forest, Domains and Domain Controllers in a single query

---

### Description

Get details about Active Directory Forest, Domains and Domain Controllers in a single query

---

### Examples
> EXAMPLE 1

```PowerShell
Get-WinADForestDetails | Format-Table
```
> EXAMPLE 2

```PowerShell
Get-WinADForestDetails -Forest 'ad.evotec.xyz' | Format-Table
```

---

### Parameters
#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ExcludeDomainControllers**
Exclude specific domain controllers, by default there are no exclusions, as long as VerifyDomainControllers switch is enabled. Otherwise this parameter is ignored.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **IncludeDomainControllers**
Include only specific domain controllers, by default all domain controllers are included, as long as VerifyDomainControllers switch is enabled. Otherwise this parameter is ignored.

|Type        |Required|Position|PipelineInput|Aliases                           |
|------------|--------|--------|-------------|----------------------------------|
|`[String[]]`|false   |5       |false        |DomainControllers<br/>ComputerName|

#### **SkipRODC**
Skip Read-Only Domain Controllers. By default all domain controllers are included.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Filter**
Filter for Get-ADDomainController

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **TestAvailability**
Check if Domain Controllers are available

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Test**
Pick what to check for availability. Options are: All, Ping, WinRM, PortOpen, Ping+WinRM, Ping+PortOpen, WinRM+PortOpen. Default is All
Valid Values:

* All
* Ping
* WinRM
* PortOpen
* Ping+WinRM
* Ping+PortOpen
* WinRM+PortOpen

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **Ports**
Ports to check for availability. Default is 135

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |8       |false        |

#### **PortsTimeout**
Ports timeout for availability check. Default is 100

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |9       |false        |

#### **PingCount**
How many pings to send. Default is 1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |10      |false        |

#### **PreferWritable**
Prefer writable domain controllers over read-only ones when returning Query Servers

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Extended**
Return extended information about domains with NETBIOS names

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |11      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-WinADForestDetails [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-ExcludeDomainControllers] <String[]>] [[-IncludeDomains] <String[]>] [[-IncludeDomainControllers] <String[]>] [-SkipRODC] [[-Filter] <String>] [-TestAvailability] [[-Test] <Object>] [[-Ports] <Int32[]>] [[-PortsTimeout] <Int32>] [[-PingCount] <Int32>] [-PreferWritable] [-Extended] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
