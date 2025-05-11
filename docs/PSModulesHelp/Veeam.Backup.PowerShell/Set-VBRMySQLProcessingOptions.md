Set-VBRMySQLProcessingOptions
-----------------------------

### Synopsis
Modifies settings for processing MySQL database transaction logs.

---

### Description

This cmdlet modifies settings for processing MySQL database transaction logs for Veeam Agent backup jobs.

---

### Related Links
* [New-VBRMySQLProcessingOptions](New-VBRMySQLProcessingOptions)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Modifying Credentials for MySql Database Processing Settings

$options = New-VBRMySQLProcessingOptions
$creds = Get-VBRCredentials
Set-VBRMySQLProcessingOptions -Options $options -Credentials $creds
This example shows how to modify credentials for MySql database processing settings.

Perform the following steps:

1. Run the New-VBRMySQLProcessingOptions cmdlet. Save the result to the $options variable   2. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.   3. Run the Set-VBRMySQLProcessingOptions cmdlet. Set the $options variable as the Options parameter value. Set the $creds variable as the Credentials parameter value.
> Example 2. Modifying Absolute Path of Password File for MySql Database Processing Settings

$options = New-VBRMySQLProcessingOptions
$creds = Get-VBRCredentials
Set-VBRMySQLProcessingOptions -Options $options -PasswordFilePath /home/mydir/.my.cnf.
This example shows how to modify absolute path of a password file for MySql database processing settings.

Perform the following steps:

1. Run the New-VBRMySQLProcessingOptions cmdlet. Save the result to the $options variable   2. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.   3. Run the Set-VBRMySQLProcessingOptions cmdlet. Set the $options variable as the Options parameter value. Specify the PasswordFilePath parameter value.

---

### Parameters
#### **Credentials**
Specifies the MySQL credentials that Veeam Agent will use to connect to the MySQL Server. Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Options**
Specifies settings for PostgreSQL database transaction logs. The cmdlet will modify these settings. Accepts the VBRMySQLProcessingOptions object. To create this object, run the New-VBRMySQLProcessingOptions cmdlet.

|Type                         |Required|Position|PipelineInput |
|-----------------------------|--------|--------|--------------|
|`[VBRMySQLProcessingOptions]`|true    |named   |True (ByValue)|

#### **PasswordFilePath**
Specifies the absolute path for the password file. Veeam Agent will use this password file to connect to the MySQL Server. Default: /root/.my.cnf.
Note:
· Start the absolute path with the / symbol.   · The cmdlet will return an error if you provide this parameter when the Credentials parameter is already specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRMySQLProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRMySQLProcessingOptions [-Credentials <CCredentials>] -Options <VBRMySQLProcessingOptions> [<CommonParameters>]
```
```PowerShell
Set-VBRMySQLProcessingOptions -Options <VBRMySQLProcessingOptions> [-PasswordFilePath <String>] [<CommonParameters>]
```
