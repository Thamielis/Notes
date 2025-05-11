Test-Key
--------

### Synopsis
Checks if a specific key exists in a configuration table.

---

### Description

The Test-Key function checks if a specified key exists in a given configuration table. It returns true if the key exists, and false otherwise.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-Key -ConfigurationTable $configTable -ConfigurationSection "Section1" -ConfigurationKey "Key1" -DisplayProgress $true
Checks if the key "Key1" exists in the "Section1" of the $configTable and displays a progress message.
```
> EXAMPLE 2

```PowerShell
Test-Key -ConfigurationTable $configTable -ConfigurationKey "Key2"
Checks if the key "Key2" exists in the $configTable without displaying progress messages.
```

---

### Parameters
#### **ConfigurationTable**
The configuration table to search for the key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **ConfigurationSection**
The section within the configuration table where the key is located.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **ConfigurationKey**
The key to check for existence in the configuration table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **DisplayProgress**
Specifies whether to display progress messages.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

---

### Syntax
```PowerShell
Test-Key [[-ConfigurationTable] <Object>] [[-ConfigurationSection] <Object>] [[-ConfigurationKey] <Object>] [[-DisplayProgress] <Object>] [<CommonParameters>]
```
