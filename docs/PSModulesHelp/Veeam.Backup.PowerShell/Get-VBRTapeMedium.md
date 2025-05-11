Get-VBRTapeMedium
-----------------

### Synopsis
Returns tapes.

---

### Description

This cmdlet returns tapes managed by Veeam Backup & Replication.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRTapeMediaPool](Get-VBRTapeMediaPool)

* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

---

### Examples
> Example 1. Getting Tape by Name

```PowerShell
Get-VBRTapeMedium -Name "00110001"
This command gets a tape named "00110001".
```
> Example 2. Getting Tape by Barcode

Get-VBRTapeMedium | Where-Object {$_.barcode -eq "00233400"}
This example shows how to get a tape with the 00233400 barcode.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet to get all tapes.
2. Pipe the cmdlet output to the Where-Object cmdlet. Specify the Barcode value to equal 00233400.
> Example 3. Getting Tapes in Media Pool

$IncrementalBackups = Get-VBRTapeMediaPool -Name "Incremental Backups"
Get-VBRTapeMedium -MediaPool $IncrementalBackups
This example shows how to get the list of tapes in the Incremental Backups media pool.

Perform the following steps:
1. Run the Get-VBRTapeMediaPool cmdlet. Specify the Name parameter value. Save the result to the $IncrementalBackups variable.
2. Run the Get-VBRTapeMedium cmdlet. Set the $IncrementalBackups variable as the MediaPool parameter value.
> Example 4. Getting Expired Tapes in Vault

$Sydney = Get-VBRTapeVault -Name "Sydney"
Get-VBRTapeMedium -Vault $Sydney | ?{$_.IsExpired}
This example shows how to look for the expired tapes within the Sydney vault.

Perform the following steps:
1. Run the Get-VBRTapeVault cmdlet. Specify the Name parameter value. Save the result to the $Sydney variable.
2. Run the Get-VBRTapeMedium cmdlet. Set the $Sydney variable as the Vault parameter value.
3. Pipe the cmdlet output to the query to find all expired tapes.

---

### Parameters
#### **Drive**
Specifies the array of drives.  The cmdlet will return tapes located in these drives. Accepts the VBRTapeDrive[] object, GUID or string. To get this object, run the Get-VBRTapeDrive cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRTapeDrive[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies the array of tape IDs. The cmdlet will return tapes with these IDs. Accepts GUID[] or string[].

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Library**
Specifies the array of tape libraries.  The cmdlet will return tapes in these libraries. Accepts the VBRTapeLibrary[] object, GUID or string. To get this object, run the Get-VBRTapeLibrary cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **MediaPool**
Specifies the array of media pools.  The cmdlet will return tapes in these media pools. Accepts the VBRTapeMediaPool[] object, GUID or string. To get this object, run the Get-VBRTapeMediaPool cmdlet.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRTapeMediaPoolBase[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of tape names.  The cmdlet will return tapes with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Vault**
Specifies the array of vaults.  The cmdlet will return tapes in these vaults. Accepts the VBRTapeVault[] object, GUID or string. To get this object, run the Get-VBRTapeVault cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRTapeVault[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeDrive[]

System.Guid[]

System.String[]

Veeam.Backup.PowerShell.Infos.VBRTapeLibrary[]

Veeam.Backup.PowerShell.Infos.VBRTapeMediaPoolBase[]

Veeam.Backup.PowerShell.Infos.VBRTapeVault[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRTapeMedium -Drive <VBRTapeDrive[]> [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeMedium -Id <Guid[]> [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeMedium -Library <VBRTapeLibrary[]> [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeMedium -MediaPool <VBRTapeMediaPoolBase[]> [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeMedium [-Name <String[]>] -Vault <VBRTapeVault[]> [<CommonParameters>]
```
