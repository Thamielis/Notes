Get-NcNameServiceCacheSettings
------------------------------

### Synopsis
Retrieves a global nameservice cache setting

---

### Description

Retrieves a global nameservice cache setting. This cmdlet is supported with Rest.

---

### Related Links
* [Set-NcNameServiceCacheSettings](Set-NcNameServiceCacheSettings)

---

### Examples
> Example 1

```PowerShell
Get-NcNameServiceCacheSettings
EvictionTimeInterval : PT4H
RemoteFetchEnabled   : True
NcController         : 172.20.4.20

```

---

### Parameters
#### **EvictionTimeInterval**
Specifies the time interval, in ISO 8601 format after which a periodic cache eviction happens. Default is 4 hours.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **RemoteFetchEnabled**
Indicates whether or not a node is allowed to fetch the data from a remote node.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcNameServiceCacheSettings -Template, to get an empty nameservice cache settings object for use with advanced queries involving the Attributes like $b = Get-NcNameServiceCacheSettings -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcNameServiceCacheSettings -Template, to get an empty nameservice cache settings object for use with advanced queries involving the Attributes like $b = Get-NcNameServiceCacheSettings -Query $a.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[NameServiceCacheSettings]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Nameservice.NameServiceCacheSettings, to get an empty nameservice cache settings object for use with advanced queries involving the Attributes like $b = Get-NcNameServiceCacheSettings -Attributes $a.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[NameServiceCacheSettings]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NameServiceCacheSettings

---

### Notes
Category: Nameservice
Api: /api/name-services/cache/setting
Family: cluster

---

### Syntax
```PowerShell
Get-NcNameServiceCacheSettings [[-EvictionTimeInterval] <string>] [-RemoteFetchEnabled <Boolean>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceCacheSettings -Template <DataONTAP.C.Types.Nameservice.NameServiceCacheSettings> [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceCacheSettings -Query <NameServiceCacheSettings> [<CommonParameters>]
```
```PowerShell
Get-NcFcpServiceMetrics [-Attributes <NameServiceCacheSettings>] [<CommonParameters>]
```
