Get-NcSystemImageExternalPackage
--------------------------------

### Synopsis
Display file listing on external device

---

### Description

Display file listing on external device

---

### Parameters
#### **Node**
The name of one or more nodes to get packages for.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Package**
The name of one or more packages to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Name   |

#### **Device**
The name of one or more device to get packages for.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SystemImageExternalPackageAttributes object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSystemImageExternalPackage -Template" to get the initially empty SystemImageExternalPackageAttributes object.  If not specified, all data is returned for each object.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[SystemImageExternalPackageAttributes]`|false   |named   |false        |

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
Specify to get an empty SystemImageExternalPAckageAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SystemImageExternalPackageAttributes object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSystemImageExternalPackage -Template" to get the initially empty SystemImageExternalPackageAttributes object.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[SystemImageExternalPackageAttributes]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.SystemImageExternalPackageAttributes

---

### Notes
Category: system
API: system-image-external-package-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSystemImageExternalPackage [[-Node] <String[]>] [[-Package] <String[]>] [[-Device] <String[]>] [-Attributes <SystemImageExternalPackageAttributes>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemImageExternalPackage -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemImageExternalPackage -Query <SystemImageExternalPackageAttributes> [-Attributes <SystemImageExternalPackageAttributes>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
