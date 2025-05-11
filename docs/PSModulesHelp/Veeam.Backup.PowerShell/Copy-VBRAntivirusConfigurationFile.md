Copy-VBRAntivirusConfigurationFile
----------------------------------

### Synopsis
Copies the antivirus configuration file.

---

### Description

This cmdlet allows you to distribute the antivirus configuration file among mount servers in your backup infrastructure.
Veeam Backup & Replication will copy the specified antivirus configuration file to selected mount servers and place the file to the %Program Files%\Common Files\Veeam\Backup and Replication\Mount Service folder.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1

$mounthost = Get-VBRServer -Name "storage"
Copy-VBRAntivirusConfigurationFile -ConfigurationFilePath "C:\Program Files\Common Files\Veeam\Backup and Replication\Mount Service\AntivirusInfos.xml" -SelectedServer $mounthost -TargetType SelectedServer
The example shows how to copy the antivirus configuration file to the selected mount server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $mounthost variable.
2. Run the Copy-VBRAntivirusConfigurationFile cmdlet. Specify the following settings:
- Specify the ConfigurationFilePath parameter value.
- Set the $mounthost variable as the SelectedServer parameter value.
- Set the SelectedServer option for the TargetType parameter.

---

### Parameters
#### **ConfigurationFilePath**
Specifies the path to the antivirus configuration file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **SelectedServer**
For the SelectedServer option.
Specifies the mount server. Veeam Backup & Replication will copy the configuration file to that mount server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **TargetType**
Specifies the options to distribute the antivirus configuration file among mount servers.
You can specify the following options:
* AllMountServers - use this option if you want to copy the configuration file to all mount servers in your backup infrastructure.
* SelectedServer - use this option if you want to copy the configuration file to the particular mount server.
Valid Values:

* AllMountServers
* SelectedServer

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[VBRCopyAntivirusConfigFileTargetType]`|true    |named   |False        |

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
Copy-VBRAntivirusConfigurationFile -ConfigurationFilePath <String> [-SelectedServer <CHost>] -TargetType {AllMountServers | SelectedServer} [<CommonParameters>]
```
