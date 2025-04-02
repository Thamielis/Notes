Set-RDMEntryDocument
--------------------

### Synopsis
Save a document in the current data source

---

### Description

Save a document in the current data source.

---

### Related Links
* [Get-RDMEntryDocument](Get-RDMEntryDocument)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $doc = Get-RDMEntryDocument -Name 'SimpleTextDocument' -VaultMode User;
    $doc.Data = [System.Text.Encoding]::UTF8.GetBytes('My new content');
    Set-RDMEntryDocument -InputObject $doc
Update the content of the document stored in the database of the entry SimpleTextDocument.
```
> EXAMPLE 2

```PowerShell
PS C:\> $doc = Get-RDMEntryDocument -Name 'SimpleTextDocument';
    $doc.Data = Get-Content -Path MyFile.txt -AsByteStream;
    Set-RDMEntryDocument -InputObject $doc
Update the content of the document stored in the database of the entry SimpleTextDocument with the content of the file contained in the entry SimpleTextDocument
```

---

### Parameters
#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **InputObject**
Documents obtained from Get-RDMEntryDocumentation to save

|Type                      |Required|Position|PipelineInput |
|--------------------------|--------|--------|--------------|
|`[PSConnectionDocument[]]`|true    |1       |true (ByValue)|

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
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMEntryDocument -detailed". For technical information, type "Get-Help Set-RDMEntryDocument -full".

---

### Syntax
```PowerShell
Set-RDMEntryDocument [-InputObject] <PSConnectionDocument[]> [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
