Set-RDMTemplate
---------------

### Synopsis
Save templates in the current data source

---

### Description

Save templates in the current data source. All local templates will be ignored.

---

### Related Links
* [Get-RDMTemplate](Get-RDMTemplate)

* [New-RDMTemplate](New-RDMTemplate)

* [Remove-RDMTemplate](Remove-RDMTemplate)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $grTemplates = Get-RDMTemplate | Where-Object -Property Type -eq TemplateGroup; $sess = Get-RDMSession -Name "ASession"; $grTemplates[0].GroupEntries += $sess; Set-RDMTemplate $grTemplates[0]
Retrieves all group templates. Fetches the entry 'ASession' and add it to the first group template. Save the template with the new added entry.
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

#### **Template**
Template must be retrieved from Get-RDMTemplate

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSTemplate[]]`|true    |1       |true (ByValue)|

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTemplate

An object PSTemplate can be piped to the parameter Template

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMTemplate -detailed". For technical information, type "Get-Help Set-RDMTemplate -full".

---

### Syntax
```PowerShell
Set-RDMTemplate [-Template] <PSTemplate[]> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
