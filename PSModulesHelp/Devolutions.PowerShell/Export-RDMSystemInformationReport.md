Export-RDMSystemInformationReport
---------------------------------

### Synopsis
Export the system information report to a file

---

### Description

Export the system information report to a file. Two formats are supported: *.inv and *.html.
The default behavior is to overwrite existing files. To avoid this, use the switch 'NoClobber'.

---

### Related Links
* [Get-RDMSystemInformationReport](Get-RDMSystemInformationReport)

---

### Examples
> EXAMPLE

PS C:\> $lastYearReports = Get-RDMEntry -Name 'MySystemInformationReportEntry' | Get-RDMSystemInformationReport -After 2023-01-01 -Before 2023-12-31
PS C:\> foreach ($report in $lastYearReports) {
          $exportPath = "C:\my\path\$($report.Inventory.ComputerName)_$($report.MetaInformation.CreationDate.ToString('yyyy-MM-dd')).inv"
          Export-RDMSystemInformationReport -Path $exportPath -InputObject $report
        }
Export all the last year inventories

---

### Parameters
#### **AsHtml**
Export the inventory as an html report

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
System information report obtained with Get-RDMSystemInformationReport

|Type                         |Required|Position|PipelineInput |
|-----------------------------|--------|--------|--------------|
|`[PSSystemInformationReport]`|true    |2       |true (ByValue)|

#### **NoClobber**
Do not overwrite an existing file

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Path**
Path where the file is saved

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Theme**
Theme of the html report
Valid Values:

* Light
* Dark

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Theme]`|false   |named   |false        |

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
* Default: Current vault that has been set.
* User: Vault specific to the current user.
* Global: Global vault of the data source.
Valid Values:

* Default
* User
* Global

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VaultMode]`|false   |named   |false        |

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
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSystemInformationReport

System information report object with metadata

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Export-RDMSystemInformationReport -detailed". For technical information, type "Get-Help Export-RDMSystemInformationReport -full".

---

### Syntax
```PowerShell
Export-RDMSystemInformationReport [-Path] <String> [-InputObject] <PSSystemInformationReport> [-Theme <Light | Dark>] [-AsHtml] [-NoClobber] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
