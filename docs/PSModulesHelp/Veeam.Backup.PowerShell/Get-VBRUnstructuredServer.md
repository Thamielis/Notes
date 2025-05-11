Get-VBRUnstructuredServer
-------------------------

### Synopsis
Returns unstructured data sources added to the inventory.

---

### Description

This cmdlet returns an array of unstructured data sources added to the inventory. You can get the following unstructured data sources:
- File shares
- Object storage

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-NetAppHost](Get-NetAppHost)

---

### Examples
> Example 1. Getting all Unstructured Data Sources Added to Inventory

```PowerShell
Get-VBRUnstructuredServer
This cmdlet returns all unstructured data sources added to the inventory.
```
> Example 2. Getting Unstructured Data Sources by Name

```PowerShell
Get-VBRUnstructuredServer -Name "S3compatible 01", "S3compatible02"
This cmdlet returns the S3compatible 01 and S3compatible02 unstructured data sources.
```
> Example 3. Getting Unstructured Data Sources by ID

```PowerShell
Get-VBRUnstructuredServer -Id fd7e4191-f6be-4d43-a3fc-fc6547a30d72
This cmdlet returns the fd7e4191-f6be-4d43-a3fc-fc6547a30d72 unstructured data source.
```
> Example 4. Getting Enterprise NAS Systems

$nas = Get-NetAppHost -Name "NetApp Store"
Get-VBRUnstructuredServer -SANEntity
This example shows how to get the NetApp Store Enterprise NAS System.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter values. Save the result to the $nas variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Set the $nas variable as the SANEntity parameter value.
> Example 5. Getting Unstructured Data Protected With Backups

$backup = Get-VBRUnstructuredBackup -Name "Reports backup"
Get-VBRUnstructuredServer -Backup $backup
This example shows how to get unstructured data protected with backups.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter values. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Set the $backup variable as the Backup parameter value.

---

### Parameters
#### **Backup**
Specifies a backup. The cmdlet will return an array of unstructured data sources protected with this backup. Accepts the VBRUnstructuredBackup object.  To create this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackup]`|false   |named   |False        |

#### **Id**
Specifies an ID of a unstructured data sources. The cmdlet will return an array of unstructured data sources with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies a name of unstructured data sources. The cmdlet will return an array of unstructured data sources with the specified name

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **SANEntity**
Specifies a name of an enterprise NAS system. The cmdlet will return an array of file shares residing on this NAS system. Accepts the VBRSANEntity[] object.  To get this object, run the Get-NetAppHost cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRSANEntity[]]`|true    |named   |False        |

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
Get-VBRUnstructuredServer [-Backup <VBRUnstructuredBackup>] [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredServer -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredServer -Name <String[]> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredServer -SANEntity <VBRSANEntity[]> [<CommonParameters>]
```
