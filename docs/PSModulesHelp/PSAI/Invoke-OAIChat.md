Invoke-OAIChat
--------------

### Synopsis
Invokes an AI chat assistant to answer user questions.

---

### Description

The Invoke-OAIChat function is used to interact with an AI chat assistant. It takes user input as a parameter and returns the assistant's response.

---

### Examples
> EXAMPLE 1

Invoke-OAIChat -UserInput "What is the weather today?"
Invokes the AI chat assistant with the specified user input and returns the assistant's response.
> EXAMPLE 2

```PowerShell
'show even numbers' | ai -Instructions 'use powershell, just code, no explanation'
```
> EXAMPLE 3

```PowerShell
git status | ai 'write a detailed commit message'
```

---

### Parameters
#### **UserInput**
Specifies the user input to be processed by the AI chat assistant.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

#### **Instructions**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **model**
Specifies the model to be used by the AI chat assistant. Valid values are 'gpt-4', 'gpt-3.5-turbo', 'gpt-3.5-turbo-16k', 'gpt-4-1106-preview', 'gpt-4-turbo-preview', and 'gpt-3.5-turbo-1106'. The default value is 'gpt-3.5-turbo'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Inputs
System.String

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
This function requires the New-OAIAssistant, New-OAIThreadQuery, Wait-OAIOnRun, and Get-OAIMessage functions to be available in the current session.

---

### Syntax
```PowerShell
Invoke-OAIChat [[-UserInput] <Object>] [[-Instructions] <Object>] [[-model] <Object>] [<CommonParameters>]
```
