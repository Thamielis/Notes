Set-RDMEntryOTP
---------------

### Synopsis
Set OTP properties of an entry

---

### Description

Set OTP properties of an entry. The entry to modify can be obtained from Get-RDMEntry or New-RDMEntry.
    To modify the OTP Entry, the user must have the appropriate rights: add for a new entry, and edit for an existing one.

---

### Related Links
* [Get-RDMEntryOTP](Get-RDMEntryOTP)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $otp = Get-RDMEntry -Name MyOTPEntry;
    $key = ConvertTo-SecureString -AsPlainText -String 'MyKey';
    Set-RDMEntryOTP -InputObject $otp -Key $key -Timestep 60 -Set
Update the OTP key and change the refresh rate of the code to 60 seconds. The changes are saved.
```

---

### Parameters
#### **Account**
OTP's associated account name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Application**
QR Code's application name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CodeSize**
OTP code's size. Must be 6 or 8 digits.
Valid Values:

* Six
* Eight

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[OTPCodeSize]`|false   |named   |false        |

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

#### **HashAlgorithm**
Algorithm used to hash the code.
Valid Values:

* SHA1
* SHA256
* SHA512

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[OTPHashAlgorithm]`|false   |named   |false        |

#### **ID**
ID of the entry to modify. Use the VaultMode parameter to search in the User vault or the Global vault.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **InputObject**
Credential entry whose OTP value must be updated.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSConnection]`|true    |1       |true (ByValue)|

#### **Key**
Key used to generate the OTP code.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SecureString]`|true    |2       |false        |

#### **PassThru**
Return the modified entry.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Refresh**
Send refresh notification to Remote Desktop Manager application. Use Set switch to persist the modification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Set**
Save the entry in the current data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TimeStep**
Refresh rate, in seconds, of the OTP.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **VaultMode**
Vault where the command will be applied. Three choices are offered:
        - Default: Current vault that has been set.
        - User: Vault specific to the current user.
        - Global: Global vault of the data source.
Valid Values:

* Default
* User
* Global

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VaultMode]`|false   |named   |false        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

PSConnection object of the OTP entry obtained from Get-RDMEntry

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Set-RDMEntryOTP -detailed". For technical information, type "Get-Help Set-RDMEntryOTP -full".

---

### Syntax
```PowerShell
Set-RDMEntryOTP [-ID] <Guid> [-VaultMode <Default | User | Global>] [-Key] <SecureString> [-Account <String>] [-Application <String>] [-CodeSize <Six | Eight>] [-TimeStep <Int32>] [-HashAlgorithm <SHA1 | SHA256 | SHA512>] [-PassThru] [-Refresh] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Set-RDMEntryOTP [-InputObject] <PSConnection> [-Key] <SecureString> [-Account <String>] [-Application <String>] [-CodeSize <Six | Eight>] [-TimeStep <Int32>] [-HashAlgorithm <SHA1 | SHA256 | SHA512>] [-PassThru] [-Refresh] [-Set] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
