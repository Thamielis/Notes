Set-NcExportRuleIndex
---------------------

### Synopsis
Move a rule to the specified index.

---

### Description

Move a rule to the specified index.

---

### Related Links
* [Get-NcExportRule](Get-NcExportRule)

* [Set-NcExportRule](Set-NcExportRule)

* [New-NcExportRule](New-NcExportRule)

* [Remove-NcExportRule](Remove-NcExportRule)

---

### Examples
> Example 1

Set-NcExportRuleIndex dlamotta0101 3 5
Move the rule from index 3 to index 5 for export policy dlamotta0101.

PolicyName               RuleIndex    ClientMatch      Protocol     RoRule       RwRule       Vserver
----------               ---------    -----------      --------     ------       ------       -------
dlamotta0101             5            10.69.169.172    {nfs}        {any}        {sys}        dlamotta01

---

### Parameters
#### **Policy**
Export policy name.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **Index**
Export policy rule index.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[UInt32]`|true    |2       |true (ByPropertyName)|RuleIndex|

#### **NewIndex**
New ruleindex value for the Export rule. The rule will be inserted into the index position in the export-rule table.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt32]`|true    |3       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Exports.ExportRuleInfo

---

### Notes
Category: exports
API: export-rule-set-index
Family: vserver

---

### Syntax
```PowerShell
Set-NcExportRuleIndex [-Policy] <String> [-Index] <UInt32> [-NewIndex] <UInt32> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
