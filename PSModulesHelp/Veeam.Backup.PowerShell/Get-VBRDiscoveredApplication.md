Get-VBRDiscoveredApplication
----------------------------

### Synopsis
Returns discovered applications from the computer.

---

### Description

This cmdlet returns discovered Veeam Plug-in for Oracle RMAN, Veeam Plug-in for SAP HANA, or Veeam Plug-in for SAP on Oracle. Use an appropriate parameter set for each Veeam Plug-in.

Veeam Backup & Replication regularly performs discovery operations for Veeam Plug-in on computers in a protection group. During a discovery operation, Veeam Backup & Replication connects to computers and gathers information about them. After the discovery operation is complete, Veeam Backup & Replication recognizes processed Veeam Plug-ins as discovered.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Rescan-VBREntity](Rescan-VBREntity)

---

### Examples
> Example 1. Getting Discovered Applications of all Protection Groups

```PowerShell
Get-VBRDiscoveredApplication
This command returns discovered applications of all protection groups.
```
> Example 2. Getting Discovered Applications of Selected Protection Group

$group = Get-VBRProtectionGroup -Name "Database Servers"
Get-VBRDiscoveredApplication -ProtectionGroup $group
This example shows how to get discovered applications of a selected protection group.

Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredApplication cmdlet. Set the $group variable as the ProtectionGroup paramter value.

---

### Parameters
#### **Name**
Specifies a name of a computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **OracleRMAN**
Note: This parameter works for Veeam Plug-in for Oracle RMAN. Specifies the discovered application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OracleRMANEntityType**
Note: This parameter works for Veeam Plug-in for Oracle RMAN. Specifies the application type:
* RAC: Oracle Real Application Clusters.
* Server: servers.
* OracleHOME: Oracle database systems.
* Database: databases.
The cmdlet will return discovered application of these types.
Valid Values:

* RAC
* Server
* OracleHome
* Database

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRDiscoveredOracleRMANEntityType]`|false   |named   |False        |

#### **SAPHANA**
Note: This parameter works for Veeam Plug-in for SAP HANA. Specifies the discovered application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SAPHANAEntityType**
Note: This parameter works for Veeam Plug-in for SAP HANA. Specifies the application type:
* ScaleOutSystem: clusters.
* Server: servers.
* SAPSystem: SAP systems.
* Database: databases.
The cmdlet will return discovered application of these types.
Valid Values:

* ScaleOutSystem
* Server
* SAPSystem
* Database

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRDiscoveredSAPHANAEntityType]`|false   |named   |False        |

#### **SAPOnOracle**
Note: This parameter works for Veeam Plug-in for SAP on Oracle. Specifies the discovered application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SAPOnOracleEntityType**
Note: This option works for Veeam Plug-in for SAP on Oracle. Specifies the application type:
* Server: servers.
* Database: databases.
The cmdlet will return discovered application of these types.
Valid Values:

* Server
* Database

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRDiscoveredSAPOnOracleEntityType]`|false   |named   |False        |

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
Get-VBRDiscoveredApplication [-Name <String[]>] [-OracleRMAN] [-OracleRMANEntityType {RAC | Server | OracleHome | Database}] [<CommonParameters>]
```
```PowerShell
Get-VBRDiscoveredApplication [-Name <String[]>] [-SAPHANA] [-SAPHANAEntityType {ScaleOutSystem | Server | SAPSystem | Database}] [<CommonParameters>]
```
```PowerShell
Get-VBRDiscoveredApplication [-Name <String[]>] [-SAPOnOracle] [-SAPOnOracleEntityType {Server | Database}] [<CommonParameters>]
```
