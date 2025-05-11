New-VBRvCloudVAppRestoreSettings
--------------------------------

### Synopsis
Creates a set of vApp restore parameters.

---

### Description

This cmdlet is an assistant command creating a CVcdVAppRestoreSettings object that is further used in the Start-VBRvCloudRestoreVApp cmdlet. This object gathers the parameters of a selected vApp that will be needed for restore.		 The vApp that you want to restore and its parameters are derived from the specified restore point data. Use the OrgVdc parameter to set another organization where you want to restore the vApp to.		 You can customize any of the parameters that are derived from the restore point. For more information, see the Advanced Setup section.

Advanced Setup
The restore parameters include the settings of the vApp, namely restore point, vApp name, organization VDC, and VMs included, as well as the settings of the VM: restore point, storage profile, datastore and template. Each of these settings can be reset to user settings allowing to restore the vApp i.e. to another organization, or with another vApp name, or apply other storage profiles to the VMs.		 When applying different restore settings, it is recommended to set "null" to all VM settings that you leave unchanged to avoid conflicts when restoring the vApp to another infrastructure. For example, if the target organization has no access to the datastore that is originally set for the vApp, PowerShell will terminate your vApp restore job.		 If you set null to all VM settings, Veeam Backup & Replication will apply the default settings of the target organization.		 Make sure that you set the parameters for all VMs that belong to the vApp, otherwise you will not be able to run the restore job.

---

### Examples
> Example 1

$restoreparams = New-VBRvCloudVAppRestoreSettings -RestorePoint $restorepoint -vAppName "vApp01" -OrgVdc $Org
$restoreparams = New-VBRvCloudVAppRestoreSettings -RestorePoint $restorepoint -OrgVdc $Org
$restoreparams.vms[0].vCloudDatastore=$null
$restoreparams.vms[0].StorageProfile=$null
$restoreparams.vms[0].VmTemplate=$null
This command creates settings for the future restore of the vApp in another organization VDC. 		 - The $restorepoint variable contains the restore point of the vApp. The restore point is obtained with Get-VBRRestorePoint and assigned to the variable beforehand.

- The $vdc variable contains the organization VDC object where the vApp will be restored. The VDC object is obtained with Find-VBRvCloudEntity ([-OrganizationVdc]) and assigned to the variable beforehand.

- The PowerUp parameter is set to True to start the vApp automatically right after the restore.

Here you get the $restorepoint variable containing the vApp settings:		 - vAppOib - the restore point of the vApp,

- OrgVdc - the organization vDataCenter where the vApp is registered,

- Vms - the list of VMs whithin the vApp,

- vAppName - the name of the vApp.

You can view the properties of the VMs within the vApp by typing $restoreparams.vms:		 - VmOib - the VM restorepoint,
- StorageProfile - the VM storage profile,

- vCloudDatastore - the datastore that the VM uses,
- VmTemplate - the VM template.
You need to specify the new organization to where you want to restore the vApp. The new organization object is assigned to the $org variable. All other VM parameters are set to null.

The $restoreparams variable now contains the data needed for the restore and can be used in the Start-VBRvCloudRestoreVApp cmdlet.

---

### Parameters
#### **OrgVdc**
Specifies the organization VDC you want to restore the vApp to.
If not set, the vApp will be restored to the original organization VDC.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IVcdItem]`|false   |named   |False        |

#### **PowerUp**
If set to True, the vApp will be powered up right after it is restored. Otherwise, you will need to power up the vApp manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore of the selected vApp.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the vApp you want to restore the vApp to.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **vAppName**
Specifies the name of the restored vApp.
Use this parameter in case you want to restore the vApp with different name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRvCloudVAppRestoreSettings [-RestorePoint] <COib> [-OrgVdc <IVcdItem>] [-PowerUp] [-Reason <String>] [-vAppName <String>] [<CommonParameters>]
```
