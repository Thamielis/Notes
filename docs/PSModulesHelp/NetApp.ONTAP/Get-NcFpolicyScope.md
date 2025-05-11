Get-NcFpolicyScope
------------------

### Synopsis
Get a list of FPolicy scope options.

---

### Description

Get a list of FPolicy scope options. FPolicy scope consists of share, volume, export policy, volume, file extension.

---

### Related Links
* [New-NcFpolicyScope](New-NcFpolicyScope)

* [Set-NcFpolicyScope](Set-NcFpolicyScope)

* [Remove-NcFpolicyScope](Remove-NcFpolicyScope)

---

### Examples
> Example 1

Get-NcFpolicyScope -PolicyName test_policy
Get the FPolicy scope for the given policy.

CheckExtensionsOnDirectories          : False
ExportPoliciesToExclude               :
ExportPoliciesToInclude               :
FileExtensionsToExclude               : {txt}
FileExtensionsToInclude               : {vhd, vhdx, vmdk}
NcController                          : 10.63.165.62
PolicyName                            : test_policy
SharesToExclude                       :
SharesToInclude                       :
VolumesToExclude                      :
VolumesToInclude                      : {powershell}
Vserver                               : beam01

> Example 2

$q = Get-NcFpolicyScope -Template
$q.FileExtensionsToInclude = @('vhd', 'vhdx')
Get-NcFpolicyScope -Query $q
Get the FPolicy scope for policies that include the vhd and vhdx file extensions.

CheckExtensionsOnDirectories          : False
ExportPoliciesToExclude               :
ExportPoliciesToInclude               :
FileExtensionsToExclude               : {txt}
FileExtensionsToInclude               : {vhd, vhdx, vmdk}
NcController                          : 10.63.165.62
PolicyName                            : test_policy
SharesToExclude                       :
SharesToInclude                       :
VolumesToExclude                      :
VolumesToInclude                      : {powershell}
Vserver                               : beam01

---

### Parameters
#### **PolicyName**
One or more Fpolicy policies for which to get scope information.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Restrict the results to one or more vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FpolicyScopeConfig object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFpolicyScope -Template" to get the initially empty FpolicyScopeConfig object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[FpolicyScopeConfig]`|false   |named   |false        |

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
Specify to get an empty FpolicyScopeConfig object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FpolicyScopeConfig object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFpolicyScope -Template" to get the initially empty FpolicyScopeConfig object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[FpolicyScopeConfig]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyScopeConfig

---

### Notes
Category: fpolicy
API: fpolicy-policy-scope-get-iter
Family: vserver,cluster

---

### Syntax
```PowerShell
Get-NcFpolicyScope [[-PolicyName] <String[]>] [[-Vserver] <String[]>] [-Attributes <FpolicyScopeConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyScope -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyScope -Query <FpolicyScopeConfig> [-Attributes <FpolicyScopeConfig>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
