Test-NcAutoSupport
------------------

### Synopsis
Get Current Status of AutoSupport Subsystem for all nodes.

---

### Description

Get Current Status of AutoSupport Subsystem for all nodes.

---

### Related Links
* [Invoke-NcAutosupportDiagnostic](Invoke-NcAutosupportDiagnostic)

* [Test-NcAutosupportConnectivity](Test-NcAutosupportConnectivity)

---

### Examples
> Example 1

Test-NcAutosupport -Node aparajir-vsim1 -CheckCategory smtp
Get current status of smtp subsystem of autosupport on node aparajir-vsim1

CheckCategory    : smtp
CheckType        : mail_server
CorrectiveAction : 
ErrorDetail      : SMTP connectivity check failed for destination: mailhost. Error: Couldn't resolve host name.
NcController     : 10.238.49.117
NodeName         : aparajir-vsim1
Status           : failed

CheckCategory    : smtp
CheckType        : rollup_status
CorrectiveAction : 
ErrorDetail      : 
NcController     : 10.238.49.117
NodeName         : aparajir-vsim1
Status           : failed

---

### Parameters
#### **Node**
The name of a controller on which the AutoSupport tool is running.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **CheckType**
Type of AutoSupport Check
Possible values: 
    'rollup_status'            - Overall Status for a category,
    'http_put_destination'     - HTTP/HTTPS PUT Destination,
    'http_post_destination'    - HTTP/HTTPS POST Destination,
    'mail_server'              - AutoSupport MailServer,
    'ondemand_server'          - AutoSupport OnDemand Server,
    'configuration'            - AutoSupport Configuration

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Type   |

#### **CheckCategory**
Category of AutoSupport Check
Possible values: 
    'http_https'     - AutoSupport HTTP/HTTPS Destination,
    'smtp'           - AutoSupport SMTP Destination,
    'on_demand'      - AutoSupport OnDemand Destination,
    'configuration'  - AutoSupport Configuration

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Category|

#### **Status**
@Status of this AutoSupport Check.
Possible values:   
	'ok'        - The Status of the AutoSupport check is ok.,
	'warning'   - Please verify the intended behavior.,
	'failed'    - AutoSupport check failed.,
	'not_run'   - AutoSupport check could not be run.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[AutosupportCheckInfo]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[AutosupportCheckInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Autosupport.AutosupportCheckInfo

---

### Notes
Category: Autosupport
API: autosupport-check-iter
Family: cluster

---

### Syntax
```PowerShell
Test-NcAutoSupport [[-Node] <String[]>] [-CheckType <String[]>] [-CheckCategory <String[]>] [-Status <String[]>] [-Attributes <AutosupportCheckInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Test-NcAutoSupport -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Test-NcAutoSupport -Query <AutosupportCheckInfo> [-Attributes <AutosupportCheckInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
