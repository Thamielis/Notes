New-RDMRandomPassword
---------------------

### Synopsis
Create a new random password

---

### Description

Create a new random password

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $randomPassword = New-RDMRandomPassword
Generate a random password with the default settings
```
> EXAMPLE 2

```PowerShell
PS C:\> $randomPassword = New-RDMRandomPassword -TemplateName $templateName
Generate a random password with the template settings
```
> EXAMPLE 3

```PowerShell
PS C:\> $session = Get-RDMSession -Name MySession; $randomPassword = New-RDMRandomPassword -Session $session
Generate a random password with the password complexity of the session
```
> EXAMPLE 4

```PowerShell
PS C:\> $pwd = New-RandomPassword -Mode Default -MinimumDigit 10 -MinimumLength 1
Generate a random password composed of 10 digits.
```
> EXAMPLE 5

```PowerShell
PS C:\> $pwd = New-RandomPassword -Mode SpecifiedSettings -Digit 1 -Bracket 0 -Underline 1 -Lowercase 0 -Special 0 -Uppercase 0
Generate a random password composed of at least 1 digit and 1 underline. The other characters are either a digit, a lowercase, an uppercase, a special symbol, a bracket , or an underline. High ANSI, minus and space characters are not present in the password. There is not guarantuee the password is XML Compliant.
```

---

### Parameters
#### **Mode**

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[PasswordGeneratorMode]`|true    |1       |false        |

#### **Session**
Generate a random password with the password complexity of that session

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSConnection]`|false   |1       |false        |

#### **TemplateName**
Generate a random password with the template settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-RDMRandomPassword -detailed". For technical information, type "Get-Help New-RDMRandomPassword -full".

---

### Syntax
```PowerShell
New-RDMRandomPassword [[-Session] <PSConnection>] [<CommonParameters>]
```
```PowerShell
New-RDMRandomPassword [[-TemplateName] <String>] [<CommonParameters>]
```
```PowerShell
New-RDMRandomPassword [-Mode] <Default | SpecifiedSettings | HumanReadable | Pattern | Pronounceable | Strong | Passphrase> [<CommonParameters>]
```
