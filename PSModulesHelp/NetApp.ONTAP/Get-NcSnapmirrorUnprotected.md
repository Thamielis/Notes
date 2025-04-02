Get-NcSnapmirrorUnprotected
---------------------------

### Synopsis
The snapmirror-list-unprotected API returns a list of unprotected volumes for the specified source Vserver.

---

### Description

The snapmirror-list-unprotected API returns a list of unprotected volumes for the specified source Vserver.

---

### Parameters
#### **DesiredAttributes**
Specify the attributes that should be returned. If not present, all attributes for which information is available will be returned. If present, only the desired attributes for which information is available will be returned.

|Type                         |Required|Position|PipelineInput        |
|-----------------------------|--------|--------|---------------------|
|`[SnapmirrorListUnprotected]`|false   |named   |true (ByPropertyName)|

#### **SourceVserver**
Specifies the source Vserver for which to list unprotected volumes.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorListUnprotected

---

### Notes
Category: snapmirror
API: snapmirror-list-unprotected
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSnapmirrorUnprotected [-DesiredAttributes <SnapmirrorListUnprotected>] [-SourceVserver] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
