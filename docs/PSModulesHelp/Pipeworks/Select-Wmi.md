Select-Wmi
----------

### Synopsis
Queries WMI as a datastore

---

### Description

Select-WMI pulls data from the WMI repository and fixes the typename, which allows for the full use

---

### Related Links
* [Update-Wmi](Update-Wmi)

---

### Examples
> EXAMPLE 1

```PowerShell
Select-Wmi -WQL "SELECT * From Win32_ComputerSystem"
```

---

### Parameters
#### **WQl**
The WQL used to query the object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Namespace**
The namespace that is being queried

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **ComputerName**
A list of computers to connect to

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ClassName**
The namespace that is being queried

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Filter**
The query filter

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **Sort**
If provided, the object will be sorted

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSObject[]]`|false   |named   |false        |

#### **Descending**
If set, the sort order will be descending instead of ascending

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Select-Wmi [[-Namespace] <String>] [-ComputerName <String[]>] [-Sort <PSObject[]>] [-Descending] [<CommonParameters>]
```
```PowerShell
Select-Wmi [-WQl] <String> [[-Namespace] <String>] [-ComputerName <String[]>] [-Sort <PSObject[]>] [-Descending] [<CommonParameters>]
```
```PowerShell
Select-Wmi [[-Namespace] <String>] [-ComputerName <String[]>] -ClassName <String> [[-Filter] <String>] [-Sort <PSObject[]>] [-Descending] [<CommonParameters>]
```
