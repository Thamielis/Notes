Get-NcTemplateManagementTemplateProvisionError
----------------------------------------------

### Synopsis
Get the Template Provision Error Details.

---

### Description

Get the Template Provision Error Details.

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
#### **Jobid**
Job ID

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Decimal]`|true    |1       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.TemplateManagement.TemplateProvisionErrorInfo

---

### Notes
Category: template management
API: template-management-template-provision-error-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcTemplateManagementTemplateProvisionError [-Jobid] <Decimal> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
