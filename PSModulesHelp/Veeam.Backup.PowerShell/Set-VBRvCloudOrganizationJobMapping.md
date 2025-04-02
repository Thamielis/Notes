Set-VBRvCloudOrganizationJobMapping
-----------------------------------

### Synopsis
Adds Cloud Director backup jobs and backups to the Cloud Director Organization or removes them from it.

---

### Description

This cmdlet adds backup jobs and backups created by these jobs to the Cloud Director Organization or removes them from it.
Cloud Director providers can use this cmdlet to make Cloud Director backup jobs visible to the administrators of the Cloud Director Organization. As a result, Organization administrators can manage these jobs or perform restore operations through Self-Service Backup Portal of Veeam Backup Enterprise Manager.
- The administrators get access to:
- Backups created by these jobs
- Guest OS credentials configured in these jobs.
This cmdlet does not add imported backups.
Administrators of Cloud Director Organization will not see the backup jobs sessions run previously by the Cloud Director providers.

---

### Examples
> Example 1

$job = Get-VBRJob -Name "Backup Job 1", "Backup Job 2"
Set-VBRvCloudOrganizationJobMapping -Action Map -Job $job
This example shows how to add backup jobs and backups to the Cloud Director Organization.

Perform the following steps:
1. Run the Get-VBRJob to get the backup jobs. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Set-VBRvCloudOrganizationJobMapping cmdlet. Set the Map option for the Action parameter. Set the $job variable as the Job parameter value.
> Example 2

$job = Get-VBRJob -Name "Backup Job 1", "Backup Job 2"
Set-VBRvCloudOrganizationJobMapping -Action Unmap -Job $job
This example shows how to remove backup jobs and backups from the Cloud Director Organization.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Set-VBRvCloudOrganizationJobMapping cmdlet. Set the Unmap option for the Action parameter. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Action**
Specifies the action for backup jobs:
* Map: Adds backup jobs and backups to the Cloud Director Organization.
* Unmap: Removes backup jobs and backups from the Cloud Director Organization.
Valid Values:

* Map
* Unmap

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRMapOrganizationAction]`|true    |named   |False        |

#### **Job**
Specifies the array of backup jobs.
The cmdlet will add these jobs to the Cloud Director Organization or remove them from it.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[VBRJob[]]`|true    |named   |False        |

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
Set-VBRvCloudOrganizationJobMapping -Action {Map | Unmap} -Job <VBRJob[]> [<CommonParameters>]
```
