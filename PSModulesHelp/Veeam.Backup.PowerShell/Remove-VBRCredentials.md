Remove-VBRCredentials
---------------------

### Synopsis
Removes credentials records from Veeam Backup & Replication.

---

### Description

This cmdlet permanently removes the selected credentials record from the Veeam Backup & Replication database.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Removing Credentials Record Using User Name [Using Variable]

$credentials = Get-VBRCredentials -Name "Administrator"
Remove-VBRCredentials -Credential $credentials
This example shows how to remove the credentials record with the Administrator user name.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
2. Run the Remove-VBRCredentials cmdlet. Set the $credentials variable as the Credential parameter value.
> Example 2. Removing Credentials Record Using User Name [Using Pipeline]

Get-VBRCredentials -Name "Administrator" | Remove-VBRCredentials
This example shows how to remove the credentials record with the Administrator user name.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRCredentials cmdlet.
> Example 3. Removing Specific Credentials Record

$credentials = Get-VBRCredentials
Remove-VBRCredentials -Credential $credentials[1]
This example shows how to remove the specific credentials record.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $credentials variable.
The Get-VBRCredentials cmdlet will return an array of credential records. Mind the ordinal number of the necessary credential record (in our example, it is the second restore session in the array).
2. Run the Remove-VBRCredentials cmdlet. Set the $credentials variable as the Credential parameter value.

---

### Parameters
#### **Credential**
Specifies credentials you want to remove.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CCredentials]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.Common.CCredentials

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCredentials -Credential <CCredentials> [-Confirm] [-WhatIf] [<CommonParameters>]
```
