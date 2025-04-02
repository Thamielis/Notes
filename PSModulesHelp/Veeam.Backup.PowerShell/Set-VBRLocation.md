Set-VBRLocation
---------------

### Synopsis
Modifies geographic locations created in Veeam Backup & Replication.

---

### Description

This cmdlet modifies settings of a geographic location created in Veeam Backup & Replication.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Changing Geographic Location Name

$location = Get-VBRLocation -Name "ABC North"
Set-VBRLocation -Location $location -Name "Central"
This example shows how to change the geographical location name.
Perform the following steps:
1. Run the Get-VBRLocation cmdlet. Specify the Name parameter value. Save the result to the $location variable.
2. Run the Set-VBRLocation cmdlet. Set the $location variable as the Location parameter value. Specify the Name parameter value.

---

### Parameters
#### **Location**
Specifies the location you want to modify.
Accepts VBRLocation type.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[VBRLocation]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name you want to assign to the location.
The maximum length of the location name is 255 characters.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRLocation

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRLocation -Location <VBRLocation> -Name <String> [-PassThru] [<CommonParameters>]
```
