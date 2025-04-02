New-HubUser
-----------

### Synopsis

---

### Description

---

### Parameters
#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **IsTemporaryPasswordSendByEmail**
If new Devolutions user and this is set to true, his temporary password will be send by email. If not, the temporary password will be display at the end of the user creation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **UserEmail**
Email of Devolutions user

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **UserLocale**
If new Devolutions user, set his account locale
Valid Values:

* en_US
* fr
* de
* es
* hu
* it
* nl
* pl
* ru
* sv
* uk
* zh_CHS
* zh_TW
* cs

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Language]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-HubUser -detailed". For technical information, type "Get-Help New-HubUser -full".

---

### Syntax
```PowerShell
New-HubUser [-UserEmail] <String> [[-UserLocale] <en_US | fr | de | es | hu | it | nl | pl | ru | sv | uk | zh_CHS | zh_TW | cs>] [[-IsTemporaryPasswordSendByEmail]] [[-HubContext] <HubContext>] [<CommonParameters>]
```
