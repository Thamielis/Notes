Set-NcNdmpVserverAttr
---------------------

### Synopsis
Modify NDMP attributes for vserver.

---

### Description

Modify NDMP attributes for vserver.

---

### Related Links
* [Get-NcNdmpVserverAttr](Get-NcNdmpVserverAttr)

---

### Examples
> Example 1

Set-NcNdmpVserverAttr -SecondaryDebugFilter none -VserverContext primary1
Change selected attributes of primary1 vserver

AbortOnDiskError                          : False
Authtype                                  : {challenge}
BackupLogEnable                           : True
DataPortRange                             : all
DebugEnable                               : False
DebugFilter                               : none
DumpDetailedStats                         : False
DumpLogicalFind                           : default
Enable                                    : True
FhDirRetryInterval                        : 250
FhNodeRetryInterval                       : 250
IgnoreCtimeEnabled                        : False
IsSecureControlConnectionEnabled          : False
Maxversion                                : 4
OffsetMapEnable                           : True
PerQtreeExcludeEnable                     : False
PreferredInterfaceRole                    : {intercluster, data}
RestoreVmCacheSize                        : 64
SecondaryDebugFilter                      : none
Tcpnodelay                                : False
Tcpwinsize                                : 32768
VserverName                               : primary1
NcController                              : 10.63.1.234
AbortOnDiskErrorSpecified                 : True
BackupLogEnableSpecified                  : True
DebugEnableSpecified                      : True
DumpDetailedStatsSpecified                : True
EnableSpecified                           : True
FhDirRetryIntervalSpecified               : True
FhNodeRetryIntervalSpecified              : True
IgnoreCtimeEnabledSpecified               : True
IsSecureControlConnectionEnabledSpecified : True
MaxversionSpecified                       : True
OffsetMapEnableSpecified                  : True
PerQtreeExcludeEnableSpecified            : True
RestoreVmCacheSizeSpecified               : True
TcpnodelaySpecified                       : True
TcpwinsizeSpecified                       : True

---

### Parameters
#### **AbortOnDiskError**
Specify true to enable abortion of operation in case of disk error and false to disable this. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **BackupLogEnabled**
Specify true to enable backup log and false to disable it. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **DataPortRange**
Range of data ports. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsDebugEnabled**
Specifies whether debug is enabled or disabled. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **DebugFilter**
Debug Filter. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DumpDetailedStatsEnabled**
Specifies whether logging of VM Stats for dumping is enabled or not. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **DumpLogicalFind**
Enable Logical Find for Dump. Valid values are 'default', 'always', 'qtree_baseline', 'qtree_incr', 'vol_baseline' and 'vol_incr'. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Enable**
Specify true to enable backup log and false to disable it

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Disable**
Specify to disable NDMP on Vserver *

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **FhDirRetryInterval**
FH Throttle Value for Dir *. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **FhNodeRetryInterval**
FH Throttle Value for Node *. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **IgnoreCtimeEnabled**
Specifies whether ignore Ctime is enabled (specify true) or not (specify false). This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsSecureControlConnectionEnabled**
Specifies whether Secure Control Connection is enabled (specify true) or not (specify false). This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **OffsetMapEnabled**
Specifies whether Offset Map is enabled (specify true) or not (specify false). This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **PerQtreeExcludeEnabled**
Specifies whether  per Qtree Exclusion is enabled (specify true) or not (specify false). This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **RestoreVmCacheSize**
Restore VM File Cache Size *. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **SecondaryDebugFilter**
Secondary Debug Filter. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TcpNoDelayEnabled**
Specifies whether TCP Nodelay is enabled (specify true) or not (specify false). This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Tcpwinsize**
TCP Window Size *. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Authtype**
NDMP authentication types. Possible values are [ plaintext, challenge, plaintext_sso ]. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ndmp.NdmpVserverAttributesInfo

---

### Notes
Category: ndmp
API: ndmp-vserver-attributes-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcNdmpVserverAttr [-AbortOnDiskError <Boolean>] [-BackupLogEnabled <Boolean>] [-DataPortRange <String>] [-IsDebugEnabled <Boolean>] [-DebugFilter <String>] [-DumpDetailedStatsEnabled 
```
```PowerShell
<Boolean>] [-DumpLogicalFind <String>] [-Enable] [-Disable] [-FhDirRetryInterval <Int64>] [-FhNodeRetryInterval <Int64>] [-IgnoreCtimeEnabled <Boolean>] [-IsSecureControlConnectionEnabled 
```
```PowerShell
<Boolean>] [-OffsetMapEnabled <Boolean>] [-PerQtreeExcludeEnabled <Boolean>] [-RestoreVmCacheSize <Int64>] [-SecondaryDebugFilter <String>] [-TcpNoDelayEnabled <Boolean>] [-Tcpwinsize 
```
```PowerShell
<Int64>] [-VserverContext <String>] [-Authtype <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
