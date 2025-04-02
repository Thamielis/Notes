Get-PSAdapter
-------------

### Synopsis
Gets PSAdapter types and modules.

---

### Description

Gets PSAdapter CmdletAdapter types and the modules that use them.

CmdletAdapters can be used to create custom cmdlets that adapt to different data sources.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSAdapter
```
> EXAMPLE 2

```PowerShell
Get-PSAdapter -PSAdapterType Type
```
> EXAMPLE 3

```PowerShell
Get-PSAdapter -PSAdapterType Module
```
> EXAMPLE 4

```PowerShell
Get-PSAdapter -PSAdapterType File
```

---

### Parameters
#### **PSAdapterType**
The type of PSAdapter to get.  Can be file, module, or type.
Valid Values:

* File
* Module
* Type

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

---

### Syntax
```PowerShell
Get-PSAdapter [-PSAdapterType <String[]>] [<CommonParameters>]
```
