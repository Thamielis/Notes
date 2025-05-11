Get-ADDBDomainController
------------------------

### Synopsis
Reads information about the originating DC from a ntds.dit file, including domain name, domain SID, DC name and DC site.

---

### Description

Reads domain controller (DC) infromation from a ntds.dit file that is either retrieved from an offline DC or from an (IFM) backup.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Get-ADDBDomainController.md)

* [Set-ADDBDomainController](Set-ADDBDomainController)

* [Set-ADDBPrimaryGroup](Set-ADDBPrimaryGroup)

* [Add-ADDBSidHistory](Add-ADDBSidHistory)

---

### Examples
> Example 1

```PowerShell
PS C:\> Get-ADDBDomainController -DatabasePath .\ntds.dit
<# Sample Output:
Name                       : LON-DC1
DNSHostName                : LON-DC1.contoso.com
ServerReference            : CN=LON-DC1,OU=Domain Controllers,DC=contoso,DC=com
DomainName                 : contoso.com
ForestName                 : contoso.com
NetBIOSDomainName          : contoso
DomainSid                  : S-1-5-21-1236425271-2880748467-2592687428
DomainGuid                 : 262d915a-3c58-4614-86c0-f9fb3f1aa1cd
Guid                       : 71ccee43-1c03-4ab1-910c-ed4168df5a33
Sid                        : S-1-5-21-1236425271-2880748467-2592687428-1111
DomainMode                 : WinThreshold
ForestMode                 : WinThreshold
SiteName                   : Default-First-Site-Name
DsaGuid                    : 0a8574e2-9361-4f3c-8528-ca73d7534f4b
InvocationId               : 14a1b16d-591c-45bc-a342-153090027bbc
IsADAM                     : False
IsGlobalCatalog            : True
Options                    : GlobalCatalog
OSName                     : Windows Server 2019 Datacenter
OSVersion                  : 10.0
OSVersionMajor             : 10
OSVersionMinor             : 0
DomainNamingContext        : DC=contoso,DC=com
ConfigurationNamingContext : CN=Configuration,DC=contoso,DC=com
SchemaNamingContext        : CN=Schema,CN=Configuration,DC=contoso,DC=com
WritablePartitions         : {DC=contoso,DC=com, CN=Configuration,DC=contoso,DC=com, CN=Schema,CN=Configuration,DC=contoso,DC=com, DC=DomainDnsZones,DC=contoso,DC=com...}
State                      : BackedUp
HighestCommittedUsn        : 69642
UsnAtIfm                   :
BackupUsn                  : 65812
BackupExpiration           : 2/4/2020 6:32:27 AM
Epoch                      : 961
#>
Reads DC information from a ntds.dit file located in the working directory.
```

---

### Parameters
#### **DatabasePath**
Specifies the path to a domain database, for instance, C:\Windows\NTDS\ntds.dit.

|Type      |Required|Position|PipelineInput|Aliases                                                |
|----------|--------|--------|-------------|-------------------------------------------------------|
|`[String]`|true    |named   |False        |Database<br/>DBPath<br/>DatabaseFilePath<br/>DBFilePath|

#### **LogPath**
Specifies the path to a directory where the transaction log files are located. For instance, C:\Windows\NTDS. The default log directory is the one that contains the database file itself.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|false   |named   |False        |Log<br/>TransactionLogPath|

---

### Inputs
None

---

### Outputs
* DSInternals.PowerShell.DomainController

---

### Notes

---

### Syntax
```PowerShell
Get-ADDBDomainController -DatabasePath <String> [-LogPath <String>] [<CommonParameters>]
```
