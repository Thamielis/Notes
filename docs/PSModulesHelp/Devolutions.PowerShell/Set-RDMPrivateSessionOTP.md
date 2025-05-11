Set-RDMPrivateSessionOTP
------------------------

### Synopsis

---

### Description

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
Credential entry's ID whose OTP value must be updated.

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
Send refresh notification to Remote Desktop Manager application. Use SetSession to persist the modification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SetSession**
Save the entry in the current data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TimeStep**
Refresh rate, in seconds, of the OTP.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMPrivateSessionOTP -detailed". For technical information, type "Get-Help Set-RDMPrivateSessionOTP -full".

---

### Syntax
```PowerShell
Set-RDMPrivateSessionOTP [-ID] <Guid> [-Key] <SecureString> [-Account <String>] [-Application <String>] [-TimeStep <Int32>] [-CodeSize <Six | Eight>] [-HashAlgorithm <SHA1 | SHA256 | SHA512>] [-PassThru] [-Refresh] [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
```PowerShell
Set-RDMPrivateSessionOTP [-InputObject] <PSConnection> [-Key] <SecureString> [-Account <String>] [-Application <String>] [-TimeStep <Int32>] [-CodeSize <Six | Eight>] [-HashAlgorithm <SHA1 | SHA256 | SHA512>] [-PassThru] [-Refresh] [-SetSession] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
