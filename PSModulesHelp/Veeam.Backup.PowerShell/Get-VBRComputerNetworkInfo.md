Get-VBRComputerNetworkInfo
--------------------------

### Synopsis
Returns networks connected to Veeam Agent computers.

---

### Description

This cmdlet returns the VBRComputerNetworkInfo[] object. This object contains an array of networks connected to Veeam Agent computers. You can use this object to perform instant recovery of Veeam Agent computers.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Getting Networks Connected to Veeam Agent Computer

$winbackup = Get-VBRBackup -Name "WinBackup*"
$restorepoint = Get-VBRRestorePoint -Backup $winbackup
Get-VBRComputerNetworkInfo -RestorePoint $restorepoint[3]
Id                                                          Name
--                                                          ----
{460122C-6090-4774-B748-0FF45D6E34B7}                      Intel(R) 82454L Gigabit Network Connection
This example shows how to get details on the network to which a Veeam Agent computer is connected.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $winbackup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign in the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRBackup cmdlet will not return any restore points for the Veeam Agent job.
2. Run the Get-VBRRestorePoint cmdlet. Set the $winbackup variable as the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
3. Run the Get-VBRComputerNetworkInfo cmdlet. Set the $restorepoint[3] variable as the RestorePoint parameter value.
The cmdlet output will contain the following details on networks: Id and Name.

---

### Parameters
#### **RestorePoint**
Specifies a restore point of Veeam Agent computers. The cmdlet will return an array of networks that are connected to these Veeam Agent computers.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRComputerNetworkInfo

---

### Notes

---

### Syntax
```PowerShell
Get-VBRComputerNetworkInfo [-RestorePoint] <COib> [<CommonParameters>]
```
