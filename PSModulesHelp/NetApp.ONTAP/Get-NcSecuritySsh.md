Get-NcSecuritySsh
-----------------

### Synopsis
Get SSH configuration options.

---

### Description

Get SSH configuration options.

---

### Related Links
* [Set-NcSecuritySsh](Set-NcSecuritySsh)

---

### Examples
> Example 1

Get-NcSecuritySsh
Get the SSH security configuration for all the Vservers in the current cluster.

Ciphers                       KeyExchangeAlgorithms         NcController                  VserverName
-------                       ---------------------         ------------                  -----------
{aes256_ctr, aes192_ctr, a... {diffie_hellman_group_exch... 10.63.58.22                   beam_vsim01
{aes256_ctr, aes192_ctr, a... {diffie_hellman_group_exch... 10.63.58.22                   vsim_cluster1

> Example 2

$q = Get-NcSecuritySsh -Template
$q.Ciphers = @("aes192_ctr")
Get-NcSecuritySsh -Query $q
Get the SSH security settings that contain the given cipher for all the Vservers in the current cluster.

Ciphers                       KeyExchangeAlgorithms         NcController                  VserverName
-------                       ---------------------         ------------                  -----------
{aes256_ctr, aes192_ctr, a... {diffie_hellman_group_exch... 10.63.58.22                   beam_vsim01
{aes256_ctr, aes192_ctr, a... {diffie_hellman_group_exch... 10.63.58.22                   vsim_cluster1

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SecuritySshInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecuritySsh -Template" to get the initially empty SecuritySshInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[SecuritySshInfo]`|false   |named   |false        |

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
Specify to get an empty SecuritySshInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SecuritySshInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecuritySsh -Template" to get the initially empty SecuritySshInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[SecuritySshInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecuritySshInfo

---

### Notes
Category: security
API: security-ssh-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSecuritySsh [[-Vserver] <String[]>] [-Attributes <SecuritySshInfo>] [-VserverContext <String>] [-IsAdministrativeSvm <SwitchParameter>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySsh -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySsh -Query <SecuritySshInfo> [-Attributes <SecuritySshInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
