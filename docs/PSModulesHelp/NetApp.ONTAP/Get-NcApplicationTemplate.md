Get-NcApplicationTemplate
-------------------------

### Synopsis
Retrieves application templates. This cmdlet is supported with Rest Only.

---

### Description

Retrieves application template..

---

### Examples
> Example 1

```PowerShell
Get-NcApplicationTemplate -Name nas
NcController   : 10.234.85.2
Name           : nas
Protocol       : nas
Description    : A generic NAS application.
MongoDbOnSan   :
Nas            : none
Nvme           :
OracleOnNfs    :
OracleOnSan    :
OracleRacOnSan :
OracleRacOnNfs :
SqlOnSan       :
SqlOnSmb       :
VdiOnNas       :
VdiOnSan       :
VsiOnNas       :
VsiOnSan       :
San            :
S3Bucket       :

```
> Example 2

```PowerShell
$a =  Get-NcApplicationTemplate -Template
                       $a.Name = "nas"
                       $a.Protocol = "nas"
                       Get-NcApplicationTemplate -Query $a
NcController   : 10.234.85.2
Name           : nas
Protocol       : nas
Description    : A generic NAS application.
MongoDbOnSan   :
Nas            : none
Nvme           :
OracleOnNfs    :
OracleOnSan    :
OracleRacOnSan :
OracleRacOnNfs :
SqlOnSan       :
SqlOnSmb       :
VdiOnNas       :
VdiOnSan       :
VsiOnNas       :
VsiOnSan       :
San            :
S3Bucket       :

```

---

### Parameters
#### **Name**
Name of the Application Template

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |true         |

#### **Protocol**
Specifies the access protocol associated with template

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Description**
Description for application template

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaxRecords**
Specify the maximum number of records returned

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcApplicationTemplate -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcApplicationTemplate -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcApplicationTemplate -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcApplicationTemplate -Query $a.

|Type                                                  |Required|Position|PipelineInput|
|------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.ApplicationTemplates]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Application.ApplicationTemplates, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcApplicationTemplate -Attributes $a.

|Type                                                  |Required|Position|PipelineInput|
|------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.ApplicationTemplates]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Application.ApplicationTemplates

---

### Notes
Category: Application
Api: /api/application/templates
Family: Cluster

---

### Syntax
```PowerShell
Get-NcApplicationTemplate [[-Name] <String>] [-Protocol <String>] [<CommonParameters>]
```
```PowerShell
Get-NcApplicationTemplate -Template <DataONTAP.C.Types.Application.ApplicationTemplates> [<CommonParameters>]
```
```PowerShell
Get-NcApplicationTemplate -Query <DataONTAP.C.Types.Application.ApplicationTemplates> [-Attributes <DataONTAP.C.Types.Application.ApplicationTemplates>] [<CommonParameters>]
```
