Import-HubContext
-----------------

### Synopsis
Import a PSHubContext from a .json file at the path received.

---

### Description

Import a PSHubContext from a .json file at the path received. If SecurePassword is provided, prompt to enter a password to decrypt the .json file. If Password provided, decrypt the .json file with the password received.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Import-HubContext -Path "C:\PATH\TO\YOUR\FILE\file.json"
Import a standard PSHubContext.
```
> EXAMPLE 2

```PowerShell
PS C:\> Import-HubContext -Path "C:\PATH\TO\YOUR\FILEile.json" -Password "password"
Import the PSHubContext from a file protected by a password.
```
> EXAMPLE 3

```PowerShell
PS C:\> Import-HubContext -Path "C:\PATH\TO\YOUR\FILEile.json" -SecurePassword
Import the PSHubContext from a file protected by a password. The user will be prompted for the password.
```

---

### Parameters
#### **Password**
Will decrypt the file with the clear password

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Path**
The file path of Hub context to import.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **SecurePassword**
Will prompt the password to decrypt the file with

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Import-HubContext -detailed". For technical information, type "Get-Help Import-HubContext -full".

---

### Syntax
```PowerShell
Import-HubContext -SecurePassword -Path <String> [<CommonParameters>]
```
```PowerShell
Import-HubContext [-Password <String>] -Path <String> [<CommonParameters>]
```
