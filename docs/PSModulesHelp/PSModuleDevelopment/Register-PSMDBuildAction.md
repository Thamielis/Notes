Register-PSMDBuildAction
------------------------

### Synopsis
Register a new action usable in build projects.

---

### Description

Register a new action usable in build projects.
Actions are the actual implementation logic that turns the configuration in a build project file into ... well, actions.
Anyway, these are basically named scriptblocks with some metadata.
This command is used to provide all the builtin actions and can be used to freely define your own actions.

Whenever you use a "script" action in your build projects, consider ... would it make a good configurable option valuable for other builds?
If so, that might just mark the birth of the next action!

---

### Examples
> EXAMPLE 1

```PowerShell
Register-PSMDBuildAction -Name 'script' -Action $actionCode -Description 'Execute a custom scriptfile as part of your workflow' -Parameters $parameters
Creates / registers the action "script".
```

---

### Parameters
#### **Name**
The name of the action.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Action**
The actual code implementing the action.
Each action scriptblock will receive exactly one .

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |2       |false        |

#### **Description**
A description explaining what the action is all about.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Parameters**
The parameters the action accepts.
Provider a hashtable, with the keys being the parameter names and the values being a description of its parameter.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|true    |4       |false        |

---

### Syntax
```PowerShell
Register-PSMDBuildAction [-Name] <String> [-Action] <ScriptBlock> [-Description] <String> [-Parameters] <Hashtable> [<CommonParameters>]
```
