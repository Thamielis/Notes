Get-NcAggrAutobalanceNotification
---------------------------------

### Synopsis
Get the nodes that notify Auto Balance Aggregate about aggregates that need to be balanced.

---

### Description

Get the nodes that notify Auto Balance Aggregate about aggregates that need to be balanced.

---

### Examples
> Example 1

```PowerShell
Get-NcAggrAutobalanceNotification
Get the notification nodes.
```

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a AggrAutobalanceNotification object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAggrAutobalanceNotification -Template" to get the initially empty AggrAutobalanceNotification object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[AggrAutobalanceNotification]`|false   |named   |false        |

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
Specify to get an empty AggrAutobalanceNotification object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AggrAutobalanceNotification object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggrAutobalanceNotification -Template" to get the initially empty AggrAutobalanceNotification object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[AggrAutobalanceNotification]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrAutobalanceNotification

---

### Notes
Category: aggr
API: aggr-autobalance-notification-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrAutobalanceNotification [-Attributes <AggrAutobalanceNotification>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrAutobalanceNotification -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrAutobalanceNotification -Query <AggrAutobalanceNotification> [-Attributes <AggrAutobalanceNotification>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
