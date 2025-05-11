Read-HostWithPrompt
-------------------

### Synopsis
Read user input, with choices restricted to the list of options you
provide.

---

### Description

---

### Examples
> EXAMPLE 1

$caption = "Please specify a task"
PS > $message = "Specify a task to run"
PS > $option = "&Clean Temporary Files","&Defragment Hard Drive"
PS > $helptext = "Clean the temporary files from the computer",
>>              "Run the defragment task"
>>
PS > $default = 1
PS > Read-HostWithPrompt $caption $message $option $helptext $default
Please specify a task
Specify a task to run
[C] Clean Temporary Files  [D] Defragment Hard Drive  [?] Help
(default is "D"):?
C - Clean the temporary files from the computer
D - Run the defragment task
[C] Clean Temporary Files  [D] Defragment Hard Drive  [?] Help
(default is "D"):C
0

---

### Parameters
#### **Caption**
The caption for the prompt

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Message**
The message to display in the prompt

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Option**
Options to provide in the prompt

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |false        |

#### **HelpText**
Any help text to provide

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Default**
The default choice

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Syntax
```PowerShell
Read-HostWithPrompt [[-Caption] <Object>] [[-Message] <Object>] [-Option] <Object> [[-HelpText] <Object>] [[-Default] <Object>] [<CommonParameters>]
```
