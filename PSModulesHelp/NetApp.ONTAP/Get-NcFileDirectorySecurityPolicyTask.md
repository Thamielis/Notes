Get-NcFileDirectorySecurityPolicyTask
-------------------------------------

### Synopsis
Get information about one or more policy tasks.

---

### Description

Get information about one or more policy tasks. Policy is a container for tasks and a task associates a file/folder path name and the security descriptor that needs to be set on the file/folder. Every task in a policy is uniquely identified by the file/folder path. Policy can't have duplicate task entries and there is only one task per path.

---

### Related Links
* [Add-NcFileDirectorySecurityPolicyTask](Add-NcFileDirectorySecurityPolicyTask)

* [Remove-NcFileDirectorySecurityPolicyTask](Remove-NcFileDirectorySecurityPolicyTask)

* [Set-NcFileDirectorySecurityPolicyTask](Set-NcFileDirectorySecurityPolicyTask)

---

### Examples
> Example 1

```PowerShell
Get-NcFileDirectorySecurityPolicyTask -Name policy_1
Get the security policy tasks for security policy policy_1.

NtfsMode                 : propagate
NtfsSd                   : ntfssd
Path                     : /powershell/cifs
PolicyName               : policy_1
SecurityType             : ntfs
TaskIndexNumber          : 1
Vserver                  : beam01
TaskIndexNumberSpecified : True

```

---

### Parameters
#### **Name**
Get one or more policy names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PolicyName|

#### **Path**
One or more file or folder paths of a task.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.")]

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FileDirectorySecurityPolicyTask object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFileDirectorySecurityPolicyTask -Template" to get the initially empty FileDirectorySecurityPolicyTask object.  If not specified, all data is returned for each object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

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
Specify to get an empty FileDirectorySecurityPolicyTask object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FileDirectorySecurityPolicyTask object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFileDirectorySecurityPolicyTask -Template" to get the initially empty FileDirectorySecurityPolicyTask object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileDirectorySecurity.FileDirectorySecurityPolicyTask

---

### Notes
Category: file directory security
API: file-directory-security-policy-task-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcFileDirectorySecurityPolicyTask [[-Name] <String[]>] [[-Path] <String[]>] [-Vserver <String[]>] [-Attributes <Object>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurityPolicyTask -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileDirectorySecurityPolicyTask [-Query] <Object> [-Attributes <Object>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
