Add-VBRAzureBlobAccount
-----------------------

### Synopsis
Creates Microsoft Azure Blob credentials records.

---

### Description

This cmdlet creates a VBRAzureBlobAccount object.
This object contains credentials records of a Microsoft Azure storage account that has permissions to access the Blob storage resources.

---

### Examples
> Adding Microsoft Azure Blob Credentials Record

$securepassword = Read-Host "Enter your password" -AsSecureString
Enter your password: **********
Add-VBRAzureBlobAccount -Name "Login" -SharedKey $securepassword
This example shows how to add an Microsoft Azure Blob credentials record.
Perform the following steps:
1. Run the Read-Host cmdlet. Specify the message that the console will display as a prompt. Provide the AsSecureString parameter. Save the result to the $securepassword variable.
2. Enter the password.
3. Run the Add-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Set the $securepassword variable as the SharedKey parameter value.

---

### Parameters
#### **Description**
Specifies a description for the Microsoft Azure Blob credentials record.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a login name. The cmdlet will use this login name to add the Microsoft Azure Blob credentials record.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **SharedKey**
Specifies a shared key. The cmdlet will use this shared key to add the Microsoft Azure Blob credentials record.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Add-VBRAzureBlobAccount [-Description <String>] -Name <String> -SharedKey <String> [<CommonParameters>]
```
