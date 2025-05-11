Get-NcIscsiInitiatorAuth
------------------------

### Synopsis
Get a list of iSCSI initiator authentication configuration objects.

---

### Description

Get a list of iSCSI initiator authentication configuration objects.

---

### Related Links
* [Set-NcIscsiInitiatorAuth](Set-NcIscsiInitiatorAuth)

* [Set-NcIscsiInitiatorAuthChap](Set-NcIscsiInitiatorAuthChap)

* [Remove-NcIscsiInitiatorAuth](Remove-NcIscsiInitiatorAuth)

---

### Examples
> Example 1

Get-NcIscsiInitiatorAuth default
Get all of the default initiator authentication objects on the current cluster.

Initiator                                                    AuthType   Username             OutboundUserName
---------                                                    --------   --------             ----------------
default                                                      none
default                                                      none
default                                                      none
default                                                      none
default                                                      deny
default                                                      none

> Example 2

$q = Get-NcIscsiInitiatorAuth -Template
$q.OutboundUserName = "user"
Get-NcIscsiInitiatorAuth -Query $q
Get all iscsi initiator authentication objects with an outbound username defined as "user".

Initiator                                                    AuthType   Username             OutboundUserName
---------                                                    --------   --------             ----------------
iqn.1991-05.com.microsoft:win2k8devrre0.rtprre.testdomain    chap       user                 user

---

### Parameters
#### **Initiator**
The name of the initiator.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **AuthType**
The authentication type.  Possible values: CHAP, none, deny.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an IscsiSecurityEntryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcIscsiInitiatorAuth -Template" to get the initially empty IscsiSecurityEntryInfo object.  If not specified, all data is returned for each object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[IscsiSecurityEntryInfo]`|false   |named   |false        |

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
Specify to get an empty IscsiSecurityEntryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an IscsiSecurityEntryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcIscsiInitiatorAuth -Template" to get the initially empty IscsiSecurityEntryInfo object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[IscsiSecurityEntryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiSecurityEntryInfo

---

### Notes
Category: iscsi
API: iscsi-initiator-auth-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcIscsiInitiatorAuth [[-Initiator] <String[]>] [[-AuthType] <String[]>] [-Attributes <IscsiSecurityEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiInitiatorAuth -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiInitiatorAuth -Query <IscsiSecurityEntryInfo> [-Attributes <IscsiSecurityEntryInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
