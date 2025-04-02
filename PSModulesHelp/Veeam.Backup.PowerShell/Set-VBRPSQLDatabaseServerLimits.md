Set-VBRPSQLDatabaseServerLimits
-------------------------------

### Synopsis
Modifies settings of the PostgreSQL instance.

---

### Description

This cmdlet modifies settings for the PostgreSQL instance. Use this cmdlet to extend hardware resources of PostgreSQL instances that is used as a configuration database by Veeam Backup & Replication and Veeam Backup Enterprise Manager.
Depending on your configuration, you can use one of the following modifications:
1. Automatic modification - use this parameter set if you installed the PostgreSQL instance on a backup server and it is used as the Veeam Backup & Replication configuration database. For details, see Example 1. Modifying Local PostgreSQL Instance.
2. Manual modification - use this parameter set in the following cases: - If the PostgreSQL instance is installed on a remote machine and it is used by Veeam Backup & Replication as a configuration database. In this case, you must specify the OS of the machine where the PostgreSQL database installed, number of CPU cores and amount of memory in GB.
- If the PostgreSQL instance is installed on a remote machine and currently is not used by Veeam Backup & Replication as a configuration database. In this case, you must create a dump file with the necessary settings and specify a path to this file. Also, you must specify the OS of the machine where the PostgreSQL database installed, number of CPU cores, and amount of memory in GB.
IMPORTANT!
Consider the following:
- If you set PostgreSQL database as a configuration database when you install Veeam Backup & Replication, the necessary resource capacity will be configured during Veeam Backup & Replication installation.
- If the CPU or RAM resources are changed after Veeam Backup & Replication or Veeam Backup Enterprise Manager installation, you must run this cmdlet again to adjust hardware resources of the PostgreSQL instance.
- You must restart the PostgreSQL service after you run this cmdlet.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Examples
> Example 1. Modifying Local PostgreSQL Instance

Set-VBRPSQLDatabaseServerLimits
This command automatically modifies settings of the PostgreSQL instance. The PostgreSQL instance is installed on a backup server and is used as the Veeam Backup & Replication configuration database.
> Example 2. Modifying Remote PostgreSQL Instance Maually

Set-VBRPSQLDatabaseServerLimits -OSType Windows -CPUCount 16 -RamGb 30
This command manually modifies settings of the PostgreSQL instance. The PostgreSQL instance is installed on a remote machine and is used as the Veeam Backup & Replication configuration database.
> Example 3. Modifying Remote PostgreSQL Instance not Used as Configuration Database

Set-VBRPSQLDatabaseServerLimits -OSType <String> -CPUCount 16 -RamGb 30 -DumpToFile "C:\settings.sql"
This command modifies settings of the PostgreSQL instance. The PostgreSQL instance is installed on a remote machine and is not used as the Veeam Backup & Replication configuration database.

---

### Parameters
#### **CPUCount**
Specifies a number of CPU cores that you want to assign to a machine where the PostgreSQL instance is installed.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **DumpToFile**
Specifies a path to a dump file. The cmdlet will apply these settings to a machine where the PostgreSQL instance is installed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **OSType**
Specifies the OS of the machine where the PostgreSQL instance is installed:
* Windows
* Linux

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **RamGb**
Specifies amount of memory in GB that you want to assign to a machine where the PostgreSQL instance is installed.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

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
Set-VBRPSQLDatabaseServerLimits -CPUCount <Int32> [-DumpToFile <String>] -OSType <String> -RamGb <Int32> [<CommonParameters>]
```
