Set-OAIProvider
---------------

### Synopsis
Sets the provider for OpenAI.

---

### Description

The Set-OAIProvider function is used to set the provider for OpenAI. By default, the provider is set to 'OpenAI'.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-OAIProvider -Provider 'AzureOpenAI'
This example sets the provider for OpenAI to 'AzureOpenAI'.
```
> EXAMPLE 2

```PowerShell
Set-OAIProvider -Provider 'OpenAI'
This example sets the provider for OpenAI to 'OpenAI'.
```

---

### Parameters
#### **Provider**
Specifies the provider for OpenAI. The available options are 'AzureOpenAI' and 'OpenAI'.
Valid Values:

* AzureOpenAI
* OpenAI

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Set-OAIProvider [[-Provider] <Object>] [<CommonParameters>]
```
