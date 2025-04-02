Set-NcNfsService
----------------

### Synopsis
Modify an NFS configuration.

---

### Description

Modify an NFS configuration.

---

### Related Links
* [Get-NcNfsService](Get-NcNfsService)

* [Add-NcNfsService](Add-NcNfsService)

* [Remove-NcNfsService](Remove-NcNfsService)

---

### Examples
> Example 1

```PowerShell
$config = Get-NcNfsService -Template
$config.IsNfsv2Enabled = $false
$config.IsNfsv3Enabled = $false
Set-NcNfsService $config
Set the NFS service configuration, disabling Nfsv2 and Nfsv3.

ChownMode                                  : use_export_policy
DefaultWindowsUser                         :
EnableEjukebox                             : False
IsNfsAccessEnabled                         : True
IsNfsv2Enabled                             : False
IsNfsv3ConnectionDropEnabled               : True
IsNfsv3Enabled                             : False
IsNfsv3FsidChangeEnabled                   : True
IsNfsv4FsidChangeEnabled                   : True
IsNfsv4NumericIdsEnabled                   : True
IsNfsv40AclEnabled                         : False
IsNfsv40Enabled                            : False
IsNfsv40MigrationEnabled                   : False
IsNfsv40ReadDelegationEnabled              : False
IsNfsv40ReferralsEnabled                   : False
IsNfsv40ReqOpenConfirmEnabled              : False
IsNfsv40WriteDelegationEnabled             : False
IsNfsv41AclEnabled                         : False
IsNfsv41AclPreserveEnabled                 : True
IsNfsv41Enabled                            : False
IsNfsv41MigrationEnabled                   : False
IsNfsv41PnfsEnabled                        : True
IsNfsv41PnfsStripedVolumesEnabled          : False
IsNfsv41ReferralsEnabled                   : False
IsNfsv41StateProtectionEnabled             : True
Nfsv4GraceSeconds                          : 45
Nfsv4IdDomain                              : defaultv4iddomain.com
Nfsv4LeaseSeconds                          : 30
Nfsv41ImplementationIdDomain               : defaultv41impliddomain.com
Nfsv41ImplementationIdName                 : defaultv41implidname
Nfsv41ImplementationIdTime                 : 1327069779
NtfsUnixSecurityOps                        : use_export_policy
RpcsecCtxHigh                              : 0
RpcsecCtxIdle                              : 0
Vserver                                    : dlamotta01
IsNfsv42SeclabelEnabled                    : False
IsRdmaEnabled                              : True

```

---

### Parameters
#### **Attributes**
An NfsInfo object containing the configuration values to set on the NFS service.  Use Get-NcNfsService -Template to get an empty NfsInfo object and fill in the values to be set.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[NfsInfo]`|true    |1       |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **IsNfsv42SeclabelEnabled**
If 'true', then NFS version 4.2 Security label feature is enabled. Default value is 'false'.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **IsRdmaEnabled**
If 'true', then enable NFS access over RDMA. Default value is 'true'.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nfs.NfsInfo

---

### Notes
Category: nfs
API: nfs-service-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcNfsService [-Attributes] <NfsInfo> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [-IsNfsv42SeclabelEnabled <Boolean>] [-IsRdmaEnabled <Boolean>] [<CommonParameters>]
```
