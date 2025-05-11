Get-VBRTapeMediaPool
--------------------

### Synopsis
Returns media pools.

---

### Description

This cmdlet returns the list of media pools managed by Veeam Backup & Replication.

The cmdlet returns simple, GFS and service media pools.  You can get the list of media pools within specified library, or search for instances directly by name or ID.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

---

### Examples
> Example 1 Getting List of All Media Pools

Get-VBRTapeMediaPool
This command looks for the list of all media pools in Veeam Backup & Replication.
> Example 2 Getting Media Pools by Name

```PowerShell
Get-VBRTapeMediaPool -Name "File Backup Media Pool", "AppData GFS Media Pool"
This command looks for the media pools named File Backup Media Pool and AppData GFS Media Pool.
```
> Example 3 Getting Media Pools in Library [Using Pipeline]

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Get-VBRTapeMediaPool
This example shows how to look for all media pools in the HP MSL G3 Series 3.00 library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRTapeMediaPool cmdlet.
> Example 4 Getting Media Pools in Library by Name [Using Pipeline]

VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Get-VBRTapeMediaPool -Name "AD Full Backup", "SharePoint Full Backups"
This example shows how to look for the media pools named "AD Full Backup" and "SharePoint Full Backups" in the HP MSL G3 Series 3.00 library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value.

---

### Parameters
#### **Id**
Specifies the array of media pool IDs. The cmdlet will return media pools with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Library**
Specifies the array of tape libraries. The cmdlet will return media pools that belong to these tape libraries.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of media pool names. The cmdlet will return media pools with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeLibrary

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRTapeMediaPool [-Id <Guid[]>] [-Library <VBRTapeLibrary>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeMediaPool [-Library <VBRTapeLibrary>] [-Name <String[]>] [<CommonParameters>]
```
