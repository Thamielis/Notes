ConvertTo-DistinguishedName
---------------------------

### Synopsis
Converts CanonicalName to DistinguishedName

---

### Description

Converts CanonicalName to DistinguishedName for 3 different options

---

### Examples
> EXAMPLE 1

$CanonicalObjects = @(
'ad.evotec.xyz/Production/Groups/Security/ITR03_AD Admins'
'ad.evotec.xyz/Production/Accounts/Special/SADM Testing 2'
)
$CanonicalOU = @(
    'ad.evotec.xyz/Production/Groups/Security/NetworkAdministration'
    'ad.evotec.xyz/Production'
)
$CanonicalDomain = @(
    'ad.evotec.xyz/Production/Groups/Security/ITR03_AD Admins'
    'ad.evotec.pl'
    'ad.evotec.xyz'
    'test.evotec.pl'
    'ad.evotec.xyz/Production'
)
$CanonicalObjects | ConvertTo-DistinguishedName -ToObject
$CanonicalOU | ConvertTo-DistinguishedName -ToOU
$CanonicalDomain | ConvertTo-DistinguishedName -ToDomain

Output:
CN=ITR03_AD Admins,OU=Security,OU=Groups,OU=Production,DC=ad,DC=evotec,DC=xyz
CN=SADM Testing 2,OU=Special,OU=Accounts,OU=Production,DC=ad,DC=evotec,DC=xyz
Output2:
OU=NetworkAdministration,OU=Security,OU=Groups,OU=Production,DC=ad,DC=evotec,DC=xyz
OU=Production,DC=ad,DC=evotec,DC=xyz
Output3:
DC=ad,DC=evotec,DC=xyz
DC=ad,DC=evotec,DC=pl
DC=ad,DC=evotec,DC=xyz
DC=test,DC=evotec,DC=pl
DC=ad,DC=evotec,DC=xyz

---

### Parameters
#### **CanonicalName**
One or multiple canonical names

|Type        |Required|Position|PipelineInput                 |Aliases        |
|------------|--------|--------|------------------------------|---------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|Identity<br/>CN|

#### **ToOU**
Converts CanonicalName to OrganizationalUnit DistinguishedName

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToObject**
Converts CanonicalName to Full Object DistinguishedName

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToDomain**
Converts CanonicalName to Domain DistinguishedName

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertTo-DistinguishedName [-CanonicalName <String[]>] [-ToDomain] [<CommonParameters>]
```
```PowerShell
ConvertTo-DistinguishedName [-CanonicalName <String[]>] [-ToObject] [<CommonParameters>]
```
```PowerShell
ConvertTo-DistinguishedName [-CanonicalName <String[]>] [-ToOU] [<CommonParameters>]
```
