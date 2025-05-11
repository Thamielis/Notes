Add-SecureSetting
-----------------

### Synopsis
Adds an encrypted setting to the registry

---

### Description

Stores secured user settings in the registry

---

### Related Links
* [https://www.youtube.com/watch?v=0haXavQU_nY](https://www.youtube.com/watch?v=0haXavQU_nY)

* [Get-SecureSetting](Get-SecureSetting)

* [ConvertTo-SecureString](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Security/ConvertTo-SecureString)

* [ConvertFrom-SecureString](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Security/ConvertFrom-SecureString)

---

### Examples
> EXAMPLE 1

```PowerShell
Add-SecureSetting AStringSetting 'A String'
```
> EXAMPLE 2

```PowerShell
Add-SecureSetting AHashtableSetting @{a='b';c='d'}
```
> EXAMPLE 3

```PowerShell
Add-SecureSetting ACredentialSetting (Get-Credential)
```
> EXAMPLE 4

```PowerShell
Add-SecureSetting ASecureStringSetting (Read-Host "Is It Secret?" -AsSecureString)
```

---

### Parameters
#### **Name**
The name of the secure setting

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **String**
A string value to store.  This will be converted into a secure string and stored in the registry.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **SecureString**
An existing secure string to the registry.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[SecureString]`|true    |2       |true (ByPropertyName)|

#### **Hashtable**
A table of values.  The table will be converted to a string, and this string will be stored in the registry.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|true    |2       |true (ByPropertyName)|

#### **Credential**
A credential.  The credential will stored in the registry as a pair of secured values.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|true    |2       |true (ByPropertyName)|

---

### Outputs
* SecureSetting

---

### Syntax
```PowerShell
Add-SecureSetting [-Name] <String> [-SecureString] <SecureString> [<CommonParameters>]
```
```PowerShell
Add-SecureSetting [-Name] <String> [-String] <String> [<CommonParameters>]
```
```PowerShell
Add-SecureSetting [-Name] <String> [-Hashtable] <Hashtable> [<CommonParameters>]
```
```PowerShell
Add-SecureSetting [-Name] <String> [-Credential] <PSCredential> [<CommonParameters>]
```
