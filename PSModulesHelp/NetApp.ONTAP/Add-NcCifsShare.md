Add-NcCifsShare
---------------

### Synopsis
Creates a new CIFS share rooted at the specified path.

---

### Description

Creates a new CIFS share rooted at the specified path.

---

### Related Links
* [Set-NcCifsShare](Set-NcCifsShare)

* [Remove-NcCifsShare](Remove-NcCifsShare)

* [Get-NcCifsShare](Get-NcCifsShare)

---

### Examples
> Example 1

Add-NcCifsShare -Name cifsvol1 -Path /cifsvol1
Add a CIFS share called cifsvol1 which shares path /cifsvol1.

CifsServer                ShareName       Path                                Comment
----------                ---------       ----                                -------
CIFS01                    cifsvol1        /cifsvol1

---

### Parameters
#### **Name**
The name of the CIFS share. The CIFS share name is a UTF-8 string with the following characters being illegal: control characters from 0x00 to 0x1F, both inclusive, 0x22 (double quotes) and the characters \/[]:|<>+=;,?

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Path**
The file system path that is shared through this CIFS share.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ShareProperties**
The list of properties for this CIFS share. Possible values:
"oplocks"        - This specifies that opportunistic locks (client-side caching) are enabled on this share.
"browsable"      - This specifies that the share can be browsed by Windows clients.
"showsnapshot"   - This specifies that Snapshots can be viewed and traversed by clients.
"changenotify"   - This specifies that CIFS clients can request for change notifications for directories on this share.
"homedirectory"  - This specifies that the share is added and enabled as part of the CIFS home directory feature. The configuration of this share should be done using CIFS home directory feature interface.
"attributecache" - This specifies that connections through this share are caching attributes for a short time to improve performance.
 This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **SymlinkProperties**
This flag controls whether the symlinks under this shared directory are hidden (option 'hide'), accessible (option 'enable') or are accessible as read-only (option 'read-only' along with option 'enable'). Possible values: "enable", "hide", "read_only"

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FileUmask**
The value of this field controls the file mode creation mask for the CIFS share in qtrees with UNIX or Mixed security styles. The mask restricts the initial permissions setting of a newly created file. The input value is a numeric mode comprising of one to three octal digits (0-7), derived by adding up the bits with values 4, 2, and 1. The first digit selects permissions for the user who owns the file: read (4), write (2), and execute (1); the second selects permissions for other users in the file's group, with the same values; and the third for other users not in the file's group, with the same values.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **DirUmask**
The value of this field controls the file mode creation mask for the CIFS share in qtrees with UNIX or Mixed security styles. The mask restricts the initial permissions setting of a newly created directory. The input value is a numeric mode comprising of one to three octal digits (0-7), derived by adding up the bits with values 4, 2, and 1. The first digit selects permissions for the user who owns the file: read (4), write (2), and execute (1); the second selects permissions for other users in the file's group, with the same values; and the third for other users not in the file's group, with the same values.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Comment**
This string gives a description of the CIFS share. CIFS clients see this description when browsing the Vserver's CIFS shares.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OfflineFilesMode**
Mode of the offline file for the CIFS share. The default value is manual.  
Possible values:
"none"      - Clients are not permitted to cache files for offline access.
"manual"    - Clients may cache files that are explicitly selected by the user for offline use.
"documents" - Clients may automatically cache files that are used by the user for offline access.
"programs"  - Clients may automatically cache files that are used by the user for offline access and may use those files in an offline mode even if the share is available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AttributeCacheTtl**
The lifetime of an entry in the file attribute cache, in seconds. This value is used if the share has the 'attributecache' property set, which improves the performance of certain metadata operations in common workloads. The default is 10 seconds. Raising this value may improve performance, but the likelihood that stale metadata will be served increases as well. The value of this field must be in the range of 1 to 86400. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **VscanProfile**
Profile-set of file-ops to which Vscan On-Access scanning is applicable. The default value is standard.
Possible values:
    'no_scan'     - Virus scans are never triggered for accesses to this share,
    'standard'    - Virus scans can be triggered by open, close, and rename operations,
    'strict'      - Virus scans can be triggered by open, read, close, and rename operations
    'writes_only' - Virus scans can be triggered only when a file that has been modified is closed.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|false   |named   |true (ByPropertyName)|VscanFileopProfile|

#### **MaxConnectionsPerShare**
The maximum number of simultaneous connections to the share. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **ForceGroupForCreate**
Specifies the group that all files that CIFS users create in the share must belong to (also called the "force-group"). The "force-group" must be a predefined group in the UNIX group database. This setting has no effect unless the security style of the volume is UNIX or mixed security style. You can disable this option by passing a null string "".

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DisablePathValidation**
If specified, the CIFS Share Path validation will be disabled.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **OfflineFiles**
Offline Files. The default value is none.
					
The supported values are::
'none'     - Clients are not permitted to cache files for offline access,
'manual'   - Clients may cache files that are explicitly selected by the user for offline access,
'documents'      - Clients may automatically cache files that are used by the user for offline access,
'programs' - Clients may automatically cache files that are used by the user for offline access.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HomeDirectory**
Specifies whether or not the share is a home directory share, where the share and path names are dynamic. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Oplocks**
Specify whether opportunistic locks are enabled on this share. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **AccessBasedEnumeration**
If enabled, all folders inside this share are visible to a user based on that individual user access right; prevents the display of folders or other shared resources that the user does not have access to. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ChangeNotify**
Specifies whether CIFS clients can request for change notifications for directories on this share. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Encryption**
Specifies that SMB encryption must be used when accessing this share. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ShowSnapshot**
Specifies whether or not the Snapshot copies can be viewed and traversed by clients. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ContinuouslyAvailable**
Specifies whether or not the clients connecting to this share can open files in a persistent manner. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **NamespaceCaching**
Specifies whether or not the SMB clients connecting to this share can cache the directory enumeration results returned by the CIFS servers. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **NoStrictSecurity**
Specifies whether or not CIFS clients can follow a unix symlinks outside the share boundaries. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **UnixSymlink**
Controls the access of UNIX symbolic links to CIFS clients. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

#### **Browsable**
Specifies whether or not the Windows clients can browse the share. This parameter is supported with Rest only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |named   |false        |

#### **ShowPreviousVersion**
Specifies that the previous version can be viewed and restored from the client. This parameter is supported with Rest only.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsShare

---

### Notes
Category: cifs
API: cifs-share-create
Family: vserver

---

### Syntax
```PowerShell
Add-NcCifsShare [-Name] <String> [-Path] <String> [-ShareProperties <String[]>] [-SymlinkProperties <String[]>] [-FileUmask <Int32>] [-DirUmask <Int32>] [-Comment <String>] [-OfflineFilesMode 
```
```PowerShell
<String>] [-AttributeCacheTtl <Int32>] [-VscanProfile <String>] [-MaxConnectionsPerShare <Int64>] [-ForceGroupForCreate <String>] [-DisablePathValidation] [-VserverContext <String>] 
```
```PowerShell
[-OfflineFiles <String>] [-HomeDirectory <Boolean>] [-Oplocks <Boolean>] [-AccessBasedEnumeration <Boolean>] [-ChangeNotify <Boolean>] [-Encryption <Boolean>] [-ShowSnapshot <Boolean>] 
```
```PowerShell
[-ContinuouslyAvailable <Boolean>] [-NamespaceCaching <Boolean>] [-NoStrictSecurity <Boolean>] [-UnixSymlink <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-ShowPreviousVersion <bool?>] [-Browsable <bool?>] [<CommonParameters>]
```
