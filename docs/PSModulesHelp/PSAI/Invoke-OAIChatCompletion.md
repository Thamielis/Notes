Invoke-OAIChatCompletion
------------------------

### Synopsis
Invokes the OpenAI Chat Completions API.

---

### Description

This function sends a request to the OpenAI Chat Completions API to generate a chat-based completion.

---

### Examples
> EXAMPLE 1

```PowerShell
$messages = @(
    @{
        'role' = 'user'
        'content' = 'Hello, how are you?'
    },
    @{
        'role' = 'assistant'
        'content' = 'I am doing well, thank you!'
    }
)
Invoke-OAIChatCompletion -Messages $messages -Model 'gpt-4o' -MaxTokens 50

This example generates a chat-based completion using the 'gpt-4o' model with a maximum of 50 tokens.
```

---

### Parameters
#### **Messages**
Specifies the list of messages in the conversation. Each message should have a 'role' (either 'system', 'user', or 'assistant') and 'content' (the content of the message).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Model**
Specifies the model to use for generating completions. Default is 'gpt-4o-mini'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **FrequencyPenalty**
Specifies the frequency penalty to apply. Higher values will make the model avoid repeating the same completions. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **LogitBias**
Specifies the logit bias to apply. Positive values will make the model more likely to generate completions similar to the examples in the training set, while negative values will make it less likely. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Logprobs**
Specifies whether to include log probabilities in the response. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **TopLogprobs**
Specifies the number of log probabilities to include in the response. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **MaxTokens**
Specifies the maximum number of tokens to generate in the response. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **N**
Specifies the number of completions to generate. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

#### **PresencePenalty**
Specifies the presence penalty to apply. Higher values will make the model more cautious and avoid generating completions that overlap with the input. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |false        |

#### **ResponseFormat**
Specifies the format of the response. Valid values are 'auto', 'json', or 'text'. Default is not set.
Valid Values:

* auto
* json
* text

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |false        |

#### **Seed**
Specifies the random seed to use for generating completions. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |11      |false        |

#### **Stop**
Specifies the stop sequence to use for generating completions. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |12      |false        |

#### **Stream**
Specifies whether to enable streaming of the API response. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |13      |false        |

#### **StreamOptions**
Specifies the options for streaming. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |14      |false        |

#### **Temperature**
Specifies the temperature to use for generating completions. Higher values will make the output more random, while lower values will make it more deterministic. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |15      |false        |

#### **TopP**
Specifies the top-p value to use for generating completions. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |16      |false        |

#### **Tools**
Specifies the list of tools to use for generating completions. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |17      |false        |

#### **ToolChoice**
Specifies the tool choice to use for generating completions. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |18      |false        |

#### **ParallelToolCalls**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |19      |false        |

#### **User**
Specifies the user for the conversation. Default is not set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |20      |false        |

---

### Syntax
```PowerShell
Invoke-OAIChatCompletion [-Messages] <Object> [[-Model] <Object>] [[-FrequencyPenalty] <Object>] [[-LogitBias] <Object>] [[-Logprobs] <Object>] [[-TopLogprobs] <Object>] [[-MaxTokens] <Object>] [[-N] <Object>] [[-PresencePenalty] <Object>] [[-ResponseFormat] <Object>] [[-Seed] <Object>] [[-Stop] <Object>] [[-Stream] <Object>] [[-StreamOptions] <Object>] [[-Temperature] <Object>] [[-TopP] <Object>] [[-Tools] <Object>] [[-ToolChoice] <Object>] [[-ParallelToolCalls] <Object>] [[-User] <Object>] [<CommonParameters>]
```
