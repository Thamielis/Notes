Get-NcQosPolicyGroup
--------------------

### Synopsis
Get a list of QoS policy groups.

---

### Description

Get a list of QoS policy groups.

---

### Related Links
* [Set-NcQosPolicyGroup](Set-NcQosPolicyGroup)

* [Update-NcQosPolicyGroup](Update-NcQosPolicyGroup)

* [Remove-NcQosPolicyGroup](Remove-NcQosPolicyGroup)

* [New-NcQosPolicyGroup](New-NcQosPolicyGroup)

---

### Examples
> Example 1

```PowerShell
Get-NcQosPolicyGrou -UUID 7283e55f-706a-11e2-86af-123478563412
Get the QoS policy group with the given UUID.

MaxThroughput    : INF
NcController     : 10.63.165.62
Pgid             : 4
PolicyGroup      : _Performance_Monitor_volumes
PolicyGroupClass : system_defined
Uuid             : 7283e55f-706a-11e2-86af-123478563412
Vserver          :
PgidSpecified    : True

```

---

### Parameters
#### **Name**
Name of the policy group. Policy group names must be unique and are restricted to 128 alphanumeric characters, '-', and '_', and must start with an alphanumeric character (a-z, A-Z, or 0-9).

|Type        |Required|Position|PipelineInput        |Aliases                   |
|------------|--------|--------|---------------------|--------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PolicyName<br/>PolicyGroup|

#### **Uuid**
Universally unique identifier for the QoS policy group.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|PolicyUuid|

#### **Vserver**
The Data Vserver to which the policy group belongs.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a QosPolicyGroupInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcQosPolicyGroup -Template" to get the initially empty QosPolicyGroupInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[QosPolicyGroupInfo]`|false   |named   |false        |

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
Specify to get an empty QosPolicyGroupInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QosPolicyGroupInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQosPolicyGroup -Template" to get the initially empty QosPolicyGroupInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[QosPolicyGroupInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosPolicyGroupInfo

---

### Notes
Category: qos
API: qos-policy-group-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcQosPolicyGroup [[-Name] <String[]>] [[-Uuid] <String[]>] [[-Vserver] <String[]>] [-Attributes <QosPolicyGroupInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQosPolicyGroup -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcQosPolicyGroup -Query <QosPolicyGroupInfo> [-Attributes <QosPolicyGroupInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
