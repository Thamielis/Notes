Get-VBRvCDReplica
-----------------

### Synopsis
Returns Cloud Director replicas.

---

### Description

This cmdlet returns Cloud Director replicas.

---

### Examples
> Example 1. Getting vCD Replicas by Name

```PowerShell
Get-VBRvCDReplicaJob -Name "vCD_05j"
This command returns the vCD_05j vCD replicas.
```
> Example 2. Getting vCD Replicas by ID

```PowerShell
Get-VBRvCDReplicaJob -Id "2a7c321c-c8cf-4aec-9332-93882e69c667"
This command returns the 2a7c321c-c8cf-4aec-9332-93882e69c667 vCD replicas.
```
> Example 3. Getting all vCD Replicas Jobs

```PowerShell
Get-VBRvCDReplicaJob
This command returns all vCD replicas that are added to the backup infrastructure.
```

---

### Parameters
#### **Id**
Specifies an array of Ids for Cloud Director replicas.
The cmdlet will return a list of Cloud Director replicas with the specified IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for Cloud Director replicas.
The cmdlet will return a list of Cloud Director replicas with these names.

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
Get-VBRvCDReplica [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRvCDReplica [-Name <String[]>] [<CommonParameters>]
```
