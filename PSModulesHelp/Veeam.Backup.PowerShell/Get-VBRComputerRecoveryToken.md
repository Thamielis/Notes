Get-VBRComputerRecoveryToken
----------------------------

### Synopsis
Returns tokens for bare-metal recovery.

---

### Description

This cmdlet returns tokens that you can use to perform bare-metal recovery.

---

### Examples
> Getting Token for Bare-Metal Recovery

```PowerShell
Get-VBRComputerRecoveryToken
This command returns all tokens added to the backup infrastructure.
```

---

### Parameters
#### **FriendlyName**
Specifies an array of token friendly names. The cmdlet will return tokens with these friendly names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Name**
Specifies an array of token names. The cmdlet will return tokens with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRComputerRecoveryToken [-FriendlyName <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRComputerRecoveryToken [-Name <String[]>] [<CommonParameters>]
```
