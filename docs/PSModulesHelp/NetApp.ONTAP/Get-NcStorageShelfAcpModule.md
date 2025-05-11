Get-NcStorageShelfAcpModule
---------------------------

### Synopsis
Return the module list

---

### Description

Return the module list

---

### Related Links
* [Get-NcStorageShelfAcp](Get-NcStorageShelfAcp)

* [Set-NcStorageShelfStorageAcp](Set-NcStorageShelfStorageAcp)

---

### Parameters
#### **Node**
Restrict by specifying one or more node name(s) that has alternate control path configured

|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName<br/>Nodes|

#### **Module**
Restrict by specifying one or more module name(s)

|Type        |Required|Position|PipelineInput        |Aliases               |
|------------|--------|--------|---------------------|----------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|ModuleName<br/>Modules|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[StorageShelfAcpModule]`|false   |named   |false        |

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

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[StorageShelfAcpModule]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageShelf.StorageShelfAcpModule

---

### Notes
Category: ses
API: storage-shelf-acp-module-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageShelfAcpModule [[-Node] <String[]>] [[-Module] <String[]>] [-Attributes <StorageShelfAcpModule>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfAcpModule -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfAcpModule -Query <StorageShelfAcpModule> [-Attributes <StorageShelfAcpModule>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
