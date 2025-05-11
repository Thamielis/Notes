Get-VBRNDMPVolume
-----------------

### Synopsis
Returns NDMP server volumes.

---

### Description

This cmdlet returns an array of NDMP server volumes.

---

### Related Links
* [Get-VBRNDMPServer](Get-VBRNDMPServer)

---

### Examples
> Example 1. Getting Volumes of All NDMP Servers

Get-VBRNDMPVolume
This command gets volumes of all NDMP servers added to Veeam Backup & Replication.
> Example 2. Getting NDMP Server Volume by Volume ID

```PowerShell
Get-VBRNDMPVolume -ID "0fccf7c9-1f90-49de-8bec-53a0697e04ab"
This command gets an NDMP server volume by the volume ID.
```
> Example 3. Getting NDMP Server Volume by Volume ID

```PowerShell
Get-VBRNDMPVolume -Name "/svm-cifs/Exhcange_vol"
This command gets an NDMP server volume by the volume name.
```
> Example 4. Getting All Volumes on Selected NDMP Server [Using Variable]

$server = Get-VBRNDMPServer -Name "NetApp.local"
Get-VBRNDMPVolume -Server $server
This example shows how to get all volumes on a specific NDMP server.

Perform the following steps:
1. Run the Get-VBRNDMPServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Set-VBRNDMPServer cmdlet. Set the $server variable as Server parameter value.

---

### Parameters
#### **Id**
Specifies an array of volume IDs. The cmdlet will return volumes with these IDs. NOTE: You an array of volume IDs only after you create the file to tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of names for volumes. The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies an array of NDMP servers. The cmdlet will return volumes located on these NDMP servers. Accepts the VBRNDMPServer[] object.  To get this object, run the Get-VBRNDMPServer cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNDMPServer[]]`|true    |named   |False        |

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
Get-VBRNDMPVolume -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNDMPVolume [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRNDMPVolume -Server <VBRNDMPServer[]> [<CommonParameters>]
```
