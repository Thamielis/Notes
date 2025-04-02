Get-NcAutoSupportConfig
-----------------------

### Synopsis
Get AutoSupport configuration settings.

---

### Description

Get AutoSupport configuration settings.

---

### Related Links
* [Set-NcAutoSupportConfig](Set-NcAutoSupportConfig)

---

### Examples
> Example 1

Get-NcAutoSupportConfig fas3070cluster01-01
Get the AutoSupport configuration for node fas3070cluster01-01.

From                              : Postmaster
IsEnabled                         : True
IsLocalCollectionEnabled          : True
IsNhtDataEnabled                  : True
IsNodeInSubject                   : False
IsPerfDataEnabled                 : True
IsPrivateDataRemoved              : False
IsReminderEnabled                 : True
IsSupportEnabled                  : True
IsThrottleEnabled                 : True
LastSubject                       : MANAGEMENT_LOG
LastTimestamp                     : 1332116303
LastTrigger                       :
MailHosts                         : {mailhost}
MaxHttpSize                       : 10485760
MaxSmtpSize                       : 5242880
NodeName                          : fas3070cluster01-01
Noteto                            :
PartnerAddress                    :
PayloadFormat                     : 7z
PeriodicTxWindow                  : 1h
PostUrl                           : testbed.corp.netapp.com/asupprod/post/1.0/postAsup
ProxyUrl                          :
PutUrl                            : testbed.corp.netapp.com/put/AsupPut
RetryCount                        : 15
RetryInterval                     : 4m
SupportAddress                    : {dl-qa-autosupport@netapp.com}
To                                :
Transport                         : https

> Example 2

$q = Get-NcAutoSupportConfig -Template
$q.IsEnabled = $true
Get-NcAutoSupportConfig -Query $q
Get all of the AutoSupport configurations for nodes that have AutoSupport enabled.

From                              : Postmaster
IsEnabled                         : True
IsLocalCollectionEnabled          : True
IsNhtDataEnabled                  : True
IsNodeInSubject                   : False
IsPerfDataEnabled                 : True
IsPrivateDataRemoved              : False
IsReminderEnabled                 : True
IsSupportEnabled                  : True
IsThrottleEnabled                 : True
LastSubject                       : MANAGEMENT_LOG
LastTimestamp                     : 1332116303
LastTrigger                       :
MailHosts                         : {mailhost}
MaxHttpSize                       : 10485760
MaxSmtpSize                       : 5242880
NodeName                          : fas3070cluster01-01
Noteto                            :
PartnerAddress                    :
PayloadFormat                     : 7z
PeriodicTxWindow                  : 1h
PostUrl                           : testbed.corp.netapp.com/asupprod/post/1.0/postAsup
ProxyUrl                          :
PutUrl                            : testbed.corp.netapp.com/put/AsupPut
RetryCount                        : 15
RetryInterval                     : 4m
SupportAddress                    : {dl-qa-autosupport@netapp.com}
To                                :
Transport                         : https

---

### Parameters
#### **Node**
The name of the controller that owns the AutoSupport configuration.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Attributes**
For improved scalability in large clusters, provide a AutosupportBudgetInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAutoSupportBudget -Template" to get the initially empty AutosupportBudgetInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[AutosupportConfigInfo]`|false   |named   |false        |

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
Specify to get an empty AutosupportBudgetInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AutosupportBudgetInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAutoSupportBudget -Template" to get the initially empty AutosupportBudgetInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[AutosupportConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Autosupport.AutosupportConfigInfo

---

### Notes
Category: autosupport
API: autosupport-config-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAutoSupportConfig [[-Node] <String[]>] [-Attributes <AutosupportConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportConfig -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportConfig -Query <AutosupportConfigInfo> [-Attributes <AutosupportConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
