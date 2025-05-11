Set-NcFpolicyEvent
------------------

### Synopsis
Set FPolicy event options.

---

### Description

Set FPolicy event options. FPolicy event is consist of protocol, file operation, volume operation and filters.

---

### Related Links
* [Get-NcFpolicyEvent](Get-NcFpolicyEvent)

* [New-NcFpolicyEvent](New-NcFpolicyEvent)

* [Remove-NcFpolicyEvent](Remove-NcFpolicyEvent)

---

### Examples
> Example 1

Set-NcFpolicyEvent -Name cifs_event -Protocol cifs -FileOperation 'create', 'read', 'write' -VolumeOperation $true
Set the cifs_event FPolicy policy event.

EventName                : cifs_event
FileOperations           : {create, read, write}
FilterString             :
NcController             : 10.63.165.62
Protocol                 : cifs
VolumeOperation          : True
Vserver                  : beam01
VolumeOperationSpecified : True

---

### Parameters
#### **Name**
Name of the Event.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |1       |true (ByPropertyName)|EventName|

#### **Protocol**
Name of protocol for which event is created. 
Possible values: 
"cifs"      - CIFS protocol
"nfsv3"     - NFSv3 protocol
"nfsv4"     - NFSv4 protocol

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FileOperation**
Name of file operations.
Possible values: 
"close"          - File close operation
"create"         - File create operation
"create_dir"     - File create directory operation
"delete"         - File delete operation
"delete_dir"     - Directory delete operation
"getattr"        - Get attribute operation
"link"           - Link operation
"lookup"         - Lookup operation
"open"           - File open operation
"read"           - File read operation
"write"          - File write operation
"rename"         - File rename operation
"rename_dir"     - Directory rename operation
"setattr"        - Set attribute operation
"symlink"        - Symbolic link operation

|Type        |Required|Position|PipelineInput        |Aliases       |
|------------|--------|--------|---------------------|--------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|FileOperations|

#### **Filter**
Name of filters. It is notification filtering parameters.
Possible values: 
"monitor_ads"                   - Monitor alternate data stream
"close_with_modification"       - Filter close with modification
"close_without_modification"    - Filter close without modification
"first_read"                    - Filter first read
"first_write"                   - Filter first write
"offline_bit"                   - Filter offline bit set
"open_with_delete_intent"       - Filter open with delete intent
"open_with_write_intent"        - Filter open with write intent
"write_with_size_change"        - Filter write with size change

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|FilterString|

#### **VolumeOperation**
If true, the volume operation required for the event.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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
* DataONTAP.C.Types.Fpolicy.FpolicyEventOptionsConfig

---

### Notes
Category: fpolicy
API: fpolicy-policy-event-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcFpolicyEvent [-Name] <String> [-Protocol <String>] [-FileOperation <String[]>] [-Filter <String[]>] [-VolumeOperation <Boolean>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
