New-VBRCSVCustomCredentials
---------------------------

### Synopsis
Specifies custom credentials for authenticating with computers listed in a CSV file.

---

### Description

This cmdlet specifies custom credentials for authenticating with computers you want to add to a protection group from a CSV file. Veeam Backup & Replication uses these credentials for Veeam Agent deployment and backup\restore activities.
By default, Veeam Backup & Replication uses Master account credentials for authenticating with all computers listed in a CSV file. For authenticating with computers that require different credentials Veeam Backup & Replication uses custom credentials.

---

### Related Links
* [New-VBRCSVContainer](New-VBRCSVContainer)

---

### Examples
> Example 1. Setting Custom Credentials for Computers from CSV File

$ccreds = Get-Credential
@("172.19.51.55", "sup-v8931") | ForEach { New-VBRCSVCustomCredentials -HostName $_ -Credentials $ccreds}
This example shows how to specify custom credentials for computers from a CSV file.
Perform the following steps:
1. Run the Get-Credential to create a credential object you want to use for authenticating with computers. Type the credentials and save the result to the $ccreds variable.
2. Run the New-VBRCSVCustomCredentials cmdlet. Set the $ccreds variable as the Credentials parameter value. Use the ForEach statement to apply the same credentials to multiple computers.
> Example 2. Setting Master Credentials for Computers from CSV File

```PowerShell
New-VBRCSVCustomCredentials -HostName 172.19.51.50
This command specifies master credentials for the computer from a CSV file.
```

---

### Parameters
#### **Credentials**
Specifies custom credentials for authenticating with computers listed in a CSV file.
If not set, Veeam Backup & Replication will use Master account credentials for authenticating with associated computers.
Note: for string type, enter a user name in the Domain\Username format.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **HostName**
Specifies DNS-name or IP address of the computer for which you want to specify credentials.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

Veeam.Backup.Common.CCredentials

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRCSVCustomCredentials [-Credentials <CCredentials>] -HostName <String> [<CommonParameters>]
```
