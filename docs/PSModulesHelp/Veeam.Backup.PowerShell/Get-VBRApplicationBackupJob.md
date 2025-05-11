Get-VBRApplicationBackupJob
---------------------------

### Synopsis
Returns application backup policies.

---

### Description

This cmdlet returns an array of application backup policies.

---

### Examples
> Example 1. Getting all Application Backup Policies

Get-VBRApplicationBackupJob
This command returns an array of all application backup policies that are added to Veeam Backup & Replication.
> Example 2. Getting Veeam Agent Backup Job by Name

```PowerShell
Get-VBRApplicationBackupJob -Name "Plugin Policy 05"
This command returns the Plugin Policy 05 application backup policy.
```

---

### Parameters
#### **Id**
Specifies an ID of an application backup policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies a name of an application backup policy.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Type**
Specifies the type of Veeam Plug-in to be installed on the protected computers:
* OracleRMAN: for Veeam Plug-in for Oracle RMAN.
* SAPHANA: for Veeam Plug-in for SAP HANA.
* SAPOnOracle: for Veeam Plug-in for SAP on Oracle.
The cmdlet will return discovered computers with applications of these types.
Valid Values:

* OracleRMAN
* SAPHANA
* SAPOnOracle

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRApplicationType[]]`|false   |named   |False        |

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
Get-VBRApplicationBackupJob [-Id <Guid[]>] [-Name <String[]>] [-Type {OracleRMAN | SAPHANA | SAPOnOracle}] [<CommonParameters>]
```
