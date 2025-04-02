New-VBRManuallyDeployedContainer
--------------------------------

### Synopsis
Defines a scope of Veeam Agent setup files.

---

### Description

This cmdlet creates the VBRManuallyDeployedContainer object. This object defines a scope of Veeam Agent setup files that will be exported to computers in a protection group for pre-installed Veeam Agents.

NOTE: Keep in mind that the cmdlet does not define a scope of computers you can add to a protection group for pre-installed Veeam Agents. To learn how to add computers to a protection group for pre-installed Veeam Agents, see the Deploying Veeam Agents Using Generated Setup Files section in the Veeam Agent Management Guide.

To learn more about the protection group for pre-installed Veeam Agents, see the Protection Group Types section in the Veeam Agent Management Guide.

---

### Examples
> Defining Scope of Veeam Agent Microsoft Windows Setup Files

```PowerShell
New-VBRManuallyDeployedContainer -Path "C:\container" -WindowsPackage
This command exports Veeam Agent for Microsoft Windows setup files to the C:\container folder path after you create a protection group for pre-installed Veeam Agents.
```

---

### Parameters
#### **LinuxPackage**
Specifies an array of Linux-based setup files.

|Type                                |Required|Position|PipelineInput                 |
|------------------------------------|--------|--------|------------------------------|
|`[VBRProtectionGroupLinuxPackage[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **MacPackage**
Defines that the cmdlet will export Veeam Agent for macOS setup files.
Default: False.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Path**
Specifies a path to the folder to which Veeam Backup & Replication will export Veeam Agent setup files.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

#### **UnixPackage**
Specifies an array of Unix-based setup files.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRProtectionGroupUnixPackage[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **WindowsPackage**
Defines that the cmdlet will export Veeam Agent for Microsoft Windows setup files.
Default: False.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

System.Management.Automation.SwitchParameter

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupLinuxPackage[]

Veeam.Backup.PowerShell.Infos.VBRProtectionGroupUnixPackage[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRManuallyDeployedContainer [-LinuxPackage <VBRProtectionGroupLinuxPackage[]>] [-MacPackage] -Path <String> [-UnixPackage <VBRProtectionGroupUnixPackage[]>] [-WindowsPackage] [<CommonParameters>]
```
