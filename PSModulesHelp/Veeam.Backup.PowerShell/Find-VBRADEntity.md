Find-VBRADEntity
----------------

### Synopsis
Looks for Active Directory objects.

---

### Description

This cmdlet looks for Active Directory objects.
You can use this cmdlet to search for Active Directory objects you plan to add to the scope of a protection group.

---

### Related Links
* [Get-VBRADDomain](Get-VBRADDomain)

---

### Examples
> Example 1. Getting All Active Directory Objects

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
Find-VBRADEntity -Domain $connection -Recurse
This example shows how to get all Active Directory objects.
Perform the following steps:
1. Run the Get-VBRADDomain cmdlet. Specify the ServerName and Credentials parameter values. Save the result to the $connection variable.
2. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Provide the Recurse parameter.
> Example 2. Getting Active Directory Objects by Name

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
Find-VBRADEntity -Domain $connection -Name *account* -Recurse
This example shows how to get Active Directory objects with names containing account.
Perform the following steps:
1. Run the Get-VBRADDomain cmdlet. Specify the ServerName and Credentials parameter values. Save the result to the $connection variable.
2. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Specify the Name parameter value. Provide the Recurse parameter.
> Example 3. Getting Active Directory Objects from Container

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
$root = Find-VBRADEntity -Domain $connection
$accounts = Find-VBRADEntity -Domain $connection -Root $root -Name Accounts
Find-VBRADEntity -Domain $connection -Root $accounts -Recurse
This example shows how to get Active Directory objects from the Accounts container.
Perform the following steps:
1. Run the Get-VBRADDomain cmdlet. Specify the ServerName and Credentials parameter values. Save the result to the $connection variable.
2. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Save the result to the $root variable.
3. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the $root variable as the Root parameter value. Specify the Name parameter value. Save the result to the $accounts variable.
4. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the $accounts variable as the Root parameter value. Provide the Recurse parameter.
> Example 4. Getting Active Directory Objects by Type

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
Find-VBRADEntity -Domain $connection -Type OrganizationUnit -Recurse
This example shows how to get all Active Directory objects of the OrganizationUnit type.
Perform the following steps:
1. Run the Get-VBRADDomain cmdlet. Specify the ServerName and Credentials parameter values. Save the result to the $connection variable.
2. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the OrganizationUnit option for the Type parameter. Provide the Recurse parameter.
> Example 5. Getting Active Directory Objects by ID

$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
Find-VBRADEntity -Domain $connection -Id 3826d21c-0f7d-4c80-b5ef-b5568e967a6a, 85950671-5e3a-481f-8408-5af40de317c6
This example shows how to get Active Directory objects by ID.
Perform the following steps:
1. Run the Get-VBRADDomain cmdlet. Specify the ServerName and Credentials parameter values. Save the result to the $connection variable.
2. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value.  Specify the Id parameter value.
> Example 6. Getting Active Directory Object using Veeam PowerShell and Microsoft Active Directory Windows PowerShell

$comp = Get-ADComputer SUPP-G3321
$compid = $comp.ObjectGUID
$connection = Get-VBRADDomain -ServerName support.east -Credentials support\jsmith
Find-VBRADEntity -Domain $connection -Id $compid
This example shows how to get an Active Directory object using both Veeam PowerShell and Microsoft Active Directory Windows PowerShell cmdlets.
Perform the following steps:
1. Make sure you have the Active Directory Windows PowerShell module installed. For more information, see https://technet.microsoft.com/en-us/library/dd378783(WS.10).aspx#Anchor_5.
2. Run the Get-ADComputer to get the Active Directory computer. Save the result to the $comp variable.
3. Use the ObjectGUID property of the $comp variable. Save the result to the $compid variable.
4. Run the Get-VBRADDomain cmdlet. Specify the ServerName and Credentials parameter values. Save the result to the $connection variable.
5. Run the Find-VBRADEntity cmdlet. Set the $connection variable as the Domain parameter value. Set the $compid variable as the Id parameter value.

---

### Parameters
#### **Domain**
Specifies the Active Directory domain connection object.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[VBRADDomain]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies the array of object IDs. The cmdlet will return objects with these IDs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

#### **Name**
Specifies the array of object names. The cmdlet will return objects with these names.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **Recurse**
Defines that the cmdlet will look for objects from all child containers of the specified container.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **Root**
Specifies the container of objects. The cmdlet will look for objects in this container.
If omitted, the cmdlet will look for objects in the domain container.

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[VBRADEntity]`|false   |named   |True (ByPropertyName)|

#### **Type**
Specifies the array of object types:
* Domain
* Cluster
* OrganizationUnit
* Group
* Folder
* Computer
The cmdlet will return objects of these types.
Valid Values:

* Domain
* Cluster
* OrganizationUnit
* Group
* Folder
* Computer

|Type                 |Required|Position|PipelineInput        |
|---------------------|--------|--------|---------------------|
|`[VBRADEntityType[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRADDomain

System.Guid[]

System.String[]

Veeam.Backup.PowerShell.Infos.VBRADEntityType[]

Veeam.Backup.PowerShell.Infos.VBRADEntity

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRADEntity -Domain <VBRADDomain> [-Id <Guid[]>] [-Recurse] [-Root <VBRADEntity>] [<CommonParameters>]
```
```PowerShell
Find-VBRADEntity -Domain <VBRADDomain> [-Name <String[]>] [-Recurse] [-Root <VBRADEntity>] [<CommonParameters>]
```
```PowerShell
Find-VBRADEntity -Domain <VBRADDomain> [-Recurse] [-Root <VBRADEntity>] [-Type {Domain | Cluster | OrganizationUnit | Group | Folder | Computer}] [<CommonParameters>]
```
