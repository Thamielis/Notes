Set-NcCifsOption
----------------

### Synopsis
Modify the CIFS specific tunables that can be set on a Vserver.

---

### Description

Modify the CIFS specific tunables that can be set on a Vserver.

---

### Related Links
* [Get-NcCifsOption](Get-NcCifsOption)

---

### Examples
> Example 1

Set-NcCifsOption -DisableSmb2
Disable SMB2 on the CIFS server of the current vserver.

DefaultUnixUser             IsSmb2Enabled    ReadGrantsExecute WinsServers
---------------             -------------    ----------------- -----------
                                    False             disabled

---

### Parameters
#### **DefaultUnixUser**
This is the default UNIX user mapping that will be used if the identity of a CIFS user connot be mapped using normal name mapping rules.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ReadGrantsExecute**
On a file with UNIX Style security effective on it, if the file has read permission on it, a CIFS user would be allowed to execute permissions if this option is enabled.  Possible values: \"enabled\", \"disabled\".

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **WinsServers**
List of Windows Internet Name Service (WINS) IP addresses. The Vserver will send NetBIOS name resolution requests to these addresses.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **EnableSmb2**
Specify to enable Smb2 on this CIFS sserver.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|IsSmb2Enabled|

#### **DisableSmb2**
Specify to disable Smb2 on this CIFS sserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxMpx**
This option controls maximum simultaneous operations the CIFS server reports it can process per TCP connection. The default value for this option is 255.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **ShadowcopyDirDepth**
The maximum depth of directories to shadow copy.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **IsSmb3Enabled**
If true, the CIFS server negotiates the SMB3 version of the CIFS protocol.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsCopyOffloadEnabled**
If true, the CIFS server is capable of performing copy offload operation.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **DefaultUnixGroup**
The default UNIX group used if the identity of a CIFS group cannot be mapped using normal group mapping rules.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsShadowCopyEnabled**
If true, the CIFS server is capable of performing shadow copy operations.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsReferralEnabled**
If true, the CIFS server refers clients to more optimal data access paths (LIFs).

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsLocalAuthEnabled**
If true, CIFS local users can authenticate.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsLocalUsersAndGroupsEnabled**
If true, the CIFS local users and groups feature is enabled on the cluster.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsUseJunctionsAsReparsePointsEnabled**
If true, the CIFS server exposes junction points as reparse points to Windows clients.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsExportPolicyEnabled**
If true, the CIFS server uses export policies to control client access.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsTrustedDomainEnumSearchEnabled**
If true, the CIFS server is capable of performing enumeration of trusted domains and search to map a UNIX user to a Windows user.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **FileSystemSectorSize**
Specifies the size of file system sector in bytes reported to SMB Clients.
Possible values: 
'512'  - Reported file system sector size to SMB clients is 512 bytes,
'4096' - Reported file system sector size to SMB clients is 4096 bytes
Valid Values:

* 512
* 4096

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **IsCopyOffloadDirectCopyEnabled**
If true, the direct-copy copy offload mechanism is enabled.  The default value is true.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsUnixNtAclEnabled**
If true, NT ACLs can be set on a volume with UNIX security-style.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ClientSessionTimeout**
The amount of idle time (in seconds) before a CIFS session is disconnected.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **IsDacEnabled**
If true, the CIFS server supports Dynamic Access Control. The default value for this parameter is false.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **AnonymousRestrictionLevel**
The level of access a non authenticated user get 
        
Possible values: 
'no_restriction' - No access restriction for anonymous user
'no_enumeration' - Only enumeration is restricted
'no_access'      - Access restricted for anonymous user.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |named   |true (ByPropertyName)|RestrictAnonymous|

