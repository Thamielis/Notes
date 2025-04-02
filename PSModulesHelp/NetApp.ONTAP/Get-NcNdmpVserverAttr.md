Get-NcNdmpVserverAttr
---------------------

### Synopsis
Get NDMP attributes for vserver.

---

### Description

Get NDMP attributes for vserver.

---

### Related Links
* [Set-NcNdmpVserverAttr](Set-NcNdmpVserverAttr)

* [Enable-NcNdmpVserver](Enable-NcNdmpVserver)

* [Get-NcNdmpVserverSession](Get-NcNdmpVserverSession)

---

### Examples
> Example 1

Get-NcNdmpVserverAttr -VserverName primary1
Get NDMP related attributes from primary1 vserver

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
#### **VserverName**
Specify to filter by Vservers

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Vserver<br/>Vservers|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[NdmpVserverAttributesInfo]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[NdmpVserverAttributesInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ndmp.NdmpVserverAttributesInfo

---

### Notes
Category: ndmp
API: ndmp-vserver-attributes-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNdmpVserverAttr [[-VserverName] <String[]>] [-Attributes <NdmpVserverAttributesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNdmpVserverAttr -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNdmpVserverAttr -Query <NdmpVserverAttributesInfo> [-Attributes <NdmpVserverAttributesInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
