Update-NcOption
---------------

### Synopsis
Modify the attributes of options or a group of options objects.

---

### Description

Modify the attributes of options or a group of options objects.

---

### Related Links
* [Get-NcOption](Get-NcOption)

* [Set-NcOption](Set-NcOption)

---

### Examples
> Example 1

$a = Get-NcOption -Template
$a.Value = "on"
$q = Get-NcOption -Template
$q.Name = "backup.log.enable"
$q.Vserver = "Cerebus-*"
Update-NcOption -Query $q -Attributes $a
Set option 'backup.log.enable' to 'on' on all vservers matching "Cerebus-*".

NcController : cerebus
SuccessCount : 4
FailureCount : 0
SuccessList  : {backup.log.enable, backup.log.enable, backup.log.enable, backup.log.enable}
FailureList  : {}

---

### Parameters
#### **Query**
An OptionInfo object with various fields set to indicate which options to modify.  Other fields should remain set to null.  Use "Get-NcOption -Template" to get the initially empty OptionInfo object.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[OptionInfo]`|true    |named   |true (ByValue)|

#### **Attributes**
An OptionInfo object with various fields set to the values that will be set on all objects that are identified by the Query parameter.  Other fields should remain set to null.  Use "Get-NcOption -Template" to get the initially empty OptionInfo object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[OptionInfo]`|true    |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple objects match a given query.  If set to true, the API will continue modifying the next matching object even when modification of a previous object fails.  If set to false, the API will return on the first failure.  Default: false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures, then this input element may be provided to limit the number of failed modify operations before the server gives up and returns.  If set, the cmdlet will continue modifying the next matching object even when the modification of a previous matching object fails, and do so until the total number of objects failed to be modified reaches the maximum specified.  If set to the maximum or not provided, then there will be no limit on the number of failed modify operations.  Only applicable if ContinueOnFailure is specified.  Default: 2^32-1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: options
API: options-modify-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Update-NcOption -Query <OptionInfo> -Attributes <OptionInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
