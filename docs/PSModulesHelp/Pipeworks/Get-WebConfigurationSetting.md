Get-WebConfigurationSetting
---------------------------

### Synopsis
Gets settings from web configuration

---

### Description

Gets appSettings from web configuration file

---

### Related Links
* [ConvertTo-ModuleService](ConvertTo-ModuleService)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-WebConfigurationSetting "MySetting"
```

---

### Parameters
#### **Setting**
The name of the setting

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Name   |

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
Get-WebConfigurationSetting [-Setting] <String> [<CommonParameters>]
```
