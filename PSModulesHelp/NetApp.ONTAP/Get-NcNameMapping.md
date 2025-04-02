Get-NcNameMapping
-----------------

### Synopsis
Get the list of name mappings in the cluster.

---

### Description

Get the list of name mappings in the cluster.

---

### Related Links
* [New-NcNameMapping](New-NcNameMapping)

* [Move-NcNameMapping](Move-NcNameMapping)

* [Remove-NcNameMapping](Remove-NcNameMapping)

* [Set-NcNameMapping](Set-NcNameMapping)

---

### Examples
> Example 1

```PowerShell
Get-NcNameMapping -Direction win_unix
Get all of the Windows to Unix name mappings.

Direction         : win_unix
NcController      : 192.168.182.144
Pattern           : TESTDOMAIN\\bart
Position          : 2
Replacement       : simpsbart
PositionSpecified : True

```
> Example 2

```PowerShell
$q = Get-NcNameMapping -Template
$q.Replacement = "simpsbart"
Get-NcNameMapping -Query $q
Get all of the Windows to Unix name mappings that map to Unix user simpsbart.

Direction         : win_unix
NcController      : 192.168.182.144
Pattern           : TESTDOMAIN\\bart
Position          : 2
Replacement       : simpsbart
PositionSpecified : True

```

---

### Parameters
#### **Position**
The position of one or more name mappings in the list of name mappings.  Data ONTAP wildcards are permitted.

|Type          |Required|Position|PipelineInput        |
|--------------|--------|--------|---------------------|
|`[Decimal][]]`|false   |1       |true (ByPropertyName)|

#### **Direction**
The direction which the name mapping is applied.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Pattern**
One or more patterns to use to match the name.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NameMappingInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNameMapping -Template" to get the initially empty NameMappingInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[NameMappingInfo]`|false   |named   |false        |

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
Specify to get an empty NameMappingInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NameMappingInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNameMapping -Template" to get the initially empty NameMappingInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[NameMappingInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.NameMapping.NameMappingInfo

---

### Notes
Category: name mapping
API: name-mapping-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNameMapping [[-Position] <Decimal][]>] [[-Direction] <String[]>] [[-Pattern] <String[]>] [-Attributes <NameMappingInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameMapping -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameMapping -Query <NameMappingInfo> [-Attributes <NameMappingInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
