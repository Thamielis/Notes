Get-RDMEntryOTPKey
------------------

### Synopsis
Get the OTP key of an OTP entry

---

### Description

Get the OTP key of an OTP entry.
The entry is either specified by its ID, or by the PSConnection obtained from Get-RDMEntry. When using the parameter ID, the parameter VaultMode can be used to specify to look in the Global vault or the User vault directly. If the parameter VaultMode is not used, the current vault will be searched, followed by the User and Global vaults.
The TicketID and Comment parameters can be used to fill the log prompt. It is used to fill the prompt for comment on credentials viewed. This a setting of the data source or vault in the Common -> Logs tab.
The user must have the rights to edit the entry to obtain the OTP key.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMEntry -Name MyOTPEntry | Get-RDMEntryOTPKey -AsPlainText
Get the OTP key of the entry named MyOTPEntry
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-RDMEntryOTPKey -ID $otpEntryID -VaultMode User -AsPlainText
Get the OTP key of the entry, in the user vault, whose ID is stored in the variable $otpEntry
```

---

### Parameters
#### **AsPlainText**
Return the OTP key as plain text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Comment**
Comment for the credential viewed log.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **ID**
OTP entry's ID with the OTP key to extract

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
OTP entry obtained from Get-RDMEntry with the OTP key to extract

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **TicketID**
Ticket number for the credential viewed log

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
* Default: Current vault that has been set.
* User: Vault specific to the current user.
* Global: Global vault of the data source.
Valid Values:

* Default
* User
* Global

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VaultMode]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

PSConnection object obtained from Get-DSEntry

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

* [Security.SecureString](https://learn.microsoft.com/en-us/dotnet/api/System.Security.SecureString)

---

### Notes
For more information, type "Get-Help Get-RDMEntryOTPKey -detailed". For technical information, type "Get-Help Get-RDMEntryOTPKey -full".

---

### Syntax
```PowerShell
Get-RDMEntryOTPKey [-ID] <Guid> [-VaultMode <Default | User | Global>] [-Comment <String>] [-TicketID <String>] [-AsPlainText] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryOTPKey [-InputObject] <PSConnection> [-Comment <String>] [-TicketID <String>] [-AsPlainText] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
