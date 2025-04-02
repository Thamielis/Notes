Get-VBRTapeLibrary
------------------

### Synopsis
Returns tape libraries.

---

### Description

This cmdlet returns tape libraries connected to Veeam Backup & Replication.

You can get the list of all tape libraries, narrow down your search to particular tape servers or search for instances directly by name or ID.

Note that tape libraries are added to Veeam Backup & Replication automatically when you add a tape server with connected library. Run the Add-VBRTapeServer cmdlet to add tape server.

---

### Related Links
* [Get-VBRTapeServer](Get-VBRTapeServer)

---

### Examples
> Example 1 Getting All Tape Libraries

Get-VBRTapeLibrary
This command gets a list of all tape libraries connected to Veeam Backup & Replication.
> Example 2 Getting All Tape Libraries Connected to Tape Server [Using Pipeline]

Get-VBRTapeServer -Name "Sydney_Tape_Server" | Get-VBRTapeLibrary
This command looks for all tape libraries connected to the tape server named 'Sydney_Tape_Server'.

Perform the following steps:
1. Run the Get-VBRTapeServer cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRTapeLibrary cmdlet.

---

### Parameters
#### **Id**
Specifies the array of tape library IDs. The cmdlet will return tape libraries with these IDs. Accepts GUID or string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the array of tape library names. The cmdlet will return tape libraries with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **TapeServer**
Specifies the array of tape servers. The cmdlet will return tape libraries connected to these tape servers. Accepts the VBRTapeServer object, GUID or string.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeServer[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRTapeLibrary [-Id <Guid[]>] [-TapeServer <VBRTapeServer[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeLibrary [-Name <String[]>] [-TapeServer <VBRTapeServer[]>] [<CommonParameters>]
```
