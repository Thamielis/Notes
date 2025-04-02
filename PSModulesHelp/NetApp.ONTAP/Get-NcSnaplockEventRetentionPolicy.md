Get-NcSnaplockEventRetentionPolicy
----------------------------------

### Synopsis
Get SnapLock Event Based Retention policies.

---

### Description

Get SnapLock Event Based Retention policies.

---

### Parameters
#### **Vserver**
Name of the Vserver.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Name**
Name of the SnapLock Event Based Retention policy.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[SnaplockEventRetentionPolicyInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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

#### **Template**
Specify to get an empty SnaplockEventRetentionPolicyInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SnaplockEventRetentionPolicyInfo  object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnaplockEventRetentionPolicy -Template" to get the initially empty SnaplockEventRetentionPolicyInfo  object.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[SnaplockEventRetentionPolicyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snaplock.SnaplockEventRetentionPolicyInfo

---

### Notes
Category: snaplock
API: snaplock-event-retention-policy-get-iter
Family: ontap-vserver

---

### Syntax
```PowerShell
Get-NcSnaplockEventRetentionPolicy [[-Vserver] <String[]>] [[-Name] <String[]>] [-Attributes <SnaplockEventRetentionPolicyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnaplockEventRetentionPolicy -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnaplockEventRetentionPolicy -Query <SnaplockEventRetentionPolicyInfo> [-Attributes <SnaplockEventRetentionPolicyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
