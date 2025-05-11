Test-PasswordQuality
--------------------

### Synopsis
Performs AD audit, including checks for weak, duplicate, default and empty passwords. Accepts input from the Get-ADReplAccount and Get-ADDBAccount cmdlets.

---

### Description

The Test-PasswordQuality cmdlet is a simple tool for Active Directory password auditing. It can detect weak, duplicate, default, non-expiring or empty passwords and find accounts that are violating security best practices. The cmdlet accepts output of the Get-ADDBAccount and Get-ADReplAccount cmdlets, so both offline (ntds.dit) and online (DCSync) password analysis can be done.

Lists of leaked passwords that can be obtained from HaveIBeenPwned are fully supported. Be sure to download the list that is marked as "NTLM (ordered by hash)" and extract the archive to your HDD.

Although the cmdlet output is formatted in a human readable fashion, it is still an object, whose properties can be accessed separately (e.g. $result.WeakPassword) to produce a desired output. When scripted, it can be used to audit Active Directory passwords on a regular basis.

---

### Related Links
* [Online Version:](https://github.com/MichaelGrafnetter/DSInternals/blob/master/Documentation/PowerShell/Test-PasswordQuality.md)

* [Get-ADDBAccount](Get-ADDBAccount)

* [Get-ADReplAccount](Get-ADReplAccount)

---

### Examples
> Example 1

```PowerShell
PS C:\> Get-ADDBAccount -All -DatabasePath ntds.dit -BootKey acdba64a3929261b04e5270c3ef973cf |
          Test-PasswordQuality -WeakPasswordHashesSortedFilePath P:\pwnedpasswords_ntlm
          <# Sample Output:

Active Directory Password Quality Report
----------------------------------------

Passwords of these accounts are stored using reversible encryption:
  CONTOSO\smith
  CONTOSO\doe

LM hashes of passwords of these accounts are present:
  CONTOSO\hodge

These accounts have no password set:
  CONTOSO\test01
  CONTOSO\test02

Passwords of these accounts have been found in the dictionary:
  CONTOSO\Administrator

These groups of accounts have the same passwords:
  Group 1:
    CONTOSO\graham
    CONTOSO\graham_admin
  Group 2:
    CONTOSO\admin
    CONTOSO\sql_svc01

These user accounts have the SamAccountName as password:
  CONTOSO\sccm_admin

These computer accounts have default passwords:
  CONTOSO\DESKTOP27$

Kerberos AES keys are missing from these accounts:
  CONTOSO\sql_svc01

Kerberos pre-authentication is not required for these accounts:
  CONTOSO\jboss

Only DES encryption is allowed to be used with these accounts:
  CONTOSO\sql_svc01

These accounts are susceptible to the Kerberoasting attack:
  CONTOSO\Administrator
  CONTOSO\sp_svc01
  CONTOSO\sql_svc02

These administrative accounts are allowed to be delegated to a service:
  CONTOSO\AdatumAdmin
  CONTOSO\Administrator

Passwords of these accounts will never expire:
  CONTOSO\admin
  CONTOSO\sql_svc01

These accounts are not required to have a password:
  CONTOSO\gonzales

These accounts that require smart card authentication have a password:
  CONTOSO\smithj
  CONTOSO\jonesp
#>
Performs an offline credential hygiene audit of AD database against HIBP.
```
> Example 2

```PowerShell
PS C:\> $results = Get-ADReplAccount -All -Server LON-DC1 |
                   Test-PasswordQuality -WeakPasswords 'Pa$$w0rd','April2019' `
                                        -WeakPasswordHashesSortedFile pwned-passwords-ntlm-ordered-by-hash-v8.txt
Performs an online credential hygiene audit of AD against HIBP + a custom wordlist.
```
> Example 3

```PowerShell
PS C:\> $pwnedUsers = $accounts |
                      Test-PasswordQuality -WeakPasswordsFile rockyou.txt -SkipDuplicatePasswordTest |
                      Select-Object -ExpandProperty WeakPassword
Performs a dictionary attack against a set of accounts. The Test-PasswordQuality cmdlet always returns structured data.
```
> Example 4

```PowerShell
PS C:\> Get-ADDBAccount -All -DatabasePath ntds.dit -BootKey $key |
            where DistinguishedName -like '*OU=Employees,DC=contoso,DC=com' |
            Test-PasswordQuality -IncludeDisabledAccounts -WeakPasswordHashesSortedFile pwned-passwords-ntlm-ordered-by-hash-v5.txt
Performs an offline credential hygiene audit of a selected OU from AD database against HIBP.
```
> Example 5

```PowerShell
PS C:\> $contosoAccounts = Get-ADReplAccount -All -Server LON-DC1.contoso.com
PS C:\> $adatumAccounts = Get-ADReplAccount -All -Server NYC-DC1.adatum.com -Credential (Get-Credential)
PS C:\> $contosoAccounts + $adatumAccounts | Test-PasswordQuality
<# Sample Output (Partial):

These groups of accounts have the same passwords:
  Group 1:
    ADATUM\smith
    ADATUM\doe
  Group 2:
    ADATUM\Administrator
    ADATUM\joe_admin
    CONTOSO\Administrator
    CONTOSO\joe_admin
#>
Performs a cross-forest duplicate password discovery. Any number of Get-ADReplAccount and Get-ADDBAccount cmdlet outputs can be combined together, as long as the computer has enough memory.
```

---

### Parameters
#### **Account**
Active Directory account to check. The accounts are typically piped in from the Get-ADDBAccount and Get-ADReplAccount cmdlets.

|Type         |Required|Position|PipelineInput |Aliases                |
|-------------|--------|--------|--------------|-----------------------|
|`[DSAccount]`|true    |0       |True (ByValue)|ADAccount<br/>DSAccount|

#### **IncludeDisabledAccounts**
Process even accounts that are disabled. Such accounts are skipped otherwise.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SkipDuplicatePasswordTest**
Do not compare account hashes with each other.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WeakPasswordHashesFile**
Path to a file that contains NT hashes of weak passwords, one hash in HEX format per line. For performance reasons, the -WeakPasswordHashesSortedFile parameter should be used instead.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **WeakPasswordHashesSortedFile**
Path to a file that contains NT hashes of weak passwords, one hash in HEX format per line. The hashes must be sorted alphabetically, because a binary search is performed. This parameter is typically used with a list of leaked password hashes from HaveIBeenPwned.

|Type      |Required|Position|PipelineInput|Aliases                        |
|----------|--------|--------|-------------|-------------------------------|
|`[String]`|false   |named   |False        |HIBPFile<br/>HaveIBeenPwnedFile|

#### **WeakPasswords**
List of passwords that are considered weak, e.g. Password123 or April2019. If more than a handful passwords are to be tested, the WeakPasswordsFile parameter should be used instead.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **WeakPasswordsFile**
Path to a file that contains weak passwords, one password per line.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
DSInternals.Common.Data.DSAccount

---

### Outputs
* DSInternals.PowerShell.PasswordQualityTestResult

---

### Notes

---

### Syntax
```PowerShell
Test-PasswordQuality [-Account] <DSAccount> [-IncludeDisabledAccounts] [-SkipDuplicatePasswordTest] [-WeakPasswordHashesFile <String>] [-WeakPasswordHashesSortedFile <String>] [-WeakPasswordHashesSortedFilePath <String>] [-WeakPasswords <String[]>] [-WeakPasswordsFile <String>] [<CommonParameters>]
```
