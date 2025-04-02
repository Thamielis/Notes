Get-NcTemplateManagementTemplateParameter
-----------------------------------------

### Synopsis
Get the parameter of a Template.

---

### Description

Get the parameter of a Template.

---

### Examples
> Example 1

```PowerShell
PS C:> Get-NcTemplateManagementTemplateParameter
AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : ad_admin_name
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : MaxLength : Name : ad_admin_passwd NcController : 172.20.4.24 Permission : readonly RangeMax : RangeMin : RecommendedValue :
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : ad_domain
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : CN=Computers
MaxLength          :
Name               : ad_ou
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : CN=Computers
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : cifs_server
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : client_config
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : data_lif
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : array of lifInfoStruct
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : data_lif[#].homenode
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : data_lif[#].homeport
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : data_lif[#].ipaddr
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : IPAddress
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : data_lif[#].netmask
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : IPAddress
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : data_lif[#].protocol
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : dns_server
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : gateway
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : array of IPAddress
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       :
MaxLength          :
Name               : gateway[#]
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   :
Template           : VserverEnvironmentSetup
Type               : IPAddress
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : Default
MaxLength          :
Name               : ipspace
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : Default
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : C.UTF-8
MaxLength          :
Name               : language
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : C.UTF-8
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : ldap_base_dn
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : ldap_server
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : nis_domain
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : nis_ipaddr
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        : nfs, cifs, iscsi, fcp
DefaultValue       : -
MaxLength          :
Name               : protocols
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : enum
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : search_domain
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : unix
MaxLength          :
Name               : security_style
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : unix
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : vserver
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

AllowedVals        :
DefaultValue       : -
MaxLength          :
Name               : wg_name
NcController       : 172.20.4.24
Permission         : readonly
RangeMax           :
RangeMin           :
RecommendedValue   : -
Template           : VserverEnvironmentSetup
Type               : string
MaxLengthSpecified : False
RangeMaxSpecified  : False
RangeMinSpecified  : False

```

---

### Parameters
#### **Name**
Name of the parameter

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **TemplateName**
Name of the template

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[TemplateParameterInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty AggrObjectStore object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a TemplateParameterInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcTemplateManagementTemplateParameter -Template" to get the initially empty TemplateParameterInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[TemplateParameterInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.TemplateManagement.TemplateParameterInfo

---

### Notes
Category: template management
API: template-management-template-parameter-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcTemplateManagementTemplateParameter [[-Name] <String[]>] [[-TemplateName] <String[]>] [-Attributes <TemplateParameterInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcTemplateManagementTemplateParameter -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcTemplateManagementTemplateParameter -Query <TemplateParameterInfo> [-Attributes <TemplateParameterInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
