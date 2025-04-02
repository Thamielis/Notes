Start-VBRvCloudRestoreVApp
--------------------------

### Synopsis
Starts a vApp restore.

---

### Description

This cmdlet starts a restore session for a selected vApp.
With this cmdlet, you can restore the vApp to the original location or to another location, or with different settings.
To restore the vApp to the original location you only need to indicate the desired restore point. Be careful to specify the restore point of the vApp, not an individual VM which is not a valid value for this cmdlet. Veeam Backup & Replication gets all the information needed for restore from the restore point data.

To run restore to another location or with different settings you need to first create a CVcdVAppRestoreSettings object which unifies all the settings options required for restore. The CVcdVAppRestoreSettings object is created with the help of the New-VBRvCloudVAppRestoreSettings cmdlet. See the New-VBRvCloudVAppRestoreSettings topic for detailed instructions for advanced setup options.

This cmdlet provides two scenarios for each case.

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint -Name "vApp_01"
Start-VBRvCloudRestoreVApp -RestorePoint $restorepoint
This example shows how to start a vApp restore. The vApp named vApp_01 is restored to the original location and with all settings unchanged.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCloudRestoreVApp cmdlet. Set the $restorepoint variable as the RestorePoint variable.
> Example 2

$backup = Get-VBRBackup -Name "vCloud"
$restoreparams = Get-VBRRestorePoint -Backup $backup | Where {$_.Name -eq "vApp_01"} | New-VBRvCloudVAppRestoreSettings
$restoreparams.OrgVdc = Find-VBRvCloudEntity -OrganizationVdc -Name "Org_02"
Start-VBRvCloudRestoreVApp -RestoreParams $restoreparams -RunAsync
This example shows how to restore a vApp to another location. The vApp named vApp_01 is restored to the Org_02 organization with all other settings remaining unchanged.

Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. To restore the vApp to another organization, you need to first customize the CVcdVAppRestoreSettings object:
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Pass the result to the Where-Object cmdlet to select the restore points with the Name property that equals vApp_01.
- Pipe the cmdlet output to the New-VBRvCloudVAppRestoreSettings cmdlet. Save the result to the $restoreparams variable.
3. Run the Find-VBRvCloudEntity cmdlet. Provide the OrganizationVdc parameter. Specify the Name parameter value for the target organization. Save the result to the OrgVdc property of the $restoreparams variable.
4. Run the Start-VBRvCloudRestoreVApp cmdlet. Set the $restoreparams variable as the RestoreParams parameter value. Provide the RunAsync parameter.

---

### Parameters
#### **PowerUp**
If set, the vApp will be powered up right after it is restored.
Otherwise you will need to power up the vApp manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore of the selected vApp.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestoreParams**
Specifies the CVcdVAppRestoreSettings object containing all settings required for the vApp restore.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[CVcdVAppRestoreSettings]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RestorePoint**
Specifies the restore point of the vApp.
Used to restore vApp with all the same settings unchanged.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.CVcdVAppRestoreSettings

Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRvCloudRestoreVApp [-RestoreParams] <CVcdVAppRestoreSettings> [-PowerUp] [-Reason <String>] [-RunAsync] [<CommonParameters>]
```
```PowerShell
Start-VBRvCloudRestoreVApp [-RestorePoint] <COib> [-PowerUp] [-Reason <String>] [-RunAsync] [<CommonParameters>]
```
