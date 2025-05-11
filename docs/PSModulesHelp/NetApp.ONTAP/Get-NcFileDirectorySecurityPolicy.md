Get-NcFileDirectorySecurityPolicy
---------------------------------

### Synopsis
Get information about one or more security policies.

---

### Description

Get information about one or more security policies. To preserve the security configuration of a file(or, folder) or set of files(or, folders) security policy has been defined. Policy is a container for tasks and a task associates a file/folder path name and the security descriptor that needs to be set on the file/folder. Every task in a policy is uniquely identified by the file/folder path. Policy can't have duplicate task entries and there is only one task per path.

---

### Related Links
* [New-NcFileDirectorySecurityPolicy](New-NcFileDirectorySecurityPolicy)

* [Remove-NcFileDirectorySecurityPolicy](Remove-NcFileDirectorySecurityPolicy)

---

### Examples
> Example 1

Get-NcFileDirectorySecurityPolicy -Name policy_1
Get the security policy.

PolicyName                              Vserver
----------                              -------
policy_1                                beam01

---

### Parameters
#### **Name**
Get one or more policy names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PolicyName|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FileDirectorySecurityPolicy object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFileDirectorySecurityPolicy -Template" to get the initially empty FileDirectorySecurityPolicy object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[FileDirectorySecurityPolicy]`|false   |named   |false        |

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
Specify to get an empty FileDirectorySecurityPolicy object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FileDirectorySecurityPolicy object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFileDirectorySecurityPolicy -Template" to get the initially empty FileDirectorySecurityPolicy object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[FileDirectorySecurityPolicy]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileDirectorySecurity.FileDirectorySecurityPolicy

---

### Notes
Category: file directory security
API: file-directory-security-policy-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcFileDirectorySecurityPolicy [[-Name] <String[]>] [-Vserver <String[]>] [-Attributes <FileDirectorySecurityPolicy>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurityPolicy -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurityPolicy -Query <FileDirectorySecurityPolicy> [-Attributes <FileDirectorySecurityPolicy>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
