Stop-VBRCloudTapeRestore
------------------------

### Synopsis
This cmdlet stops the restore session of the tenant data from tape.

---

### Description

This cmdlet stops the restore session of the tenant data from tape.

Run the Start-VBRCloudTapeRestore cmdlet to start the restore session.

---

### Related Links
* [Get-VBRCloudTapeBackupTenantRepository](Get-VBRCloudTapeBackupTenantRepository)

* [Start-VBRCloudTapeRestore](Start-VBRCloudTapeRestore)

* [Get-VBRCloudTapeRestoreSession](Get-VBRCloudTapeRestoreSession)

---

### Examples
> Example - Starting and Stopping Restore Session for Tenant Backups

$repository = Get-VBRCloudTapeBackupTenantRepository
Start-VBRCloudTapeRestore -BackupObject $repository -PointInTime "11/26/23" -RunAsync
CreationTime : 11/26/2023 5:47:38 PM
EndTime      : 1/1/1900 12:00:00 AM
JobId        : 3d6c6bc4-fca3-4815-854a-3e5095a2f452
Result       : None
State        : Starting
Id           : aae753f4-bcbf-427b-9cb8-bc9ee92acb6b
$session = Get-VBRCloudTapeRestoreSession -Id aae753f4-bcbf-427b-9cb8-bc9ee92acb6b
Stop-VBRCloudTapeRestore -Session $session
This example shows how to start a restore session of the tenant backups and then to stop the running session of backups restore from the tape.

Perform the following steps:
1. Run the Get-VBRCloudTapeBackupTenantRepository cmdlet. Save the result to the $repository variable.
2. Run the Start-VBRCloudTapeRestore cmdlet. Set the $repository variable as the BackupObject parameter value. Specify the PointInTime parameter value. Provide the RunAsync parameter.
3. Run the Get-VBRCloudTapeRestoreSession cmdlet. Specify the Id parameter value. Save the result to the $session variable.
4. Run the Set-VBRNDMPServer cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **Session**
Specifies the tape restore session that you want to stop. Accepts the VBRBackupSession type. To get this object, run the Get-VBRCloudTapeRestoreSession cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRBackupSession]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRCloudTapeRestore -Session <VBRBackupSession> [<CommonParameters>]
```
