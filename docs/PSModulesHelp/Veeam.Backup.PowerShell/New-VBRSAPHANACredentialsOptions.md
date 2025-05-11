New-VBRSAPHANACredentialsOptions
--------------------------------

### Synopsis
Creates the SAP HANA credentials settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for SAP HANA.

This cmdlet creates SAP HANA credentials settings. You can set up the following options:
- The name of the SAP system.
- SSH credentials to connect to the SAP system.
- OS user credentials to connect to the SAP system.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example - Creating SAP HANA Credentials Settings for Application Backup Policies for Veeam Plug-in for SAP HANA

$os_administrator = Get-VBRCredentials
$db_administrator = Get-VBRCredentials
New-VBROracleRMANProcessingOptions -SAPSystem SH4 -SSHCredentials $os_administrator -BackupCredentials $db_administrator
This example shows how to create an SAP HANA credentials settings for application backup policies for Veeam Plug-in for SAP HANA.

To create the SAP HANA credentials settings, perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $os_administrator variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $db_administrator variable.
3. Run the New-VBRSAPHANACredentialsOptions cmdlet. Specify the SAPSystem parameter value. Set the $os_administrator as the SSHCredentials parameter value. Set the $db_administrator variable as BackupCredentials parameter value.

---

### Parameters
#### **BackupCredentials**
Specifies the OS user credentials for SAP HANA database processing. Accepts the CCredentials object.  To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **SAPSystem**
Specifies the name of the SAP system. Accepts string or the VBRDiscoveredSAPHANA object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRDiscoveredSAPHANA]`|true    |named   |False        |

#### **SSHCredentials**
Specifies the database user credentials for SAP HANA database processing. Accepts the CCredentials object.  To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

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
New-VBRSAPHANACredentialsOptions -BackupCredentials <CCredentials> -SAPSystem <VBRDiscoveredSAPHANA> -SSHCredentials <CCredentials> [<CommonParameters>]
```
