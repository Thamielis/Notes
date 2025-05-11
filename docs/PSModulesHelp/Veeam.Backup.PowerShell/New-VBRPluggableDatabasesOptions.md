New-VBRPluggableDatabasesOptions
--------------------------------

### Synopsis
Creates the pluggable database settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for Oracle RMAN.

This cmdlet creates pluggable database settings.

---

### Examples
> Example - Creating Pluggable Database Settings for Application Backup Policies for Veeam Plug-in for Oracle RMAN

```PowerShell
New-VBRPluggableDatabasesOptions  -ProcessingMode All
This command creates the pluggable database settings for application backup policies for Veeam Plug-in for Oracle RMAN. The policy will process all detected pluggable databases.
```

---

### Parameters
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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRPluggableDatabasesOptions [-ProcessingExclusion <String[]>] [-ProcessingInclusion <String[]>] [-ProcessingMode {All | AllExceptSelected | SelectedOnly}] [<CommonParameters>]
```
