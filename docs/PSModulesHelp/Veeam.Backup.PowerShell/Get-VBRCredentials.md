Get-VBRCredentials
------------------

### Synopsis
Returns credentials records.

---

### Description

This cmdlet returns the list of credentials records managed by Veeam Backup & Replication.
You can get the list of all credentials records or look for instances directly by name.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Getting Credentials Records by Name

```PowerShell
Get-VBRCredentials -Name *Administrator*
This command gets credentials records with the Administrator user name.
```
> Example 2. Getting Credentials Records by Host

$host = Get-VBRServer
Get-VBRCredentials -Entity $host[1]
This command gets credentials records of a specific host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Save the result to the $host variable.
2. Run the Get-VBRCredentials cmdlet. Set the $host variable as the Entity parameter value. Specify the necessary host of the $host variable.

---

### Parameters
#### **Entity**
Specifies an array of hosts. The cmdlet will return credentials of these hosts.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[Object[]]`|false   |named   |True (ByValue)|

#### **Name**
Specifies an array of user names. The cmdlet will return credentials with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
System.Object[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCredentials [-Entity <Object[]>] [-Name <String[]>] [<CommonParameters>]
```
