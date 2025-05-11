Get-Translation
---------------

### Synopsis
Translates text

---

### Description

Translates text, using Bing Translator

---

### Related Links
* [Get-Web](Get-Web)

* [http://bing.com/Translator/](http://bing.com/Translator/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Translation "Start-Automating"
```
> EXAMPLE 2

```PowerShell
Get-Translation "Hello World" -To "German"
```

---

### Parameters
#### **Text**
The text to be translated

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **To**
The language to translate to

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **From**
The language text will be translated from

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AzureDataMarketSetting**
The Azure Data Market Key Or Setting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AzureDataMarketAccountKey**
The Azure Data Market Key.  If this is not provided, then the AzureDataMarketSetting, or it's default value, will be used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
It is recommended that you use the default secure setting to store your data market key, AzureDataMarketAccountKey

---

### Syntax
```PowerShell
Get-Translation [-Text] <String> [-To <String>] [-From <String>] [-AzureDataMarketSetting <String>] [-AzureDataMarketAccountKey <String>] [<CommonParameters>]
```
