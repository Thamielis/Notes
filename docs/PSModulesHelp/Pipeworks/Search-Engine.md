Search-Engine
-------------

### Synopsis
Searches the web, using various engines

---

### Description

Searches the web, using Bing or Google.

---

### Related Links
* [Get-Web](Get-Web)

---

### Examples
> EXAMPLE 1

```PowerShell
Search-Engine "Start-Automating"
```
> EXAMPLE 2

```PowerShell
Search-Engine "Start-Automating" -Google
```

---

### Parameters
#### **Query**
The query

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **SearchService**
The query
Valid Values:

* Web
* Image
* Video
* News

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |named   |true (ByValue, ByPropertyName)|

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

#### **Google**
If set, will search using google

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **GoogleCustomSearchSetting**
The Google Custom Search Api Key Setting.  This SecureSetting must contain the Google Search Api Key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GoogleCustomSearchApiKey**
The Google Custom Search Api Key.  If this is not provided, then the AzureDataMarketSetting, or it's default value, will be used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GoogleCustomSearchIdSetting**
The Azure Data Market Key Or Setting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GoogleCustomSearchId**
The Azure Data Market Key.  If this is not provided, then the AzureDataMarketSetting, or it's default value, will be used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WolframAlpha**
If set, will search using Wolfram|Alpha

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **PodState**
The WolframAlpha pod state to return

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PodId**
The PodID of interest

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WolframAlphaAPiKey**
The Wolfram|Alpha API Key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WolframAlphaAPiKeySetting**
The Wolfram|Alpha API Key Setting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AsJob**
If set, will run in the background

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
If set, will always refetch the data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
Using Bing requires you to sign up for the Azure Data Market.  

It is recommended that you use the default secure setting to store your data market key, AzureDataMarketAccountKey

Using Google requires you sign up for the custom search api, and providing a custom search id

---

### Syntax
```PowerShell
Search-Engine [-Query] <String> [-SearchService <String>] [-AzureDataMarketSetting <String>] [-AzureDataMarketAccountKey <String>] [-AsJob] [-Force] [<CommonParameters>]
```
```PowerShell
Search-Engine [-Query] <String> -Google [-GoogleCustomSearchSetting <String>] [-GoogleCustomSearchApiKey <String>] [-GoogleCustomSearchIdSetting <String>] [-GoogleCustomSearchId <String>] [-AsJob] [-Force] [<CommonParameters>]
```
```PowerShell
Search-Engine [-Query] <String> -WolframAlpha [-PodState <String>] [-PodId <String>] [-WolframAlphaAPiKey <String>] [-WolframAlphaAPiKeySetting <String>] [-AsJob] [-Force] [<CommonParameters>]
```
