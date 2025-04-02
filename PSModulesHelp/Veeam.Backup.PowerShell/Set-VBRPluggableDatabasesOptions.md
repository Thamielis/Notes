Set-VBRPluggableDatabasesOptions
--------------------------------

### Synopsis
Modifies the pluggable database settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for Oracle RMAN. This cmdlet modifies pluggable database settings.

---

### Related Links
* [New-VBRPluggableDatabasesOptions](New-VBRPluggableDatabasesOptions)

---

### Examples
> Example - Creating and Modifying Pluggable Database Settings for Application Backup Policies for Veeam Plug-in for Oracle RMAN

$options = New-VBRPluggableDatabasesOptions -ProcessingMode All
Set-VBRPluggableDatabasesOptions -Options $options -ProcessingMode SelectedOnly ProcessingInclusion SH4
This example shows how to create the pluggable database settings for application backup policies for Veeam Plug-in for Oracle RMAN. The modified policy will process only specified database.

To create and modify the pluggable database settings, perform the following steps:
1. Run the New-VBRPluggableDatabasesOptions cmdlet. Set the All option for the ProcessingMode parameter. Save the result as the $options variable.
2. Run the Set-VBRPluggableDatabasesOptions cmdlet. Set the $options variable as the Options parameter value. Set the SelectedOnly value for the ProcessingMode parameter value. Specify the ProcessingInclusion parameter value.

---

### Parameters
#### **Options**
Specifies the pluggable database settings that you plan to modify. Accepts the VBRPluggableDatabasesOptions object. To get this object, run the New-VBRPluggableDatabasesOptions cmdlet.

|Type                            |Required|Position|PipelineInput |
|--------------------------------|--------|--------|--------------|
|`[VBRPluggableDatabasesOptions]`|true    |named   |True (ByValue)|

#### **ProcessingExclusion**
For the AllExceptSelected processing mode. Specifies databases to exclude from the backup scope.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **ProcessingInclusion**
For the SelectedOnly processing mode. Specifies databases to include in the backup scope.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **ProcessingMode**
Specifies the processing mode:
* All: to process all detected databases.
* AllExceptSelected: to process all detected databases except excluded databases.
* SelectedOnly: to process only specified databases.
Valid Values:

* All
* AllExceptSelected
* SelectedOnly

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRPluggableDatabasesProcessingMode]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRPluggableDatabasesOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRPluggableDatabasesOptions -Options <VBRPluggableDatabasesOptions> [-ProcessingExclusion <String[]>] [-ProcessingInclusion <String[]>] [-ProcessingMode {All | AllExceptSelected | SelectedOnly}] 
```
```PowerShell
[<CommonParameters>]
```
