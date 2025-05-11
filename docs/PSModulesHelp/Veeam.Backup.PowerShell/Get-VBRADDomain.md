Get-VBRADDomain
---------------

### Synopsis
Creates an object for connecting to Active Directory domain.

---

### Description

This cmdlet creates the VBRADDomain object for connecting to the Active Directory domain.
Veeam Backup & Replication will use this object to access Active Directory objects that you want to add to the scope of a protection group.

---

### Related Links
* [Find-VBRADEntity](Find-VBRADEntity)

---

### Examples
> Example 1. Creating Active Directory Domain Connection Object

$adcreds = Get-Credential
Get-VBRADDomain -Server support.north -Credentials $adcreds
This example shows how to create an Active Directory domain connection object using credentials.
Perform the following steps:
1. Run the Get-Credential cmdlet. Type the credentials you want to use for authenticating with the DC server or Active Directory domain. Save the result to the $adcreds variable.
2. Run the Get-VBRADDomain cmdlet. Specify the Server parameter value. Set the $adcreds variable as the Credentials parameter value.
> Example 2. Creating Active Directory Domain Connection Object

```PowerShell
Get-VBRADDomain -Server support.north -Credentials support\jsmith
This command shows how to create an Active Directory domain connection object using credentials in the Domain\Username format.
```

---

### Parameters
#### **Credentials**
Specifies credentials for authenticating with DC server/Domain.
Note: for string type, enter a user name in the Domain\Username format.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|true    |named   |True (ByPropertyName)|

#### **Port**
Specifies the port for authenticating with the DC server/Domain.
Default: 389.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |True (ByPropertyName)|

#### **ServerName**
Specifies the name for connecting to DC server/domain:
* DNS name for DC server
* FQDN or NetBIOS for domain

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

System.Int32

Veeam.Backup.Common.CCredentials

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRADDomain -Credentials <CCredentials> [-Port <Int32>] -ServerName <String> [<CommonParameters>]
```
