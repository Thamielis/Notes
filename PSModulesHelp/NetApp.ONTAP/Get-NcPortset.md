Get-NcPortset
-------------

### Synopsis
Get a list of portset objects.

---

### Description

Get a list of portset objects.

---

### Related Links
* [New-NcPortset](New-NcPortset)

* [Remove-NcPortset](Remove-NcPortset)

---

### Examples
> Example 1

Get-NcPortset
Get all portsets.

NcController       : cerebus
InitiatorGroupInfo :
PortsetName        : portset_fc1
PortsetPortInfo    : {Cerebus-03_fc_if1, Cerebus-03_fc_if2, Cerebus-04_fc_if1, Cerebus-04_fc_if2...}
PortsetPortTotal   : 8
PortsetType        : fcp
Vserver            : Barker03

NcController       : cerebus
InitiatorGroupInfo :
PortsetName        : portset_iscsi1
PortsetPortInfo    : {Cerebus-03_iscsi_if1, Cerebus-03_iscsi_if2, Cerebus-04_iscsi_if1, Cerebus-04_iscsi_if2...}
PortsetPortTotal   : 8
PortsetType        : iscsi
Vserver            : Barker03

NcController       : cerebus
InitiatorGroupInfo :
PortsetName        : portset_fc1
PortsetPortInfo    : {Cerebus-03_fc_if1, Cerebus-03_fc_if2, Cerebus-04_fc_if1, Cerebus-04_fc_if2...}
PortsetPortTotal   : 8
PortsetType        : fcp
Vserver            : Lionetti01

NcController       : cerebus
InitiatorGroupInfo :
PortsetName        : portset_iscsi1
PortsetPortInfo    : {Cerebus-03_iscsi_if1, Cerebus-03_iscsi_if2, Cerebus-04_iscsi_if1, Cerebus-04_iscsi_if2...}
PortsetPortTotal   : 8
PortsetType        : iscsi
Vserver            : Lionetti01

NcController       : cerebus
InitiatorGroupInfo : {fuji05_FC}
PortsetName        : parkerFD_portset
PortsetPortInfo    : {Parker_lif3-1_0c, Parker_lif3-2_0d, Parker_lif4-1_0c, Parker_lif4-2_0d...}
PortsetPortTotal   : 8
PortsetType        : fcp
Vserver            : Parker01

---

### Parameters
#### **Name**
The name of one or more portsets to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Portset|

#### **Vserver**
Restrict results to the specified vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide a PortsetInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcPortset -Template" to get the initially empty PortsetInfo object.  If not specified, all data is returned for each object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PortsetInfo]`|false   |named   |false        |

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
Specify to get an empty PortsetInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a PortsetInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcPortset -Template" to get the initially empty PortsetInfo object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PortsetInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Portset.PortsetInfo

---

### Notes
Category: portset
API: portset-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcPortset [[-Name] <String[]>] [-Vserver <String[]>] [-Attributes <PortsetInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcPortset -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcPortset -Query <PortsetInfo> [-Attributes <PortsetInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
