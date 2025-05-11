Import-NcPerfPreset
-------------------

### Synopsis
Import Performance Preset configuration from source URI

---

### Description

Import Performance Preset configuration from source URI

---

### Related Links
* [New-NcPerfPreset](New-NcPerfPreset)

* [Rename-NcPerfPreset](Rename-NcPerfPreset)

* [Remove-NcPerfPreset](Remove-NcPerfPreset)

---

### Parameters
#### **SourceUri**
URI pointing to a preset file to be imported.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Uri    |

#### **UserName**
The user name required to authenticate at the Uri.

|Type      |Required|Position|PipelineInput|Aliases                          |
|----------|--------|--------|-------------|---------------------------------|
|`[String]`|false   |named   |false        |SourceUriUserName<br/>UriUserName|

#### **Password**
The password required to authenticate at the Uri.

|Type      |Required|Position|PipelineInput|Aliases                          |
|----------|--------|--------|-------------|---------------------------------|
|`[String]`|false   |named   |false        |SourceUriPassword<br/>UriPassword|

#### **Name**
Name of the performance preset.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Preset |

#### **Comment**
Preset description.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Privilege**
Privilege level.  Possible values: admin, advanced, diagnostic.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Archived**
Specify if preset is archive-enabled?

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExpirationLengthMinutes**
Default expiration time in minutes until the performance preset will be automatically disabled.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **Credential**
Credentials (user name & password) required to authenticate at the Uri.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: perf
API: perf-preset-import
Family: cluster

---

### Syntax
```PowerShell
Import-NcPerfPreset [-SourceUri] <String> [-UserName <String>] [-Password <String>] [-Name] <String> [-Comment <String>] [-Privilege <String>] [-Archived] [-ExpirationLengthMinutes <Int32>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Import-NcPerfPreset [-SourceUri] <String> [-Credential <PSCredential>] [-Name] <String> [-Comment <String>] [-Privilege <String>] [-Archived] [-ExpirationLengthMinutes <Int32>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
