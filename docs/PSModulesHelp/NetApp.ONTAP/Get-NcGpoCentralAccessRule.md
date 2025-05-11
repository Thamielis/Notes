Get-NcGpoCentralAccessRule
--------------------------

### Synopsis
Retrieves applied central access rule for specified SVM

---

### Description

Retrieves applied central access rule for specified SVM. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcGpoCentralAccessPolicy](Get-NcGpoCentralAccessPolicy)

---

### Examples
> Example 1

Get-NcGpoCentralAccessRule -VserverContext cifs_vserver
NcController       : 10.234.64.61
Svm                : cifs_vserver
Name               : gpo_rule1
Description        : test central access rule
CreateTime         : 7/22/2022 5:24:04 PM
UpdateTime         : 7/22/2022 5:24:05 PM
CurrentPermission  : O:SYG:SYD:AR(A;;FA;;;WD)
ProposedPermission : O:SYG:SYD:(A;;FA;;;OW)(A;;FA;;;BA)(A;;FA;;;SY)

NcController       : 10.234.64.61
Svm                : cifs_vserver
Name               : gpo_rule2
Description        : GPO central access rule for GPO REST
CreateTime         : 7/28/2022 5:21:47 PM
UpdateTime         : 7/28/2022 5:21:47 PM
CurrentPermission  : O:SYG:SYD:AR(A;;FA;;;WD)
ProposedPermission : O:SYG:SYD:(A;;FA;;;OW)(A;;FA;;;BA)(A;;FA;;;SY)

NcController       : 10.234.64.61
Svm                : cifs_vserver
Name               : gpo_rule3
Description        : GPO central access rule for GPO REST
CreateTime         : 7/28/2022 5:22:10 PM
UpdateTime         : 7/28/2022 5:22:10 PM
CurrentPermission  : O:SYG:SYD:AR(A;;FA;;;WD)
ProposedPermission : O:SYG:SYD:(A;;FA;;;OW)(A;;FA;;;BA)(A;;FA;;;SY)

> Example 2

$a = Get-NcGpoCentralAccessRule -Template
		 $a.Name = "gpo_rule1"
		$a.Svm = New-Object DataONTAP.C.Types.Gpo.Svm
		$a.Svm.Name = "cifs-vserver"
		Get-NcGpoCentralAccessRule -Query $a
NcController       : 10.234.64.61
Svm                : cifs_vserver
Name               : gpo_rule1
Description        : test central access rule
CreateTime         : 7/22/2022 5:24:04 PM
UpdateTime         : 7/22/2022 5:24:05 PM
CurrentPermission  : O:SYG:SYD:AR(A;;FA;;;WD)
ProposedPermission : O:SYG:SYD:(A;;FA;;;OW)(A;;FA;;;BA)(A;;FA;;;SY)

---

### Parameters
#### **VserverContext**
Name of the Vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |true         |VS     |

#### **Name**
Specify Rule Name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |true         |

#### **Template**
Specify to get an empty GpoCentralAccessRule object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a GpoCentralAccessRule object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use Get-NcGpoCentralAccessRule -Template to get the initially empty GpoCentralAccessRule object.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Gpo.GpoCentralAccessRule]`|true    |named   |false        |

#### **Attributes**
For advanced queries returned the desired number of attribute provide a GpoCentralAccessRule object with various fields

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Gpo.GpoCentralAccessRule]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Gpo.GpoCentralAccessRule

---

### Notes
Category: Gpo
API: /api/protocols/cifs/group-policies/svm.uuid/central-access-rules
Family: Vserver

---

### Syntax
```PowerShell
Get-NcGpoCentralAccessRule -VserverContext <String> [[-Name] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcGpoCentralAccessRule -Template <DataONTAP.C.Types.Gpo.GpoCentralAccessRule> [<CommonParameters>]
```
```PowerShell
Get-NcGpoCentralAccessRule -Query <DataONTAP.C.Types.Gpo.GpoCentralAccessRule> [-Attributes <DataONTAP.C.Types.Gpo.GpoCentralAccessRule>] [<CommonParameters>]
```
