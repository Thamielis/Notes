Set-NcNameServiceCacheSettings
------------------------------

### Synopsis
Updates a global nameservice cache setting.

---

### Description

Updates a global nameservice cache setting.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcNameServiceCacheSettings](Get-NcNameServiceCacheSettings)

---

### Examples
> Example 1

Set-NcNameServiceCacheSettings -EvictionTimeInterval PT10H -RemoteFetchEnabled $true
EvictionTimeInterval RemoteFetchEnabled NcController
-------------------- ------------------ ------------
PT10H                              True 172.21.93.69

---

### Parameters
#### **EvictionTimeInterval**
Specifies the name of the aggregate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **RemoteFetchEnabled**
Indicates whether or not a node is allowed to fetch the data from a remote node.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[bool]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NameServiceCacheSettings

---

### Notes
Category: Nameservice
Api: /name-services/cache/setting
Family: Controller

---

### Syntax
```PowerShell
Set-NcNameServiceCacheSettings [[-EvictionTimeInterval] <String>] [-RemoteFetchEnabled <bool>] [<CommonParameters>]
```
