New-VBRFileToTapeObject
-----------------------

### Synopsis
Defines settings of the source for the files to tape job.

---

### Description

This cmdlet creates the VBRFileToTapeObject object.

The object contains files or directories that you want to add to a file to tape job.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example - Creating Object for File to Tape Job

$server = Get-VBRServer -Name "fileserver08.tech.local"
$creds = Get-VBRCredentials -Description "Fileserver08 Adminisrator"
New-VBRFileToTapeObject -Server $server -Path "D:\Summary Reports\Payroll Reports" -Credentials $creds
This example shows how to create an object for a file to tape job. The object contains a folder on the fileserver08 server.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRCredentials cmdlet. Specify the Description parameter value. Save the result to the $creds variable.
3. Run the New-VBRFileToTapeObject cmdlet. Set the $server variable as the Server parameter value. Specify the Path parameter value. Set the $creds variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use to authenticate with the host. Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **ExcludeMask**
Specifies files that you want to exclude from the file to tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **IncludeMask**
Specifies files that you want to back up with the file to tape job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NASServer**
Specifies network shared folders. Veeam Backup & Replication will back up these shared folders with the file to tape job. Accepts the VBRUnstructuredServer object. Run the Sync-VBRUnstructuredBackupState cmdlet, to get this object. Note: Currently this parameter accepts only the NFS and SMB file share types. File servers are not supported.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRUnstructuredServer]`|false   |named   |False        |

#### **Path**
Specifies the target file path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies the host where the files reside. Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet. Default: Local.

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
New-VBRFileToTapeObject [-Credentials <CCredentials>] [-ExcludeMask <String>] [-IncludeMask <String>] [-Path <String>] [-Server <CHost>] [<CommonParameters>]
```
```PowerShell
New-VBRFileToTapeObject [-ExcludeMask <String>] [-IncludeMask <String>] [-NASServer <VBRUnstructuredServer>] [-Path <String>] [<CommonParameters>]
```
