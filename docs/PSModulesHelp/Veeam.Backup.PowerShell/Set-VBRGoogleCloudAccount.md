Set-VBRGoogleCloudAccount
-------------------------

### Synopsis
Modifies Google Cloud credentials records.

---

### Description

This cmdlet allows you to modify Google Cloud credentials records.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

---

### Examples
> Setting up Google Cloud Account

$creds = Get-VBRGoogleCloudAccount -AccessKey "ABCDEFGHIGKLMNOP"
Set-VBRGoogleCloudAccount -Account $creds -SecretKey "vmdkfdvdvdvEIE"
This example shows how to modify a Google Cloud credentials record.
Perform the following steps:
1. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $creds variable.
2. Run the Set-VBRGoogleCloudAccount cmdlet. Set the $creds variable as the Account parameter value. Specify the SecretKey parameter value.

---

### Parameters
#### **AccessKey**
Specifies an access key. The cmdlet will use this access key to add  Google Cloud credentials records to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Account**
Specifies Google Cloud credentials records that you want to modify.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRGoogleCloudAccount]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies a description for Google Cloud credentials records.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SecretKey**
Specifies a secret key. The cmdlet will use this secret key to add Google Cloud credentials records to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRGoogleCloudAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRGoogleCloudAccount [-AccessKey <String>] -Account <VBRGoogleCloudAccount> [-Description <String>] [-SecretKey <String>] [<CommonParameters>]
```
