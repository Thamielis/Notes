New-VBRMySQLProcessingOptions
-----------------------------

### Synopsis
Defines settings for processing backed-up MySQL databases on Linux computers.

---

### Description

This cmdlet creates the VBRMySQLProcessingOptions object. This object contains settings for processing backed-up MySQL databases for Veeam Agent backup jobs.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Defining Settings for Processing Backed-up MySQL Database Using Credentials

$creds = Get-VBRCredentials -Name *Administrator*
New-VBRMySQLProcessingOptions -Credentials $creds
This example shows how to define settings for processing backed-up MySQL databases using credentials.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
2. Run the New-VBRMySQLProcessingOptions cmdlet. Set the $creds variable as the Credentials parameter value.
> Example 2. Defining Settings for Processing Backed-up MySQL Database Using Password File

```PowerShell
New-VBRMySQLProcessingOptions -PasswordFilePath "/root/.my.cnf."
This command defines settings for processing backed-up MySQL databases using the absolute path for the password file.
```

---

### Parameters
#### **Credentials**
Specifies the MySQL credentials that Veeam Agent will use to connect to the MySQL Server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **PasswordFilePath**
Specifies the absolute path for the password file. Veeam Agent will use this password file to connect to the MySQL Server.
Default: /root/.my.cnf.
Note:
* Start the absolute path with the / symbol.
* The cmdlet will return an error if you provide this parameter when the Credentials parameter is already specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
New-VBRMySQLProcessingOptions [-Credentials <CCredentials>] [<CommonParameters>]
```
```PowerShell
New-VBRMySQLProcessingOptions [-PasswordFilePath <String>] [<CommonParameters>]
```
