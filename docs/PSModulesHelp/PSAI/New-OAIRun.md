New-OAIRun
----------

### Synopsis

New-OAIRun [[-ThreadId] <Object>] [[-AssistantId] <Object>] [[-Model] <Object>] [[-Instructions] <Object>] [[-AdditionalInstructions] <Object>] [[-AdditionalMessages] <Object>] [[-Tools] <Object>] [[-Metadata] <Object>] [[-Temperature] <Object>] [[-TopP] <Object>] [[-MaxPromptTokens] <Object>] [[-MaxCompletionTokens] <Object>] [[-TruncationStrategy] <Object>] [[-ToolChoice] <Object>] [[-ResponseFormat] <Object>] [-Stream] [<CommonParameters>]

---

### Description

---

### Parameters
#### **AdditionalInstructions**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **AdditionalMessages**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **AssistantId**

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |true (ByPropertyName)|id     |

#### **Instructions**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **MaxCompletionTokens**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |11      |false        |

#### **MaxPromptTokens**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |

#### **Metadata**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **Model**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **ResponseFormat**

Valid Values:

* auto
* json
* text

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |14      |false        |

#### **Stream**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Temperature**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **ThreadId**

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[Object]`|false   |0       |true (ByPropertyName)|thread_id|

#### **ToolChoice**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |13      |false        |

#### **Tools**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **TopP**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **TruncationStrategy**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |12      |false        |

---

### Inputs
System.Object

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=New-OAIRun; CommonParameters=True; parameter=System.Object[]}}
```
