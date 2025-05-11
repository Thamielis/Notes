Set-VBRAzureBlobAccount
-----------------------

### Synopsis
Modifies Microsoft Azure Blob credentials records.

---

### Description

This cmdlet modifies credentials records for Microsoft Azure Blob storage.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

---

### Examples
> Modifying Microsoft Azure Blob Credentials Record

$securepassword = Read-Host "Enter your password" -AsSecureString
Enter your password: **********
$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
Set-VBRAzureBlobAccount -Account $account -SharedKey $securepassword
This example shows how to modify an Microsoft Azure Blob credentials record.
Perform the following steps:
1. Create a new secure password.
a. Run the Read-Host cmdlet. Specify the message that the console will display as a prompt. Specify the AsSecureString parameter. Save the result to the $securepassword variable.
b. Enter the password.
2. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
3. Run the Set-VBRAzureBlobAccount cmdlet. Set the $account variable as the Account parameter value. Set the $securepassword variable as the SharedKey parameter value.

---

### Parameters
#### **Account**
Specifies Microsoft Azure Blob credentials records that you want to modify.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[VBRAzureBlobAccount]`|true    |named   |True (ByValue)|

#### **Description**
Specifies a description. The cmdlet will add this description to Microsoft Azure Blob credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the Microsoft Azure Blob login name. The cmdlet will add this login name to Microsoft Azure Blob credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SharedKey**
Specifies the shared key. The cmdlet will use this shared key to add Microsoft Azure Blob credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureBlobAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAzureBlobAccount -Account <VBRAzureBlobAccount> [-Description <String>] [-Name <String>] [-SharedKey <String>] [<CommonParameters>]
```
