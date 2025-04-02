Get-WinADForestControllers
--------------------------

### Synopsis
Retrieves information about domain controllers in the specified domain(s).

---

### Description

This function retrieves detailed information about domain controllers in the specified domain(s), including hostname, IP addresses, roles, and other relevant details.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-WinADForestControllers -TestAvailability
Tests the availability of domain controllers in the forest.
```
> EXAMPLE 2

```PowerShell
Get-WinADDomainControllers
Retrieves information about all domain controllers in the forest.
```
> EXAMPLE 3

```PowerShell
Get-WinADDomainControllers -Credential $Credential
Retrieves information about all domain controllers in the forest using specified credentials.
```
> EXAMPLE 4

Get-WinADDomainControllers | Format-Table *
Displays detailed information about all domain controllers in a tabular format.
Output:
Domain        HostName          Forest        IPV4Address     IsGlobalCatalog IsReadOnly SchemaMaster DomainNamingMasterMaster PDCEmulator RIDMaster InfrastructureMaster Comment
------        --------          ------        -----------     --------------- ---------- ------------ ------------------------ ----------- --------- -------------------- -------
ad.evotec.xyz AD1.ad.evotec.xyz ad.evotec.xyz 192.168.240.189            True      False         True                     True        True      True                 True
ad.evotec.xyz AD2.ad.evotec.xyz ad.evotec.xyz 192.168.240.192            True      False        False                    False       False     False                False
ad.evotec.pl                    ad.evotec.xyz                                                   False                    False       False     False                False Unable to contact the server. This may be becau...

---

### Parameters
#### **Domain**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **TestAvailability**
Specifies whether to test the availability of domain controllers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipEmpty**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Credential**

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |2       |false        |

---

### Notes
This function provides essential information about domain controllers in the forest.

---

### Syntax
```PowerShell
Get-WinADForestControllers [[-Domain] <String[]>] [-TestAvailability] [-SkipEmpty] [[-Credential] <PSCredential>] [<CommonParameters>]
```
