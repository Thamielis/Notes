New-VBRADCustomCredentials
--------------------------

### Synopsis
Specifies custom credentials for authenticating with Active Directory objects.

---

### Description

This cmdlet specifies custom credentials for authenticating with Active Directory objects you want to add to a protection group. Veeam Backup & Replication uses these credentials for Veeam Agent deployment and backup\restore activities.
By default, Veeam Backup & Replication uses Master account credentials for authenticating with all Active Directory objects in a protection group. For authenticating with Active Directory objects that require different credentials Veeam Backup & Replication uses custom credentials.

---

### Related Links
* [Get-VBRADDomain](Get-VBRADDomain)

* [Find-VBRADEntity](Find-VBRADEntity)

---

### Examples
> Example 1. Specifying Credentials for Authenticating with Active Directory Objects

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
$root = Find-VBRADEntity -Domain $connection
$accounts = Find-VBRADEntity -Domain $connection -Root $root -Name Accounts
$ccreds = Get-Credential
New-VBRADCustomCredentials -Entity $accounts -Credentials $ccreds
This example shows how to specify custom credentials for authenticating with Active Directory objects.
Perform the following steps:
1. Run the Get-VBRADDomain cmdlet. Specify the ServerName and Credentials parameter values. Save the result to the $connection variable.
2. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Save the result to the $root variable.
3. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the $root variable as the Root parameter value. Specify the Name parameter value. Save the result to the $accounts variable.
4. Run the Get-Credential cmdlet. Type the credentials you want to use for authenticating with the Active Directory objects from the Accounts container. Save the result to the $ccreds variable.
5. Run the New-VBRADCustomCredentials cmdlet. Set the $accounts variable as the Entity parameter value. Set the $ccreds variable as the Credentials parameter value.
> Example 2. Specifying Master Account Credentials for Scope of Active Directory Objects

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
$objects = Find-VBRADEntity -Domain $connection -Name Support
New-VBRADCustomCredentials -Entity $objects
This example shows how to specify Master account credentials for the scope of Active Directory objects.
Perform the following steps:
1. Run the Get-VBRADDomain cmdlet. Specify the ServerName and Credentials parameter values. Save the result to the $connection variable.
2. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Specify the Name parameter value. Save the result to the $objects variable.
3. Run the New-VBRADCustomCredentials cmdlet. Set the $objects variable as the Entity parameter value.

---

### Parameters
#### **Credentials**
Specifies custom credentials for authenticating with Active Directory objects in a protection group.
If not set, Veeam Backup & Replication will use Master account credentials for authenticating with associated objects.
Note: for string type, enter a user name in the "Domain\Username" format.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **Entity**
Specifies Active Directory objects for which you want to specify custom credentials.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[VBRADEntity]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRADEntity

Veeam.Backup.Common.CCredentials

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRADCustomCredentials [-Credentials <CCredentials>] -Entity <VBRADEntity> [<CommonParameters>]
```
