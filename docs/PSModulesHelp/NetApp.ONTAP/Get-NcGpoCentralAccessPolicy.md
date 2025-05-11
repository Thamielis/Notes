Get-NcGpoCentralAccessPolicy
----------------------------

### Synopsis
Retrieves applied central access Policy for specified SVM

---

### Description

Retrieves applied central access Policy for specified SVM. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcGpoCentralAccessRule](Get-NcGpoCentralAccessRule)

---

### Examples
> Example 1

Get-NcGpoCentralAccessPolicy -VserverContext cifs_vserver
NcController : 10.234.64.61
Svm          : cifs_vserver
Name         : gpo_policy
Sid          : S-1-17-2047809096-1300588704-1453387655-1670869821
Description  : test central access policy
CreateTime   : 7/22/2022 5:25:59 PM
UpdateTime   : 7/28/2022 5:22:26 PM
MemberRules  : {gpo_rule1, gpo_rule2, gpo_rule3}

NcController : 10.234.64.61
Svm          : cifs_vserver
Name         : gpo_policy2
Sid          : S-1-17-1217351273-1125689399-3516997294-940972730
Description  : test policy for GPO REST
CreateTime   : 7/28/2022 5:20:38 PM
UpdateTime   : 7/28/2022 5:22:39 PM
MemberRules  : {gpo_rule1, gpo_rule2, gpo_rule3}

NcController : 10.234.64.61
Svm          : cifs_vserver
Name         : gpo_policy3
Sid          : S-1-17-3872160439-1274351857-3870708159-4919383
Description  : GPO central access policy rule 3 for GPO REST
CreateTime   : 7/28/2022 5:21:11 PM
UpdateTime   : 7/28/2022 5:22:47 PM
MemberRules  : {gpo_rule1, gpo_rule2, gpo_rule3}

> Example 2

$a = Get-NcGpoCentralAccessPolicy -Template
		$a.Name = "gpo_policy"
		$a.Svm = New-Object DataONTAP.C.Types.Gpo.Svm
		$a.Svm.Name = "cifs_vserver"
		Get-NcGpoCentralAccessPolicy -Query $a
NcController : 10.234.64.61
Svm          : cifs_vserver
Name         : gpo_policy
Sid          : S-1-17-2047809096-1300588704-1453387655-1670869821
Description  : test central access policy
CreateTime   : 7/22/2022 5:25:59 PM
UpdateTime   : 7/28/2022 5:22:26 PM
MemberRules  : {gpo_rule1, gpo_rule2, gpo_rule3}

---

### Parameters
#### **VserverContext**
Name of the Vserver

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |true         |VS     |

#### **Name**
Specify Policy Name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |true         |

#### **Template**
Specify to get an empty GpoCentralAccessPolicy object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a GpoCentralAccessPolicy object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use Get-NcGpoCentralAccessPolicy -Template to get the initially empty GpoCentralAccessPolicy object.

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Gpo.GpoCentralAccessPolicy]`|true    |named   |false        |

#### **Attributes**
For advanced queries returned the desired number of attribute provide a GpoCentralAccessPolicy object with various fields

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Gpo.GpoCentralAccessPolicy]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Gpo.GpoCentralAccessPolicy

---

### Notes
Category: Gpo
API: /api/protocols/cifs/group-policies/svm.uuid/central-access-Policies
Family: Vserver

---

### Syntax
```PowerShell
Get-NcGpoCentralAccessPolicy -VserverContext <String> [[-Name] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcGpoCentralAccessPolicy -Template <DataONTAP.C.Types.Gpo.GpoCentralAccessPolicy> [<CommonParameters>]
```
```PowerShell
Get-NcGpoCentralAccessPolicy -Query <DataONTAP.C.Types.Gpo.GpoCentralAccessPolicy> [-Attributes <DataONTAP.C.Types.Gpo.GpoCentralAccessPolicy>] [<CommonParameters>]
```
