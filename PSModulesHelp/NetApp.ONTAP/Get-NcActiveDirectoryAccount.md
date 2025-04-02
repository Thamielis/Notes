Get-NcActiveDirectoryAccount
----------------------------

### Synopsis
Retrieve the list of active directory accounts.

---

### Description

Retrieve the list of active directory accounts.

---

### Related Links
* [New-NcActiveDirectoryAccount](New-NcActiveDirectoryAccount)

* [Set-NcActiveDirectoryAccount](Set-NcActiveDirectoryAccount)

* [Remove-NcActiveDirectoryAccount](Remove-NcActiveDirectoryAccount)

---

### Examples
> Example 1

Get-NcActiveDirectoryAccount
Get all of the active directory accounts for the current cluster.

AccountName               Domain                              DomainWorkgroup           Vserver
-----------               ------                              ---------------           -------
TEST01                    RTPRRE.TESTDOMAIN                   RTPRRE                    beam_vsim01

> Example 2

$q = Get-NcActiveDirectoryAccount -Template
$q.Domain = "RTPRRE.TESTDOMAIN"
Get-NcActiveDirectoryAccount -Query $q
Get all of the Active Directory accounts in the cluster for the given domain.

AccountName               Domain                              DomainWorkgroup           Vserver
-----------               ------                              ---------------           -------
TEST01                    RTPRRE.TESTDOMAIN                   RTPRRE                    beam_vsim01

---

### Parameters
#### **Name**
One or more Active Directory account names to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|AccountName|

#### **Vserver**
Restrict the results to one or more vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ActiveDirectoryAccountConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcActiveDirectoryAccount -Template" to get the initially empty ActiveDirectoryAccountConfig object.  If not specified, all data is returned for each object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ActiveDirectoryAccountConfig]`|false   |named   |false        |

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
Specify to get an empty ActiveDirectoryAccountConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ActiveDirectoryAccountConfig object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcActiveDirectoryAccount -Template" to get the initially empty ActiveDirectoryAccountConfig object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ActiveDirectoryAccountConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ActiveDirectory.ActiveDirectoryAccountConfig

---

### Notes
Category: active directory
API: active-directory-account-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcActiveDirectoryAccount [[-Name] <String[]>] [[-Vserver] <String[]>] [-Attributes <ActiveDirectoryAccountConfig>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcActiveDirectoryAccount -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcActiveDirectoryAccount -Query <ActiveDirectoryAccountConfig> [-Attributes <ActiveDirectoryAccountConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
