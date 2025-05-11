Add-NcQuota
-----------

### Synopsis
Add a quota entry.

---

### Description

Add a quota entry.

---

### Related Links
* [Get-NcQuota](Get-NcQuota)

* [Remove-NcQuota](Remove-NcQuota)

---

### Examples
> Example 1

```PowerShell
Add-NcQuota -Path /vol/beamvol2/qtree1 -DiskLimit 2gb
Add a quota with a disk limit.

NcController                : 10.60.189.172
Vserver                     : dlamotta01
DiskLimit                   : 2097152
FileLimit                   : -
PerformUserMapping          :
Policy                      : default
Qtree                       :
QuotaError                  :
QuotaTarget                 : /vol/beamvol2/qtree1
QuotaType                   : tree
SoftDiskLimit               : -
SoftFileLimit               : -
Threshold                   : -
Volume                      : beamvol2
PerformUserMappingSpecified : False

```

---

### Parameters
#### **User**
User name to target.

|Type        |Required|Position|PipelineInput|Aliases |
|------------|--------|--------|-------------|--------|
|`[String[]]`|true    |named   |false        |UserName|

#### **Volume**
Name of the volume for the quota.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Qtree**
Name of the qtree for the quota.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DiskLimit**
The amount of disk space in bytes reserved for the target.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FileLimit**
The number of files the target may have.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Threshold**
The amount of disk space in bytes the target must exceed before a message is logged.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SoftDiskLimit**
The amount of disk space in bytes the target must exceed before a message is logged and SNMP trap sent.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SoftFileLimit**
The number of files the target must exceed before a message is logged and SNMP trap sent.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PerformUserMapping**
If specified, quota management will perform user mapping for the user specified in quota target. Only valid for user quotas when the quota target refers to a Windows/UNIX user name. Not valid for multiple user targets. Default is false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Policy**
Name of the quota policy in which the quota rule should be added.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Group**
Group Id to target.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |GroupId|

#### **Path**
Path of the qtree to target.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Target**
The quota target of the type specified.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|true    |named   |true (ByPropertyName)|QuotaTarget|

#### **Type**
The quota type (user, group, tree).

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |1       |true (ByPropertyName)|QuotaType|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Quota.QuotaEntry

---

### Notes
Category: quota
API: quota-add-entry
Family: vserver

---

### Syntax
```PowerShell
Add-NcQuota -User <String[]> -Volume <String> [-Qtree <String>] [-DiskLimit <String>] [-FileLimit <String>] [-Threshold <String>] [-SoftDiskLimit <String>] [-SoftFileLimit <String>] 
```
```PowerShell
[-PerformUserMapping] [-Policy <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcQuota -Group <String> -Volume <String> [-Qtree <String>] [-DiskLimit <String>] [-FileLimit <String>] [-Threshold <String>] [-SoftDiskLimit <String>] [-SoftFileLimit <String>] [-Policy 
```
```PowerShell
<String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcQuota -Path <String> [-DiskLimit <String>] [-FileLimit <String>] [-Threshold <String>] [-SoftDiskLimit <String>] [-SoftFileLimit <String>] [-Policy <String>] [-VserverContext <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcQuota -Volume <String> [-Qtree <String>] -Target <String[]> [-Type] <String> [-DiskLimit <String>] [-FileLimit <String>] [-Threshold <String>] [-SoftDiskLimit <String>] [-SoftFileLimit 
```
```PowerShell
<String>] [-PerformUserMapping] [-Policy <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
