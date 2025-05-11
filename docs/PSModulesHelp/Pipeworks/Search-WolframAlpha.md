Search-WolframAlpha
-------------------

### Synopsis
Searches Wolfram Alpha

---

### Description

Searches Wolfram Alpha for information on anything

---

### Related Links
* [Get-SecureSetting](Get-SecureSetting)

* [Search-Engine](Search-Engine)

---

### Examples
> EXAMPLE 1

```PowerShell
Search-WolframAlpha -For "Micrososft" -ApiKeySetting WolframAlphaApiKey
```

---

### Parameters
#### **For**
The term to search for.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **PodState**
The WolframAlpha pod state to return

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **PodId**
The PodID of interest

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **AsHtml**
If set, renders output as HTML

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsMathematicaInput**
If set, renders the output as input to Mathemetica

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsMathematicaOutput**
If set, renders the output as output to Mathemetica

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsMathML**
If set, renders the output as MathML

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FromIP**
Requests information as if the user was from a specific IP

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Location**
Requests information as if the user was from a specific location

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **AsXml**
Returns the XML result

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ApiKey**
The API Key

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **ApiKeySetting**
A web.config or SecureSetting containing the ApiKey

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **AsJob**
If set, will run the query as a background job

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

### Syntax
```PowerShell
Search-WolframAlpha [-For] <String> [[-PodState] <String>] [[-PodId] <String>] [-AsHtml] [-AsMathematicaInput] [-AsMathematicaOutput] [-AsMathML] [[-FromIP] <String>] [[-Location] <String>] [-AsXml] [[-ApiKey] <String>] [[-ApiKeySetting] <String>] [-AsJob] [-Force] [<CommonParameters>]
```
