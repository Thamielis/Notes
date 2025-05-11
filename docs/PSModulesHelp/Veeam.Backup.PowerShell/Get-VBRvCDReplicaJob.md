Get-VBRvCDReplicaJob
--------------------

### Synopsis
Returns Cloud Director replication jobs.

---

### Description

This cmdlet returns vCD replication jobs.

---

### Examples
> Example 1. Getting vCD Replication Job by Name

```PowerShell
Get-VBRvCDReplicaJob -Name "vCD_05j"
This command returns the vCD_05j vDC replication job.
```
> Example 2. Getting vCD Replication Job by ID

```PowerShell
Get-VBRvCDReplicaJob -Id "2a7c321c-c8cf-4aec-9332-93882e69c667"
This command returns the 2a7c321c-c8cf-4aec-9332-93882e69c667 vDC replication job.
```
> Example 3. Getting all vCD Replication Jobs

```PowerShell
Get-VBRvCDReplicaJob
This command returns all vDC replication jobs that are added to the backup infrastructure.
```

---

### Parameters
#### **Id**
Specifies an array of Ids for Cloud Director replication jobs.
The cmdlet will return a list of jobs with the specified IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for Cloud Director replication jobs.
The cmdlet will return a list of jobs with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRvCDReplicaJob [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRvCDReplicaJob [-Name <String[]>] [<CommonParameters>]
```
