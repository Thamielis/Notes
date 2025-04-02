Get-NcExportRule
----------------

### Synopsis
Get export rule configurations.

---

### Description

Get export rule configurations.

---

### Related Links
* [New-NcExportRule](New-NcExportRule)

* [Remove-NcExportRule](Remove-NcExportRule)

* [Set-NcExportRule](Set-NcExportRule)

* [Set-NcExportRuleIndex](Set-NcExportRuleIndex)

---

### Examples
> Example 1

Get-NcExportRule -Vserver dlamotta01
Get all of the export rules for the vserver dlamotta01.

PolicyName               RuleIndex    ClientMatch      Protocol     RoRule       RwRule       Vserver
----------               ---------    -----------      --------     ------       ------       -------
default                  1            0.0.0.0/0        {any}        {any}        {any}        dlamotta01
dlamotta0112             1            0.0.0.0/0        {any}        {sys}        {sys}        dlamotta01
dlamotta0114             1            10.69.169.74     {any}        {sys}        {sys}        dlamotta01

> Example 2

$q = Get-NcExportRule -Template
$q.ClientMatch = "10.61.167.167"
Get-NcExportRule -Query $q
Get the export rules that match the client 10.61.167.167.

PolicyName               RuleIndex    ClientMatch      Protocol     RoRule       RwRule       Vserver
----------               ---------    -----------      --------     ------       ------       -------
costea010                1            10.61.167.167    {any}        {sys}        {sys}        costea01
costea011                1            10.61.167.167    {any}        {sys}        {sys}        costea01
costea0110               1            10.61.167.167    {any}        {sys}        {sys}        costea01
costea0118               1            10.61.167.167    {any}        {sys}        {sys}        costea01
costea0122               1            10.61.167.167    {any}        {sys}        {sys}        costea01
costea013                1            10.61.167.167    {any}        {sys}        {sys}        costea01

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Policy**
The name of the export policy to get rules for.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PolicyName|

#### **Index**
Export rule index.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |2       |true (ByPropertyName)|RuleIndex|

#### **Protocol**
The name of the protocol.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an ExportRuleInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcExportRule -Template" to get the initially empty ExportRuleInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExportRuleInfo]`|false   |named   |false        |

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
Specify to get an empty ExportRuleInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an ExportRuleInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcExportRule -Template" to get the initially empty ExportRuleInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ExportRuleInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Exports.ExportRuleInfo

---

### Notes
Category: exports
API: export-rule-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcExportRule [-Vserver <String[]>] [[-Policy] <String[]>] [[-Index] <String[]>] [-Protocol <String[]>] [-Attributes <ExportRuleInfo>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcExportRule -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcExportRule -Query <ExportRuleInfo> [-Attributes <ExportRuleInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
