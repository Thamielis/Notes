Get-RDMSystemInformationReport
------------------------------

### Synopsis
Get exisiting reports from an system information report entry

---

### Description

Get exisiting reports from an system information report entry. It is possible to filter them by their creation date with the parameters 'After' and 'Before'. Both of them are inclusive. To get the last report, simply use the switch 'Last'.

---

### Related Links
* [Export-RDMSystemInformationReport](Export-RDMSystemInformationReport)

* [New-RDMSystemInformationReport](New-RDMSystemInformationReport)

* [Remove-RDMSystemInformationReport](Remove-RDMSystemInformationReport)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMEntry -Name 'MySystemInformationReportEntry' | Get-RDMSystemInformationReport -Last
Get the last generated report from the entry 'MySystemInformationReportEntry'
```
> EXAMPLE 2

PS C:\> $lastYearReports = Get-RDMEntry -Name 'MySystemInformationReportEntry' | Get-RDMSystemInformationReport -After 2023-01-01 -Before 2023-12-31
PS C:\> foreach ($report in $lastYearReports) {
          $exportPath = "C:\my\path\$($report.Inventory.ComputerName)_$($report.MetaInformation.CreationDate.ToString('yyyy-MM-dd')).inv"
          Export-RDMSystemInformationReport -Path $exportPath -InputObject $report
        }
Export all the last year inventories

---

### Parameters
#### **After**
Return the inventory reports created after the specified date

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **Before**
Return the inventory reports created before the specified date

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

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

#### **ID**
ID of the system information report entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
System information report entry

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **Last**
Return the last inventory report

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

System information report entry

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSystemInformationReport

---

### Notes
For more information, type "Get-Help Get-RDMSystemInformationReport -detailed". For technical information, type "Get-Help Get-RDMSystemInformationReport -full".

---

### Syntax
```PowerShell
Get-RDMSystemInformationReport [-ID] <Guid> [-After <DateTime>] [-Before <DateTime>] [-Last] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMSystemInformationReport [-InputObject] <PSConnection> [-After <DateTime>] [-Before <DateTime>] [-Last] [-VaultMode <Default | User | Global>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
