Get-NcTemplateManagementTemplate
--------------------------------

### Synopsis
Get the attributes of the template.

---

### Description

Get the attributes of the template.

---

### Examples
> Example 1

```PowerShell
PS C:> Get-NcTemplateManagementTemplate -Name VserverEnvironmentSetup
Description          : Template to configure Vserver Environment
MissingPrerequisites :
Name                 : VserverEnvironmentSetup
NcController         : 172.20.4.24
ParentTemplate       :
Permission           : readonly
Uuid                 : 09c57843-59d7-5ae4-a53d-af5fd7d2ad77
Version              : 1.0

```

---

### Parameters
#### **Name**
Name of the template

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|TemplateName|

#### **Template**
Specify to get an empty TemplateInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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

#### **Query**
For advanced queries, provide a TemplateInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcTemplateManagementTemplate -Template" to get the initially empty TemplateInfo object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[TemplateInfo]`|true    |named   |false        |

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[TemplateInfo]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.TemplateManagement.TemplateInfo

---

### Notes
Category: template management
API: template-management-template-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcTemplateManagementTemplate [[-Name] <String[]>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcTemplateManagementTemplate [[-Name] <String[]>] -Query <TemplateInfo> [-Attributes <TemplateInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcTemplateManagementTemplate [[-Name] <String[]>] [-Attributes <TemplateInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
