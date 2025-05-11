Start-VBRCDPLinuxFileRestore
----------------------------

### Synopsis
Starts a restore session of Linux-based or Unix-based guest OS files from a CDP replica.

---

### Description

This cmdlet starts a restore session of guest OS files for a CDP replica that has Linux-based or Unix-based OS.
Consider the following:
- If you plan to restore OS files using an existing Linux-based machine as a helper host, you must first add this machine to the backup infrastructure. Run the Add-VBRLinux cmdlet to add the necessary machine.
- After you restore the necessary files, you must stop the restore session. Run run the Stop-VBRLinuxFileRestore cmdlet to stop the session.
After you stop the session, Veeam Backup & Replication unmounts disks from the helper host or helper appliance. If you use the helper appliance, Veeam Backup & Replication unregisters the helper appliance from the ESXi host.
- This method supports recovery of files and folders only. Recovery of other file system objects such as pipes is not supported.

---

### Examples
> Example 1

$replica = Get-VBRCDPReplica -Name "UbuntuSrv"
$restorepoint = Get-VBRCDPLongTermRestorePoint -Replica $replica -Last
$server = Get-VBRServer -Name "LinSrv05"
$creds = Get-VBRCredentials -Name *Administrator*
$session = Start-VBRCDPLinuxFileRestore -Replica $replica -LongTermRestorePoint $restorepoint -MountServer $server -Credentials $creds
This example shows how to start a restore of Linux or Unix-based guest OS files of the UbuntuSrv replica. The cmdlet will use the LinSrv05 machine as a helper appliance.
Perform the following steps:
1. Get the restore point:
a. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
b. Run the Get-VBRCDPLongTermRestorePoint cmdlet. Specify the Replica parameter value. Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
4. Run the Start-VBRCDPLinuxFileRestore cmdlet:
a. Set the $replica variable as the Replica parameter value.
b. Set the $restorepoint variable as the LongTermRestorePoint parameter value.
c. Set the $server variable as the MountServer parameter value.
d. Set the $creds variable as the Credentials parameter value.
e. Save the result to the $session variable.

---

### Parameters
#### **ApplianceOptions**
Specifies configuration options for a temporary helper appliance
Note: This parameter is required if you do not specify the MountServer and MountToOriginalHost parameters.
Accepts the VBRFileRestoreLinuxHelperApplianceOptions object. To create this object, run the New-VBRFileRestoreLinuxHelperApplianceOptions cmdlet.

|Type                                         |Required|Position|PipelineInput        |
|---------------------------------------------|--------|--------|---------------------|
|`[VBRFileRestoreLinuxHelperApplianceOptions]`|true    |named   |True (ByPropertyName)|

#### **Credentials**
Specifies the credentials to authenticate with the backup share folder.
Accepts the CCredentials object. To create this object, run the  Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **LongTermRestorePoint**
Specifies a long-term restore point of a CDP replica. The cmdlet will start the restore session for this restore point.
Accepts the VBRCDPLongTermRestorePoint object. To get this object, run the Get-VBRCDPLongTermRestorePoint cmdlet.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRCDPLongTermRestorePoint]`|false   |named   |False        |

#### **MountServer**
Specifies an existing Linux-based machine. The cmdlet will mount disks from a backup or replica to this machine and will use it as a helper host.
Note: This parameter is required if you do not specify the ApplianceOptions and MountToOriginalHost parameters.
Accepts the CHost object. To create this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[CHost]`|true    |named   |True (ByPropertyName)|

#### **MountToOriginalHost**
Specifies whether to mount disks to the original server and use it as a helper host.
Note: Set this parameter to $true if the Server, MountServer and ApplianceOptions parameters are not specified.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |True (ByPropertyName)|

#### **Reason**
Specifies the reason for starting a restore session.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

#### **Replica**
Specifies the CDP replica for which you want to restore files.
Accepts the VBRCDPReplica object. To create this object, run the Get-VBRCDPReplica cmdlet.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ToPointInTime**
Specifies date and time when a restore point was created. The cmdlet will start the restore session for the short-term restore point created at the specified date and time or will take the nearest restore point.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCDPReplica

System.String

Veeam.Backup.Core.Common.CHost

Veeam.Backup.PowerShell.Infos.VBRFileRestoreLinuxHelperApplianceOptions

Veeam.Backup.Common.CCredentials

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRCDPLinuxFileRestore -ApplianceOptions <VBRFileRestoreLinuxHelperApplianceOptions> [-Credentials <CCredentials>] [-LongTermRestorePoint <VBRCDPLongTermRestorePoint>] [-Reason <String>] -Replica 
```
```PowerShell
<VBRCDPReplica> [-ToPointInTime <DateTime>] [<CommonParameters>]
```
```PowerShell
Start-VBRCDPLinuxFileRestore [-Credentials <CCredentials>] [-LongTermRestorePoint <VBRCDPLongTermRestorePoint>] -MountServer <CHost> [-Reason <String>] -Replica <VBRCDPReplica> [-ToPointInTime <DateTime>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Start-VBRCDPLinuxFileRestore [-Credentials <CCredentials>] [-LongTermRestorePoint <VBRCDPLongTermRestorePoint>] -MountToOriginalHost [-Reason <String>] -Replica <VBRCDPReplica> [-ToPointInTime <DateTime>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Start-VBRCDPLinuxFileRestore [-Credentials <CCredentials>] -LongTermRestorePoint <VBRCDPLongTermRestorePoint> [-Reason <String>] -Replica <VBRCDPReplica> [<CommonParameters>]
```
```PowerShell
Start-VBRCDPLinuxFileRestore [-Credentials <CCredentials>] [-Reason <String>] -Replica <VBRCDPReplica> [-ToPointInTime <DateTime>] [<CommonParameters>]
```
