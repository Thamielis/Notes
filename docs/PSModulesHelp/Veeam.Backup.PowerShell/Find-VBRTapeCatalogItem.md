Find-VBRTapeCatalogItem
-----------------------

### Synopsis
Looks for files or folders backed-up by tape jobs.

---

### Description

This cmdlet looks for files or folders backed-up by tape jobs.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Finding Files and Folders Backed-Up from Certain Server

$server = Get-VBRServer -Name "Repo 01"
Find-VBRTapeCatalogItem -Server $server
This example shows how to find files and folders backed-up from the certain server.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRTapeCatalogItem cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Finding Certain File Backed-Up by Tape Job

$item = Find-VBRTapeCatalogItem
Find-VBRTapeCatalogItem -CatalogItem $item
This example shows how to find a certain file backed-up by the tape job.

Perform the following steps:
1. Run the Find-VBRTapeCatalogItem cmdlet. Save the result to the $item variable.
2. Run the Find-VBRTapeCatalogItem cmdlet. Set the $item variable as the CatalogItem parameter value.

---

### Parameters
#### **CatalogItem**
Specifies a file or folder. This parameter is used to search further based on the results of the initial search without this parameter. Accepts the VBRTapeCatalogItem[] object. To get this object, run the Find-VBRTapeCatalogItem cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRTapeCatalogItem[]]`|false   |named   |False        |

#### **Name**
Specifies the name of the file or folder. The cmdlet will filter files and folders by this value.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **ResolvePath**
Defines that the cmdlet will set correct path for all returned files or folders. It is used to view the full path to existing files or folders.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Server**
Specifies the server where files were backed up from. The cmdlet will find files and folders backed up from this server. Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

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
Find-VBRTapeCatalogItem [-CatalogItem <VBRTapeCatalogItem[]>] [-Name <String[]>] [-Server <CHost>] [<CommonParameters>]
```
```PowerShell
Find-VBRTapeCatalogItem -CatalogItem <VBRTapeCatalogItem[]> -ResolvePath [<CommonParameters>]
```
