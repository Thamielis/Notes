Get-VBRApplicationRestorePoint
------------------------------

### Synopsis
Returns restore points created with the VSS-aware image processing enabled.

---

### Description

This cmdlet returns restore points of backups that were created with the VSS-aware image processing enabled.

---

### Related Links
* [Sort-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Sort-Object)

* [Select-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Select-Object)

---

### Examples
> Example 1. Returning all Restore Points

```PowerShell
Get-VBRApplicationRestorePoint -SQL
This command returns all restore points of backups containing Microsoft SQL VMs.
```
> Example 2. Returning Specific Restore Point of Micrsofot SQL VM

$crmdb = Get-VBRApplicationRestorePoint -SQL -Name "crm_db"
$restorepoint = $crmdb[2]
This example shows how to return a specific restore points of a Microsoft SQL VM named crm_db.
Perform the following steps:
1. Run the Get-VBRApplicationRestorePoint cmdlet. Provide the SQL parameter. Specify the Name parameter value. Save the result to the $crmdb variable.
2. Select the third restore point. Save the result to the $restorepoint variable.
> Example 3. Returning Most Recent Restore Point of Specific Microsoft SQL VM [Using Pipeline]

$crmdb = Get-VBRApplicationRestorePoint -SQL -Name "CRM-db" | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
This example shows how to return the most recent restore point of a Microsoft SQL VM named crm_db.
Perform the following steps:
1. Run the Get-VBRApplicationRestorePoint cmdlet. Provide the SQL parameter. Specify the Name parameter value.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
3. Pipe the cmdlet output to the Select-Object cmdlet. Set the 1 number as the First parameter value.
4. Save the result to the $crmdb variable.
> Example 4. Looking for Specific Restore Point

```PowerShell
Get-VBRApplicationRestorePoint -Id 4d39c279-f15c-4fd3-9b32-5f4e65f221b2
This command looks for a specific restore point with the 4d39c279-f15c-4fd3-9b32-5f4e65f221b2 Id.
```

---

### Parameters
#### **ActiveDirectory**
Defines that the cmdlet will return the restore points of Microsoft Active Directory VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Exchange**
Defines that the cmdlet will return the restore points of Microsoft Exchange VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Id**
Filters the restore points by ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies backed-up VMs. The cmdlet will return an array of restore points created for these VMs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Oracle**
Defines that the the cmdlet will return the restore points of Oracle VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PostgreSQL**
Defines that the the cmdlet will return the restore points of PostgreSQL VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SharePoint**
Defines that the the cmdlet will return the restore points of Microsoft SharePoint VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SQL**
Defines that the the cmdlet will return the restore points of Microsoft SQL Server VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Get-VBRApplicationRestorePoint [-ActiveDirectory] [-Exchange] [-Name <String[]>] [-Oracle] [-PostgreSQL] [-SharePoint] [-SQL] [<CommonParameters>]
```
```PowerShell
Get-VBRApplicationRestorePoint [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRApplicationRestorePoint [-Name <String[]>] [<CommonParameters>]
```
