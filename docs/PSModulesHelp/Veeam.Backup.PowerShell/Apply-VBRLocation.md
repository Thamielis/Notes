Apply-VBRLocation
-----------------

### Synopsis
Assigns geographic locations to the backup infrastructure components.

---

### Description

This cmdlet assigns geographic locations to the backup infrastructure components.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Assigning Location to Backup Repository and ESXI Host

$rep = Get-VBRBackupRepository -Name "North Repository"
$esxi = Find-VBRViEntity -Name team.support.north
$loc = Get-VBRLocation -Name "ABC North"
Apply-VBRLocation -Objects $esxi, $rep -Location $loc
This example shows how to assign a selected location to a backup repository and an ESXi host.
Perform the following steps:
1. Get the infrastructure components to which you want to assign a location:
- Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $rep variable.
- Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $esxi variable.
2. Run the Get-VBRLocation cmdlet. Specify the Name parameter value. Save the result to the $loc variable.
3. Run the Apply-VBRLocation cmdlet. Set the $esxi and the $rep variables as the Objects parameter values. Set the $loc variable as the Location parameter value.

---

### Parameters
#### **Location**
Specifies the location you want to assign to the infrastructure components.

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[VBRLocation]`|true    |named   |True (ByPropertyName)|

#### **Object**
Specifies the array of the infrastructure components. The cmdlet will assign a location to these components.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Object[]]`|true    |named   |True (ByPropertyName)|

---

### Inputs
System.Object[]

Veeam.Backup.PowerShell.Infos.VBRLocation

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Apply-VBRLocation -Location <VBRLocation> -Object <Object[]> [<CommonParameters>]
```
