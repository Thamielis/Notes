Get-DSPamScanConfiguration
--------------------------

### Synopsis
Get the PAM scan configurations

---

### Description

Get the PAM scan configurations, which can be filtered by name.  Use the 'Name' parameter for wildcard searches, and the 'LiteralName' parameter for exact matches as it doesn't interpret characters as wildcards.

---

### Related Links
* [Get-DSPamScanResult](Get-DSPamScanResult)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $configurations = Get-DSPamScanConfiguration -Name 'Config*'
Get all PAM scan configurations with names starting with 'Config'
```
> EXAMPLE 2

```PowerShell
PS C:\> $configuration = Get-DSPamScanConfiguration -LiteralName 'Config [A]'
Get the PAM scan configuration named 'Config [A]'. The 'LiteralName' parameter ensures that the characters '[' and ']' are not treated as wildcards.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive search

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LiteralName**
Filter the scan configurations by their name. No characters will be interpreted as wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Name**
Filter the scan configurations by their name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.NetworkDiscovery.Dto.ScanConfigurationDto[]

---

### Notes
For more information, type "Get-Help Get-DSPamScanConfiguration -detailed". For technical information, type "Get-Help Get-DSPamScanConfiguration -full".

---

### Syntax
```PowerShell
Get-DSPamScanConfiguration [[-Name] <String>] [-CaseSensitive] [<CommonParameters>]
```
```PowerShell
Get-DSPamScanConfiguration [-LiteralName] <String> [-CaseSensitive] [<CommonParameters>]
```
