Add-VBRComputerRecoveryToken
----------------------------

### Synopsis
Creates tokens for bare-metal recovery.

---

### Description

This cmdlet creates tokens that you can use to perform bare-metal recovery.
Consider the following:
- You can create tokens only for backups of computers created by Veeam Agent.
- You can not create tokens for Veeam Agent backups located in Veeam Cloud Connect repositories.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Creating Token for Bare-Metal Recovery

$backup = Get-VBRBackup
$expirationDate = Get-Date -Year 2023 -Month 2 -Day 18 -Hour 0 -Minute 0 -Second 0
Add-VBRComputerRecoveryToken -Backup $backup[3] -ExpirationDate $expirationDate -FriendlyName "Win2049 token"

Name           : Recovery token 2022-10-18T23:29:07.992 for Backup Job 1
RecoveryToken  : EBe0-7e8e-72a6-3Eb2
ExpirationDate : 2/18/2023 12:00:00 AM
Backup         : {Backup Job 1}
FriendlyName   : Win2049 token
This example shows how to create a token that you can use to perform bare-metal recovery. The friendly name is Win2049 token and the token will expire on 02.18.2023 at 12.00.00 AM.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Save the result to the $backup variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $expirationDate variable.
3. Run the Add-VBRComputerRecoveryToken cmdlet. Set the $backup variable as the Backup parameter value. Set the $expirationDate variable as the ExpirationDate parameter value. Specify the FriendlyName parameter value.
The Get-VBRBackup cmdlet will return an array of backups. Mind the ordinal number of the necessary backup (in our example, it is the fourth backup in the array).
The cmdlet output will contain the following details on the token: Name, RecoveryToken, ExpirationDate, Backup and FriendlyName.

---

### Parameters
#### **Backup**
Specifies an array of backups. The cmdlet will use a token to perform bare-metal recovery from these backups.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ExpirationDate**
Specifies the expiration date of a token.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **FriendlyName**
Specifies a token friendly name. The cmdlet will create a token with this name. If you do not specify a friendly name, the cmdlet will create a default friendly name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRComputerRecoveryToken -Backup <CBackup[]> [-ExpirationDate <DateTime>] [-FriendlyName <String>] [<CommonParameters>]
```
