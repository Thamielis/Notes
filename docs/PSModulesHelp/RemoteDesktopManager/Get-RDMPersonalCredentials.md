Get-RDMPersonalCredentials
--------------------------

### Synopsis
Get the connection representing 'MyPersonalCredentials'.

---

### Description

Get the connection representing 'MyPersonalCredentials'. All the pertinent informations are in the property Credentials. On Windows, the policy DisableMyPersonalCredentials prevent using this cmdlet.

---

### Related Links
* [Set-RDMPersonalCredentials](Set-RDMPersonalCredentials)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $persoCreds = Get-RDMPersonalCredentials
Store the personal credentials in the variable $persoCreds. Access the desired values in $persoCreds.Credentials.
```
> EXAMPLE 2

PS C:\> $perso = Get-RDMPersonalCredentials; $perso.Credentials.SecretServerPassword = (ConvertTo-SecureString -AsPlainText 'aPassword'); $perso.Credentials.SecretServerUsername = 'aPassword'; $perso.Credentials.SecretServerDomain = 'aDomain'; Set-RDMPersonalCredentials -Session $perso
Fetch the personal credentials. Modify the Secret Server's domain, password and username value. Save the modificatons.  The password modification can be seen in the value change of the field SafeSecretServerPassword.

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Get-RDMPersonalCredentials -detailed". For technical information, type "Get-Help Get-RDMPersonalCredentials -full".

---
