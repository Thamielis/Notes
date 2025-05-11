Get-NcFileDirectorySecurityNtfs
-------------------------------

### Synopsis
Get information about one or more NTFS security descriptor.

---

### Description

Get information about one or more NTFS security descriptor.

---

### Related Links
* [Remove-NcFileDirectorySecurityNtfs](Remove-NcFileDirectorySecurityNtfs)

* [New-NcFileDirectorySecurityNtfs](New-NcFileDirectorySecurityNtfs)

* [Set-NcFileDirectorySecurityNtfs](Set-NcFileDirectorySecurityNtfs)

* [Add-NcFileDirectorySecurityNtfsSacl](Add-NcFileDirectorySecurityNtfsSacl)

* [Add-NcFileDirectorySecurityNtfsDacl](Add-NcFileDirectorySecurityNtfsDacl)

---

### Examples
> Example 1

```PowerShell
Get-NcFileDirectorySecurityNtfs
Get all of the NTFS security descriptors for the current Vserver.

ControlFlagsRaw          :
Group                    :
NcController             : 10.63.165.62
NtfsSd                   : ntfssd
Owner                    : BEAM02\Administrator
Vserver                  : beam01
ControlFlagsRawSpecified : False

ControlFlagsRaw          :
Group                    :
NcController             : 10.63.165.62
NtfsSd                   : ntfssd1
Owner                    : BEAM02\Administrator
Vserver                  : beam01
ControlFlagsRawSpecified : False

```

---

### Parameters
#### **SecurityDescriptor**
Name of one or more NTFS security descriptors.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NtfsSd<br/>Name|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FileDirectorySecurityNtfs object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFileDirectorySecurityNtfs -Template" to get the initially empty FileDirectorySecurityNtfs object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[FileDirectorySecurityNtfs]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty FileDirectorySecurityNtfs object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FileDirectorySecurityNtfs object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFileDirectorySecurityNtfs -Template" to get the initially empty FileDirectorySecurityNtfs object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[FileDirectorySecurityNtfs]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileDirectorySecurity.FileDirectorySecurityNtfs

---

### Notes
Category: file directory security
API: file-directory-security-ntfs-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcFileDirectorySecurityNtfs [[-SecurityDescriptor] <String[]>] [-Vserver <String[]>] [-Attributes <FileDirectorySecurityNtfs>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurityNtfs -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurityNtfs -Query <FileDirectorySecurityNtfs> [-Attributes <FileDirectorySecurityNtfs>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
