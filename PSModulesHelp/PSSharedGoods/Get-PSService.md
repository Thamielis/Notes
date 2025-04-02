Get-PSService
-------------

### Synopsis
Alternative way to Get-Service

---

### Description

Alternative way to Get-Service which works using CIM queries

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSService -ComputerName AD1, AD2, AD3, AD4 -Service 'Dnscache', 'DNS', 'PeerDistSvc', 'WebClient', 'Netlogon'
```
> EXAMPLE 2

```PowerShell
Get-PSService -ComputerName AD1, AD2 -Extended
```
> EXAMPLE 3

```PowerShell
Get-PSService
```
> EXAMPLE 4

```PowerShell
Get-PSService -Extended
```

---

### Parameters
#### **ComputerName**
ComputerName(s) to query for services

|Type        |Required|Position|PipelineInput|Aliases               |
|------------|--------|--------|-------------|----------------------|
|`[String[]]`|false   |1       |false        |Computer<br/>Computers|

#### **Protocol**
Protocol to use to gather services
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Service**
Limit output to just few services

|Type        |Required|Position|PipelineInput|Aliases |
|------------|--------|--------|-------------|--------|
|`[String[]]`|false   |3       |false        |Services|

#### **All**
Return all data without filtering

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Extended**
Return more data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-PSService [[-ComputerName] <String[]>] [[-Protocol] <String>] [[-Service] <String[]>] [-All] [-Extended] [<CommonParameters>]
```
