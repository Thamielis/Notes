Set-NcSnaplockPrivDelOption
---------------------------

### Synopsis
Used to set the snaplock privileged-delete option on a Snaplock Enterprise volume.

---

### Description

Used to set the snaplock privileged-delete option on a Snaplock Enterprise volume. 

The privileged-delete option can be set to one of : 'off', 'on', 'disallowed'.   If the privileged delete state is set to 'on' on a Snaplock Enterprise volume, the user is allowed to perform privileged  delete operation on that volume. If the privileged delete state is set to 'off' on a Snaplock Enterprise volume, the user is not allowed to perform privileged delete operation on that volume. If the privileged delete state is set to 'disallowed' on a Snaplock Enterprise volume, the user is not allowed to perform privileged delete operation or further change the privileged delete state on that volume.

---

### Related Links
* [Remove-NcSnaplockFile](Remove-NcSnaplockFile)

---

### Examples
> Example 1

Set-NcSnaplockPrivDelOption -Volume locked -Enable -VserverContext primary1
Change priviledged delete configuration

Are you sure you wish to change the priviledged delete configuration on locked.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

NcController : 10.63.1.234
ErrorCode    : 
ErrorMessage : 
JobId        : 2396
JobVserver   : 
Status       : in_progress

---

### Parameters
#### **Volume**
Name of the Snaplock Enterprise volume, on which modification will be made

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Disable**
Specify to disable privileged delete on this volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Enable**
Specify to enable priviledged delete on this volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Disallow**
Specify to disable privileged delete on this volume and disallow any further changes to this configuration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: snaplock
API: snaplock-volume-set-privileged-delete
Family: vserver

---

### Syntax
```PowerShell
Set-NcSnaplockPrivDelOption [-Volume] <String> -Disable [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcSnaplockPrivDelOption [-Volume] <String> -Enable [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcSnaplockPrivDelOption [-Volume] <String> -Disallow [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