#### **IsReadOnlyDeleteEnabled**
If true, a file can be deleted using UNIX delete semantics when the DOS read-only bit is enabled.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsFakeOpenEnabled**
If true, the CIFS server supports fake open requests. The default value for this parameter is true.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsUnixExtensionsEnabled**
If true, the CIFS server is capable of supporting UNIX Extensions. The default value for this parameter is false.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsSearchShortNamesEnabled**
If true, the CIFS server supports searching short names. The default value for this parameter is false.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsAdvertiseDfsEnabled**
If true, DFS referral of the CIFS protocol is advertised.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsAdvancedSparseFileSupportEnabled**
Specifies whether advanced sparse file capabilities, such as Query Allocated Ranges and Set Zero Data, are enabled on the CIFS server.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MaxFileWriteZeroLength**
Maximum length of data that the CIFS server can write zero with one CIFS request. Value must be between 4K and 1G

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **GuestUnixUser**
The specific unix user to which a guest user coming from any untrusted domain can be mapped.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Smb1MaxBufferSize**
Maximum buffer size used for SMB1 message that the server can receive

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxSameUserSessionsPerConnection**
Maximum simultaneous sessions by the same user per TCP connection

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxSameTreeConnectPerSession**
Maximum simultaneous CIFS connections to the same share per CIFS session.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxOpensSameFilePerTree**
Maximum existing opens on the same file per CIFS Tree.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxWatchesSetPerTree**
Maximum watches that can be set per CIFS Tree.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **IsAdminUsersMappedToRootEnabled**
Specifies that if name-mapping is not present for members of BUILTIN\Administrators group then whether they can be mapped to Unix User 'root'.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **GrantUnixGroupPermsToOthers**
Specifies whether UNIX group permissions should be granted to others when Windows clients access files on a UNIX security-style Volume/Qtree as well as mixed security style Volume/Qtree, as long as the effective security style on the file is UNIX.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsClientDupDetectionEnabled**
Specifies whether the CIFS server should detect duplicate sessions coming from the same SMB 1.0 client with VcNumber of zero (0).

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsClientVersionReportingEnabled**
Specifies whether to report the client version through ASUP.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsHideDotfilesEnabled**
Specifies whether the CIFS server should hide files and directories beginning with a dot '.' during directory enumeration.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsLargeMtuEnabled**
Specifies that the SMB 2.1 Large MTU feature is supported.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsMultichannelEnabled**
Specifies whether the CIFS server supports Multichannel or not.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsPathComponentCacheEnabled**
Specifies whether the CIFS path component cache is enabled for SMB2 or not.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsPathComponentCacheSymlinkEnabled**
Specifies whether the CIFS symlink resolution for path component cache is enabled for SMB2 or not.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsSmb31Enabled**
Specifies whether the CIFS server negotiates the SMB3.1 version of the CIFS protocol.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MaxConnectionsPerSession**
Maximum number of connections allowed per Multichannel session.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxLifsPerSession**
Maximum number of network interfaces advertised per Multichannel session.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **NbnsEnabledLifs**
Specifies the list of LIFs on which NBNS broadcast can be sent.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **PathComponentCacheEntryExpTime**
This parameter controls the time in milliseconds when the path component cache entry would be considered fresh.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PathComponentCacheMaxEntries**
This parameter control the maximum number of cache entries in one instance of path component cache.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PathComponentCacheMaxSessionTokenSize**
This parameter specifies maximum session token size for path component cache for SMB2.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PathComponentCacheSymlinkExpTime**
This parameter controls the time in milliseconds when the path component cache entry that is symlink would be considered fresh.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **WinNameForNullUser**
This parameter specifies a valid Windows user or group name that will be added to the CIFS credentials for a NULL user Session.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsNetbiosOverTcpEnabled**
This optional parameter specifies whether the use of NetBIOS over Tcp is enabled or not.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsNbnsEnabled**
This optional parameter specifies that NBNS (port 137) is enabled or not. The default value for this parameter is false.
This parameter is available in ONTAP 9.1 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **WidelinkAsReparsePointVersions**
This optional parameter specifies for which CIFS protocol versions widelink will be reported as reparse points. The default value for this parameter is SMB1. Possible values 'smb1'- SMB 1.0, 'smb2'- SMB 2.0, 'smb2_1' - SMB 2.1, 'smb3'- SMB 3.0, 'smb3_1'- SMB 3.1
This parameter is available in ONTAP 9.2 and later.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|CifsDialects|

