Start-VBRCDPWindowsFileRestore
------------------------------

### Synopsis
Starts Microsoft Windows guest OS file restore session for a CDP replica.

---

### Description

This cmdlet starts a restore session of guest OS files for a CDP replica that has Microsoft Windows OS.
After you restore the necessary files, you must stop the restore session. After you stop the session, Veeam Backup & Replication will unmount disks from the mount server. Run Stop-VBRWindowsFileRestore to stop the restore session.

---

### Examples
> Example 1

$replica = Get-VBRCDPReplica -Name "WinSrv25"       
$restorepoint = Get-VBRCDPLongTermRestorePoint -Replica $replica -Last      
$session = Start-VBRCDPWindowsFileRestore -Replica $replica -LongTermRestorePoint $restorepoint
This example shows how to start a restore session for Windows guest OS files of the WinSrv25 CDP replica.
Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable
2. Run the Get-VBRCDPLongTermRestorePoint cmdlet. Specify the Replica and Last parameter values. Save the result to the $restorepoint variable. 3. Run the Start-VBRCDPWindowsF cmdlet. Set the $restorepoint as the LongTermRestorePoint parameter value and the $replica as the Replica parameter value. Save the result to the $session variable.

---

### Parameters
#### **Credentials**
Specifies the credentials to authenticate with the backup share folder.
Accepts the CCredentials object. To create this object, run the  Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **LongTermRestorePoint**
Specifies a long-term restore point of a CDP replica. The cmdlet will start the restore session for this restore point.
Accepts the VBRCDPLongTermRestorePoint object. To get this object, run the Get-VBRCDPLongTermRestorePoint cmdlet.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRCDPLongTermRestorePoint]`|true    |named   |False        |

#### **Reason**
Specifies the reason for starting a restore session.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Replica**
Specifies the CDP replica for which you want to restore files.
Accepts the VBRCDPReplica object. To create this object, run the Get-VBRCDPReplica cmdlet.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ToPointInTime**
Specifies date and time when a restore point was created. The cmdlet will start the restore session for the short-term restore point created at the specified date and time or will take the nearest restore point.
If you do not specify this parameter and the LongTermRestorePoint parameter, the cmdlet will start the restore session for the latest short-term restore point.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRCDPWindowsFileRestore [-Credentials <CCredentials>] -LongTermRestorePoint <VBRCDPLongTermRestorePoint> [-Reason <String>] -Replica <VBRCDPReplica> [<CommonParameters>]
```
```PowerShell
Start-VBRCDPWindowsFileRestore [-Credentials <CCredentials>] [-Reason <String>] -Replica <VBRCDPReplica> [-ToPointInTime <DateTime>] [<CommonParameters>]
```
