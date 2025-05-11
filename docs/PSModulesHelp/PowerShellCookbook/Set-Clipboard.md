Set-Clipboard
-------------

### Synopsis
Sets the contents of the clipboard.

---

### Description

The `Set-Clipboard` cmdlet sets the contents of the clipboard.

> [!NOTE] > On Linux, this cmdlet requires the `xclip` utility to be in the path.

---

### Related Links
* [Online Version:](https://learn.microsoft.com/powershell/module/microsoft.powershell.management/set-clipboard?view=powershell-7.3&WT.mc_id=ps-gethelp)

* [Get-Clipboard](Get-Clipboard)

---

### Examples
> Example 1: Copy text to the clipboard

```PowerShell
Set-Clipboard -Value "This is a test string"
```
> Example 2: Copy the contents of a file to the clipboard

```PowerShell
Get-Content C:\Users\user1\.ssh\id_ed25519.pub | Set-Clipboard
```

---

### Parameters
#### **Append**
Indicates that the cmdlet should add to the clipboard instead of replacing it. By default, the cmdlet clears the current content from the clipboard and sets it to the new content. When this parameter is specified, the cmdlet appends the new content after a newline to the current content.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

#### **PassThru**
Returns an object representing the item with which you're working. By default, this cmdlet does not generate any output.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

#### **Value**
The string values to be added to the clipboard.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[System.String[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
System.String

You can pipe a string containing the content to set to the clipboard to this cmdlet.

---

### Outputs
* None

---

### Notes
PowerShell includes the following aliases for `Set-Clipboard`:

- All platforms:   - `scb`

---

### Syntax
```PowerShell
Set-Clipboard [-Append] [-PassThru] -Value <System.String[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