#### **IsSmb1Enabled**
This optional parameter specifies whether the CIFS server negotiates the SMB1 versions of the CIFS protocol. The default value for this parameter is true.
This parameter is available in ONTAP 9.2 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsFsctlFileLevelTrimEnabled**
This optional parameter specifies whether trim requests (FSCTL_FILE_LEVEL_TRIM) are supported on the cifs server. The default value for this parameter is true.
This parameter is available in ONTAP 9.3 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MaxCredits**
This optional parameter controls the maximum number of outstanding requests on a CIFS connection. The default value is 128.
This parameter is available in ONTAP 9.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **IsShareEnumPermissionCheckEnabled**
This option is used to control whether the NetShareEnum call should only respond with the shares the user has access to or with all shares. The default value is false which means it will respond with all shares.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsOptions

---

### Notes
Category: cifs
API: cifs-options-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcCifsOption [-DefaultUnixUser <String>] [-ReadGrantsExecute <String>] [-WinsServers <String[]>] [-EnableSmb2] [-DisableSmb2] [-MaxMpx <Int32>] [-ShadowcopyDirDepth <Int64>] 
```
```PowerShell
[-IsSmb3Enabled <Boolean>] [-IsCopyOffloadEnabled <Boolean>] [-DefaultUnixGroup <String>] [-IsShadowCopyEnabled <Boolean>] [-IsReferralEnabled <Boolean>] [-IsLocalAuthEnabled <Boolean>] 
```
```PowerShell
[-IsLocalUsersAndGroupsEnabled <Boolean>] [-IsUseJunctionsAsReparsePointsEnabled <Boolean>] [-IsExportPolicyEnabled <Boolean>] [-IsTrustedDomainEnumSearchEnabled <Boolean>] 
```
```PowerShell
[-FileSystemSectorSize <Int32>] [-IsCopyOffloadDirectCopyEnabled <Boolean>] [-IsUnixNtAclEnabled <Boolean>] [-ClientSessionTimeout <Int32>] [-IsDacEnabled <Boolean>] 
```
```PowerShell
[-AnonymousRestrictionLevel <String>] [-IsReadOnlyDeleteEnabled <Boolean>] [-IsFakeOpenEnabled <Boolean>] [-IsUnixExtensionsEnabled <Boolean>] [-IsSearchShortNamesEnabled <Boolean>] 
```
```PowerShell
[-IsAdvertiseDfsEnabled <Boolean>] [-IsAdvancedSparseFileSupportEnabled <Boolean>] [-MaxFileWriteZeroLength <String>] [-GuestUnixUser <String>] [-Smb1MaxBufferSize <Int32>] 
```
```PowerShell
[-MaxSameUserSessionsPerConnection <Int32>] [-MaxSameTreeConnectPerSession <Int32>] [-MaxOpensSameFilePerTree <Int32>] [-MaxWatchesSetPerTree <Int32>] [-IsAdminUsersMappedToRootEnabled 
```
```PowerShell
<Boolean>] [-GrantUnixGroupPermsToOthers <Boolean>] [-IsClientDupDetectionEnabled <Boolean>] [-IsClientVersionReportingEnabled <Boolean>] [-IsHideDotfilesEnabled <Boolean>] 
```
```PowerShell
[-IsLargeMtuEnabled <Boolean>] [-IsMultichannelEnabled <Boolean>] [-IsPathComponentCacheEnabled <Boolean>] [-IsPathComponentCacheSymlinkEnabled <Boolean>] [-IsSmb31Enabled <Boolean>] 
```
```PowerShell
[-MaxConnectionsPerSession <Int32>] [-MaxLifsPerSession <Int32>] [-NbnsEnabledLifs <String[]>] [-PathComponentCacheEntryExpTime <Int32>] [-PathComponentCacheMaxEntries <Int32>] 
```
```PowerShell
[-PathComponentCacheMaxSessionTokenSize <Int32>] [-PathComponentCacheSymlinkExpTime <Int32>] [-WinNameForNullUser <String>] [-IsNetbiosOverTcpEnabled <Boolean>] [-IsNbnsEnabled <Boolean>] 
```
```PowerShell
[-WidelinkAsReparsePointVersions <String[]>] [-IsSmb1Enabled <Boolean>] [-IsFsctlFileLevelTrimEnabled <Boolean>] [-MaxCredits <Int32>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [-IsShareEnumPermissionCheckEnabled <Boolean>] 
```
```PowerShell
[<CommonParameters>]
```
