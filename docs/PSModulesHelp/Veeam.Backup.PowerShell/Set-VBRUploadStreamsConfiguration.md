Set-VBRUploadStreamsConfiguration
---------------------------------

### Synopsis
Modifies data transfer settings for job sessions.

---

### Description

This cmdlet modifies existing data transfer settings for job sessions.

---

### Related Links
* [Get-VBRUploadStreamsConfiguration](Get-VBRUploadStreamsConfiguration)

---

### Examples
> Modifying Data Transfer Settings to Change Number of TCP/IP Connections

$transfersettings = Get-VBRUploadStreamsConfiguration
Set-VBRUploadStreamsConfiguration -Configuration $transfersettings -StreamCount 7 -PassThru
                                  Enabled                                                 StreamCount
                                  -------                                                 -----------
                                     True                                                           7
This example shows how to modify data transfer settings and change a number of TCP/IP connections per job session. The cmdlet will return details about the modified data transfer settings.
Perform the following steps:
1. Run the Get-VBRUploadStreamsConfiguration cmdlet. Save the result to the $transfersettings variable.
2. Run the Set-VBRUploadStreamsConfiguration cmdlet. Set the $transfersettings variable as the Configuration parameter value. Specify the StreamCount parameter value. Provide the PassThru parameter.

---

### Parameters
#### **Configuration**
Specifies data transfer settings for job sessions. The cmdlet will modify these settings.

|Type                             |Required|Position|PipelineInput |
|---------------------------------|--------|--------|--------------|
|`[VBRUploadStreamsConfiguration]`|true    |named   |True (ByValue)|

#### **Enable**
Enables the multithreaded data transfer option if it is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StreamCount**
Specifies a number of TCP/IP connections per job session.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUploadStreamsConfiguration

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRUploadStreamsConfiguration -Configuration <VBRUploadStreamsConfiguration> [-Enable] [-PassThru] [-StreamCount <Int32>] [<CommonParameters>]
```
