Get-DataInformation
-------------------

### Synopsis
Retrieves data information based on specified criteria.

---

### Description

This function retrieves data information based on the specified criteria. It checks for required types, availability of commands, and executes content if provided.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-DataInformation -Content { Get-Process } -Text "Gathering process information" -TypesRequired @("System.Diagnostics.Process") -TypesNeeded @("System.Diagnostics.Process") -Commands @("Get-Process")
Description:
Retrieves process information using the Get-Process command.
```
> EXAMPLE 2

```PowerShell
Get-DataInformation -Content { Get-Service } -Text "Gathering service information" -TypesRequired @("System.ServiceProcess.ServiceController") -TypesNeeded @("System.ServiceProcess.ServiceController") -Commands @("Get-Service")
Description:
Retrieves service information using the Get-Service command.
```

---

### Parameters
#### **Content**
The script block to execute for gathering data.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Text**
The text message to display when gathering data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **TypesRequired**
An array of types required for data gathering.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |3       |false        |

#### **TypesNeeded**
An array of types needed for data gathering.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |4       |false        |

#### **Commands**
An array of commands to check for availability.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |5       |false        |

#### **SkipAvailability**
Switch to skip availability check for commands.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-DataInformation [[-Content] <ScriptBlock>] [[-Text] <String>] [[-TypesRequired] <Array>] [[-TypesNeeded] <Array>] [[-Commands] <Array>] [-SkipAvailability] [<CommonParameters>]
```
