Get-VBRUnstructuredBackupFLRItem
--------------------------------

### Synopsis
Returns backed-up objects created by file backup jobs or object storage backup jobs.

---

### Description

This cmdlet returns an array of backed-up objects created by file backup jobs or object storage backup jobs. These objects contain settings of guest OS files and folders backed up by file backup jobs or object storage backup jobs.

---

### Related Links
* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

* [Start-VBRUnstructuredBackupFLRSession](Start-VBRUnstructuredBackupFLRSession)

---

### Examples
> Example 1. Getting Objects Within Restore Session

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint[3]     
Get-VBRUnstructuredBackupFLRItem -Session $session
This example shows how to get objects within the specified restore session.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
The Get-VBRUnstructuredBackupRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point, for arrays it starts with 0. In our example, it is the fourth restore point in the array.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint as the RestorePoint parameter value. Save the result to the $session variable.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Set the $session as the Session parameter value.
> Example 2. Getting Objects by Name

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint[4]     
Get-VBRUnstructuredBackupFLRItem -Session $session -Name "Report001.txt"
This example shows how to get the Report001.txt file within the specified restore session.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable. The Get-VBRUnstructuredBackupRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fifth restore point in the array). Note that to count objects of the array you must start with 0.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint as the RestorePoint parameter value. Save the result to the $session variable.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Specify the Name parameter value. Set the $session as the Session parameter value.
> Example 3. Getting Objects from Specific Folder

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint[2]     
$folder =Get-VBRUnstructuredBackupFLRItem -Session $session -Name "October Reports"     
Get-VBRUnstructuredBackupFLRItem -Session $session -Folder $folder
This example shows how to get all objects that are located in the the October Reports folder.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable. The Get-VBRUnstructuredBackupRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the third restore point in the array). Note that to count objects of the array you must start with 0.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint as the RestorePoint parameter value. Save the result to the $session variable.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Set the $session as the Session parameter value. Specify the Name parameter value.
4. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Set the $folder as the Folder parameter value. Set the $session as the Session parameter value.
> Example 4. Getting All Objects Added to Backed-up Folders

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint[5]         
Get-VBRUnstructuredBackupFLRItem -Session $session -Recurse
This example shows how to get all objects that are added to the backed-up folders.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable. The Get-VBRUnstructuredBackupRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the sixth restore point in the array). Note that to count objects of the array you must start with 0.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint as the RestorePoint parameter value. Save the result to the $session variable.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Set the $session as the Session parameter value. Specify the Recurse parameter.

---

### Parameters
#### **ChangedOnly**
Defines that the cmdlet will return backed-up objects with changed attributes only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Folder**
Specifies a backed-up folder. The cmdlet will return the specified folder and an array of objects that are added to this folder. Accepts the VBRUnstructuredBackupFLRFolder object.  To get this object, run the Get-VBRUnstructuredBackupFLRItem cmdlet.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupFLRFolder]`|false   |named   |False        |

#### **Name**
Specifies a name of the backed-up object. The cmdlet will return folders and files with the specified name.
NOTE: By default, the cmdlet returns up to 10,000 records (folders and files). You can change the default value with a registry key. For more information, contact Veeam Customer Support.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Recurse**
Defines that the cmdlet will look for objects that are added to backed-up child folders.
If you provide this parameter, the cmdlet will return an array of all objects that are added to backed-up child folders. Otherwise, the cmdlet will return an array of objects that are added to the parent folder on the backed-up file share or an object storage server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies a restore session. The cmdlet will return backed-up object within this restore session.
Accepts the VBRUnstructuredBackupFLRSession object.  To create this object, run the Start-VBRUnstructuredBackupFLRSession cmdlet.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupFLRSession]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupFLRSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRUnstructuredBackupFLRItem [-ChangedOnly] [-Folder <VBRUnstructuredBackupFLRFolder>] [-Name <String>] [-Recurse] -Session <VBRUnstructuredBackupFLRSession> [<CommonParameters>]
```
