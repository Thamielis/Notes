Convert-Identity
----------------

### Synopsis
Small command that tries to resolve any given object

---

### Description

Small command that tries to resolve any given object - be it SID, DN, FSP or Netbiosname

---

### Examples
> EXAMPLE 1

$Identity = @(
    'S-1-5-4'
    'S-1-5-4'
    'S-1-5-11'
    'S-1-5-32-549'
    'S-1-5-32-550'
    'S-1-5-32-548'
    'S-1-5-64-10'
    'S-1-5-64-14'
    'S-1-5-64-21'
    'S-1-5-18'
    'S-1-5-19'
    'S-1-5-32-544'
    'S-1-5-20-20-10-51' # Wrong SID
    'S-1-5-21-853615985-2870445339-3163598659-512'
    'S-1-5-21-3661168273-3802070955-2987026695-512'
    'S-1-5-21-1928204107-2710010574-1926425344-512'
    'CN=Test Test 2,OU=Users,OU=Production,DC=ad,DC=evotec,DC=pl'
    'Test Local Group'
    'przemyslaw.klys@evotec.pl'
    'test2'
    'NT AUTHORITY\NETWORK'
    'NT AUTHORITY\SYSTEM'
    'S-1-5-21-853615985-2870445339-3163598659-519'
    'TEST\some'
    'EVOTECPL\Domain Admins'
    'NT AUTHORITY\INTERACTIVE'
    'INTERACTIVE'
    'EVOTEC\Domain Admins'
    'EVOTECPL\Domain Admins'
    'Test\Domain Admins'
    'CN=S-1-5-21-1928204107-2710010574-1926425344-512,CN=ForeignSecurityPrincipals,DC=ad,DC=evotec,DC=xyz' # Valid
    'CN=S-1-5-21-1928204107-2710010574-512,CN=ForeignSecurityPrincipals,DC=ad,DC=evotec,DC=xyz' # not valid
    'CN=S-1-5-21-1928204107-2710010574-1926425344-512,CN=ForeignSecurityPrincipals,DC=ad,DC=evotec,DC=xyz' # cached
)
$TestOutput = Convert-Identity -Identity $Identity -Verbose

Output:

Name                                 SID                                            DomainName     Type                    Error
----                                 ---                                            ----------     ----                    -----
NT AUTHORITY\INTERACTIVE             S-1-5-4                                                       WellKnownGroup
NT AUTHORITY\INTERACTIVE             S-1-5-4                                                       WellKnownGroup
NT AUTHORITY\Authenticated Users     S-1-5-11                                                      WellKnownGroup
BUILTIN\Server Operators             S-1-5-32-549                                                  WellKnownGroup
BUILTIN\Print Operators              S-1-5-32-550                                                  WellKnownGroup
BUILTIN\Account Operators            S-1-5-32-548                                                  WellKnownGroup
NT AUTHORITY\NTLM Authentication     S-1-5-64-10                                                   WellKnownGroup
NT AUTHORITY\SChannel Authentication S-1-5-64-14                                                   WellKnownGroup
NT AUTHORITY\Digest Authentication   S-1-5-64-21                                                   WellKnownGroup
NT AUTHORITY\SYSTEM                  S-1-5-18                                                      WellKnownAdministrative
NT AUTHORITY\NETWORK SERVICE         S-1-5-19                                                      WellKnownGroup
BUILTIN\Administrators               S-1-5-32-544                                                  WellKnownAdministrative
S-1-5-20-20-10-51                    S-1-5-20-20-10-51                                             Unknown                 Exception calling "Translate" with "1" argument(s): "Some or all identity references could not be translated."
EVOTEC\Domain Admins                 S-1-5-21-853615985-2870445339-3163598659-512   ad.evotec.xyz  Administrative
EVOTECPL\Domain Admins               S-1-5-21-3661168273-3802070955-2987026695-512  ad.evotec.pl   Administrative
TEST\Domain Admins                   S-1-5-21-1928204107-2710010574-1926425344-512  test.evotec.pl Administrative
EVOTECPL\TestingAD                   S-1-5-21-3661168273-3802070955-2987026695-1111 ad.evotec.pl   NotAdministrative
EVOTEC\Test Local Group              S-1-5-21-853615985-2870445339-3163598659-3610  ad.evotec.xyz  NotAdministrative
EVOTEC\przemyslaw.klys               S-1-5-21-853615985-2870445339-3163598659-1105  ad.evotec.xyz  NotAdministrative
test2                                                                                              Unknown                 Exception calling "Translate" with "1" argument(s): "Some or all identity references could not be translated."
NT AUTHORITY\NETWORK                 S-1-5-2                                                       WellKnownGroup
NT AUTHORITY\SYSTEM                  S-1-5-18                                                      WellKnownAdministrative
EVOTEC\Enterprise Admins             S-1-5-21-853615985-2870445339-3163598659-519   ad.evotec.xyz  Administrative
TEST\some                            S-1-5-21-1928204107-2710010574-1926425344-1106 test.evotec.pl NotAdministrative
EVOTECPL\Domain Admins               S-1-5-21-3661168273-3802070955-2987026695-512  ad.evotec.pl   Administrative
NT AUTHORITY\INTERACTIVE             S-1-5-4                                                       WellKnownGroup
NT AUTHORITY\INTERACTIVE             S-1-5-4                                                       WellKnownGroup
EVOTEC\Domain Admins                 S-1-5-21-853615985-2870445339-3163598659-512   ad.evotec.xyz  Administrative
EVOTECPL\Domain Admins               S-1-5-21-3661168273-3802070955-2987026695-512  ad.evotec.pl   Administrative
TEST\Domain Admins                   S-1-5-21-1928204107-2710010574-1926425344-512  test.evotec.pl Administrative
TEST\Domain Admins                   S-1-5-21-1928204107-2710010574-1926425344-512  test.evotec.pl Administrative
S-1-5-21-1928204107-2710010574-512   S-1-5-21-1928204107-2710010574-512                            Unknown                 Exception calling "Translate" with "1" argument(s): "Some or all identity references could not be translated."
TEST\Domain Admins                   S-1-5-21-1928204107-2710010574-1926425344-512  test.evotec.pl Administrative

---

### Parameters
#### **Identity**
Type to resolve in form of Identity, DN, SID

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |1       |true (ByValue, ByPropertyName)|

#### **SID**
Allows to pass SID directly, rather then going thru verification process

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[SecurityIdentifier[]]`|true    |named   |false        |

#### **Name**
Allows to pass Name directly, rather then going thru verification process

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |false        |

#### **Force**
Allows to clear cache, useful when you want to force refresh

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-Identity [[-Identity] <String[]>] [-Force] [<CommonParameters>]
```
```PowerShell
Convert-Identity -SID <SecurityIdentifier[]> [-Force] [<CommonParameters>]
```
```PowerShell
Convert-Identity -Name <String[]> [-Force] [<CommonParameters>]
```
