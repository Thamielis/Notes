Find-VBRViFolder
----------------

### Synopsis
Looks for folders on a specified ESXi host.

---

### Description

This cmdlet returns folders on a specified ESXi host.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Looking for all Folders Located on ESXi Host

$server = Get-VBRServer -Type ESXi -Name "Server01"
Find-VBRViFolder -Server $server
This example shows how to look for all folders located on the Server01 ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViFolder cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Looking for Specific Folder Located on ESXi Host

$server = Get-VBRServer -Type ESXi -Name "Server01"
Find-VBRViFolder -Server $server -Name "Weekly_Reports"
This example shows how to look for the Weekly_Reports folder located on the Server01 ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.  2. Run the Find-VBRViFolder cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value.
> Example 3. Looking for Several Specific Folders Located on ESXi Host

$server01 = Get-VBRServer -Name "Server01"
Find-VBRViFolder -Server $server01 -Name "Weekly_Reports", "Monthly_Reports"
This example shows how to look for the Weekly_Reports and Monthly_Report folders located on the Server01 ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViFolder cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies an array of folder names. The cmdlet will return folders with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies an ESXi host on which you want to look for folders.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRViFolder [-Name <String[]>] -Server <CHost> [<CommonParameters>]
```
