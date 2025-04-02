Rescan-VBREntity
----------------

### Synopsis
Rescans backup infrastructure components.

---

### Description

This cmdlet rescans backup infrastructure components added to Veeam Backup & Replication:    - Hosts and clusters    - Tape servers    - Tape libraries    - Backup repositories    - Cloud providers    - Veeam backup database for new replica restore points    - Protection groups    NOTE: You cannot rescan a protection group for pre-installed Veeam Agents. To learn more, see the Protection Group Types section in the Veeam Agent Management Guide.    - Discovered computers    NOTE: You cannot rescan a computer added to a protection group for pre-installed Veeam Agents. To learn more, see the Protection Group Types section in the Veeam Agent Management Guide.    - Discovered Active Directory objects You can rescan components, for example, after configuration restore.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRTapeServer](Get-VBRTapeServer)

* [Get-VBRReplica](Get-VBRReplica)

---

### Examples
> Example 1. Rescanning all Hosts Managed by Veeam Backup & Replication

Rescan-VBREntity -AllHosts
This command rescans servers managed by Veeam Backup & Replication.
> Example 2. Rescanning Backup Repository

$repository = Get-VBRBackupRepository -Name "Win2012Repo"
Rescan-VBREntity -Entity $repository
This example shows how to rescan the Win2012Repo backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Rescan-VBREntity cmdlet. Set the $repository variable as the Entity parameter value.
> Example 3. Rescanning Tape Server

$tapesrv = Get-VBRTapeServer -Name "srv01.tech.local"
Rescan-VBREntity -Entity $tapesrv -Wait
This example shows how to rescan the srv01.tech.local tape server.
Perform the following steps:
1. Run the Get-VBRTapeServer cmdlet. Specify the Name parameter value. Save the result to the $tapesrv variable.
2. Run the Rescan-VBREntity cmdlet. Set the $tapesrv variable as the Entity parameter value. Provide the Wait parameter.
> Example 4. Rescanning Replica Restore Points

$webservices = Get-VBRReplica -Name "Webservices"
Rescan-VBREntity -Entity $webservices
This example shows how to rescan the 'Webservices' replica restore points.
Perform the following steps:
1. Run the Get-VBRReplica cmdlet. Specify the Name parameter value. Save the result to the $webservices variable.
2. Run the Rescan-VBREntity cmdlet. Set the $webservices variable as the Entity parameter value.

---

### Parameters
#### **AllCloudProviders**
Defines that the cmdlet will rescan all cloud providers.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AllHosts**
Defines that the cmdlet will rescan all managed hosts.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AllReplicas**
Defines that the cmdlet will rescan all replicas restore points.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AllRepositories**
Defines that the cmdlet will rescan all backup repositories.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AllTapeServers**
Defines that the cmdlet will rescan all tape servers.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies an array of components you want to rescan.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[Object[]]`|true    |named   |True (ByValue)|

#### **Wait**
Defines that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
System.Object[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Rescan-VBREntity [-AllCloudProviders] [-AllHosts] [-AllReplicas] [-AllRepositories] [-AllTapeServers] [-Wait] [<CommonParameters>]
```
```PowerShell
Rescan-VBREntity -Entity <Object[]> [-Wait] [<CommonParameters>]
```
