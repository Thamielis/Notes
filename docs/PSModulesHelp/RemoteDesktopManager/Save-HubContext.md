Save-HubContext
---------------

### Synopsis
Save the current PSHubContext to a .json file at the path received

---

### Description

Save the current PSHubContext to a .json file at the path received. If PSHubContext is provided, save this one to a .sjon file. If Force is provided, overwrite file if the path already exist. If SecurePassword is provided, prompt to user to enter a password to encrypt the .json file. If Password provided, encrypt the .json file with the password received.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Save-HubContext -Path "C:\PATH\TO\YOUR\FILE\file.json"
Save the current PSHubContext.
```
> EXAMPLE 2

```PowerShell
PS C:\> Save-HubContext -Path "C:\PATH\TO\YOUR\FILE\file.json" -Password "password"
Save the current PSHubContext in a file protected by a password.
```
> EXAMPLE 3

```PowerShell
PS C:\> $availCtxs = Get-HubContext; Save-HubContext -Path "C:\PATH\TO\YOUR\FILEile.json" -PSHubContext $availCtxs[2] -SecurePassword
Fetch all available contexts. Save the third PSHubContext in a file protected by a password who will be filled be a prompt.
```

---

### Parameters
#### **Force**
Overwrite the file if exist

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Password**
Will encrypt the file with the clear password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Path**
Specifies the path of the file to save Hub context.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **PSHubContext**
Save Hub context to file.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSHubContext]`|false   |1       |false        |

#### **SecurePassword**
Will prompt the password to encrypt the file with

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Save-HubContext -detailed". For technical information, type "Get-Help Save-HubContext -full".

---

### Syntax
```PowerShell
Save-HubContext [-SecurePassword] [[-PSHubContext] <PSHubContext>] [-Path] <String> [[-Force]] [<CommonParameters>]
```
```PowerShell
Save-HubContext [[-Password] <String>] [[-PSHubContext] <PSHubContext>] [-Path] <String> [[-Force]] [<CommonParameters>]
```
