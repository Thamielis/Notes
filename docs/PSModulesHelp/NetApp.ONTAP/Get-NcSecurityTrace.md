Get-NcSecurityTrace
-------------------

### Synopsis
Get permission tracing results for the cluster.

---

### Description

Get permission tracing results for the cluster.

---

### Related Links
* [Remove-NcSecurityTrace](Remove-NcSecurityTrace)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityTrace
Get all of the security trace results.

ClientIp        : 10.61.169.73
Index           : 1
Keytime         : 1372359223
KeytimeDT       : 6/27/2013 2:53:43 PM
NcController    : 10.63.165.62
Node            : sfp-cmode-02-01
Path            : /hello.txt
Result          : Access is allowed because the CIFS user is owner, inherited ACE grants requested access while
                  setting the attributes.
SecurityStyle   : security_ntfs_sd
Seqnum          : 1
UserName        : RTPRRE\Administrator
Vserver         : beam01
IndexSpecified  : True
SeqnumSpecified : True

ClientIp        : 10.61.169.73
Index           : 1
Keytime         : 1372359104
KeytimeDT       : 6/27/2013 2:51:44 PM
NcController    : 10.63.165.62
Node            : sfp-cmode-02-01
Path            : /hello.txt
Result          : Access is allowed because the CIFS user is owner, inherited ACE grants requested access while
                  setting the attributes.
SecurityStyle   : security_ntfs_sd
Seqnum          : 0
UserName        : RTPRRE\Administrator
Vserver         : beam01
IndexSpecified  : True
SeqnumSpecified : True

```
> Example 2

$q = Get-NcSecurityTrace -Template
$q.Keytime = ">1372359200"
Get-NcSecurityTrace -Query $q
Get all of the security trace results that occurred after the given time.

Path                            Index Seqnum UserName                     KeyTimeDT                    Vserver
----                            ----- ------ --------                     ---------                    -------
/hello.txt                          1      1 RTPRRE\Administrator         6/27/2013 2:53:43 PM         beam01

---

### Parameters
#### **Node**
One or more cluster nodes on which the permission tracing event occurred.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
One or more vservers on which the permission tracing event occurred.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SeqNum**
One or more sequence numbers of the permission tracing event.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SecurityTraceFilterAttributes object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityTrace -Template" to get the initially empty SecurityTraceFilterAttributes object.  If not specified, all data is returned for each object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SecurityTraceResultsLogs]`|false   |named   |false        |

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
Specify to get an empty SecurityTraceFilterAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SecurityTraceFilterAttributes object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecurityTrace -Template" to get the initially empty SecurityTraceFilterAttributes object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[SecurityTraceResultsLogs]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Sectrace.SecurityTraceResultsLogs

---

### Notes
Category: sectrace
API: security-trace-result-show
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSecurityTrace [-Node <String[]>] [-Vserver <String[]>] [-SeqNum <UInt64[]>] [-Attributes <SecurityTraceResultsLogs>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityTrace -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityTrace -Query <SecurityTraceResultsLogs> [-Attributes <SecurityTraceResultsLogs>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
