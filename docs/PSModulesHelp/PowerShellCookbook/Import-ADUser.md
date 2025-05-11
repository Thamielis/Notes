Import-ADUser
-------------

### Synopsis
Create users in Active Directory from the content of a CSV.

---

### Description

In the user CSV, One column must be named "CN" for the user name.
All other columns represent properties in Active Directory for that user.

For example:
CN,userPrincipalName,displayName,manager
MyerKen,Ken.Myer@fabrikam.com,Ken Myer,
DoeJane,Jane.Doe@fabrikam.com,Jane Doe,"CN=MyerKen,OU=West,OU=Sales,DC=..."
SmithRobin,Robin.Smith@fabrikam.com,Robin Smith,"CN=MyerKen,OU=West,OU=..."

---

### Examples
> EXAMPLE 1

```PowerShell
$container = "LDAP://localhost:389/ou=West,ou=Sales,dc=Fabrikam,dc=COM"
PS > Import-ADUser.ps1 $container .\users.csv
```

---

### Parameters
#### **Container**
The container in which to import users
For example:
"LDAP://localhost:389/ou=West,ou=Sales,dc=Fabrikam,dc=COM)")

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Path**
The path to the CSV that contains the user records

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Import-ADUser [-Container] <Object> [-Path] <Object> [<CommonParameters>]
```
