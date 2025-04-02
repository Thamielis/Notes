Get-RDMEntryOTP
---------------

### Synopsis
Get a hastable of the OTP code with the remaining time of an OTP entry

---

### Description

Get a hastable of the OTP code with the remaining time of an OTP entry.
    To obtain the OTP code, the user must be able to copy it. Generally, this means the right to view it. The status of the entry, such as Locked or Expired, can also prevent the obtention of the OTP code.
    If the data source required a prompt on credentials viewed, the user will be prompted for each required field. To avoid this, the TicketID and Comment parameters must be used.

---

### Related Links
* [Set-RDMEntryOTP](Set-RDMEntryOTP)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $otp = Get-RDMEntry -Name MyOTPEntry | Get-RDMEntryOTP;
    $otp.Code
Get the OTP code of the entry MyOTPEntry
```

---

### Parameters
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
ID of the entry to modify. Use the VaultMode parameter to search in the User vault or the Global vault.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
Specifies the entry to get the OTP from.

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

PSConnection object of the OTP entry obtained from Get-RDMEntry

---

### Outputs
* [Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]])

---

### Notes
For more information, type "Get-Help Get-RDMEntryOTP -detailed". For technical information, type "Get-Help Get-RDMEntryOTP -full".

---

### Syntax
```PowerShell
Get-RDMEntryOTP [-ID] <Guid> [-VaultMode <Default | User | Global>] [-Comment <String>] [-TicketID <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Get-RDMEntryOTP [-InputObject] <PSConnection> [-Comment <String>] [-TicketID <String>] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
