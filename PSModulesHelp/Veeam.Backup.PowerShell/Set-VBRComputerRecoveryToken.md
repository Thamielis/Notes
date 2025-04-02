Set-VBRComputerRecoveryToken
----------------------------

### Synopsis
Modifies tokens for bare-metal recovery.

---

### Description

This cmdlet modifies settings of tokens that you can use to perform bare-metal recovery.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerRecoveryToken](Get-VBRComputerRecoveryToken)

---

### Examples
> Modifying Expiration Date of Tokens for Bare-Metal Recovery

$token = Get-VBRComputerRecoveryToken
$expirationDate = Get-Date -Year 2023 -Month 2 -Day 20 -Hour 0 -Minute 0 -Second 0
Set-VBRComputerRecoveryToken -RecoveryToken $token -ExpirationDate $expirationDate
This example shows how to modify an expiration date of tokens that you can use to perform bare-metal recovery. The cmdlet will set expiration date to 02.20.2023 at 12.00.00 AM.
Perform the following steps:
1. Run the Get-VBRComputerRecoveryToken cmdlet. Save the result to the $token variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $expirationDate variable.
3. Run the Set-VBRComputerRecoveryToken cmdlet. Set the $token variable as the RecoveryToken parameter value. Set the $expirationDate variable as the ExpirationDate parameter value.

---

### Parameters
#### **ExpirationDate**
Specifies the expiration date of a token.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **FriendlyName**
Specifies a token friendly name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RecoveryToken**
Specifies an array of token. The cmdlet will modify these tokens.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRComputerRecoveryToken[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerRecoveryToken[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerRecoveryToken [-ExpirationDate <DateTime>] [-FriendlyName <String>] -RecoveryToken <VBRComputerRecoveryToken[]> [<CommonParameters>]
```
