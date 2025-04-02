New-NcFpolicyScope
------------------

### Synopsis
Create FPolicy scope options.

---

### Description

Create FPolicy scope options. FPolicy Scope is consist of share, volume, export policy, volume, file extension.

---

### Related Links
* [Get-NcFpolicyScope](Get-NcFpolicyScope)

* [Set-NcFpolicyScope](Set-NcFpolicyScope)

* [Remove-NcFpolicyScope](Remove-NcFpolicyScope)

---

### Examples
> Example 1

```PowerShell
New-NcFpolicyScope -PolicyName test_policy -VolumesToInclude powershell
Set the FPolicy policy scope for the given policy to include the given volume.

CheckExtensionsOnDirectories          : False
ExportPoliciesToExclude               :
ExportPoliciesToInclude               :
FileExtensionsToExclude               :
FileExtensionsToInclude               :
NcController                          : 10.63.165.62
PolicyName                            : test_policy
SharesToExclude                       :
SharesToInclude                       :
VolumesToExclude                      :
VolumesToInclude                      : {powershell}
Vserver                               : beam01

```

---

### Parameters
#### **PolicyName**
Name of the policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **SharesToInclude**
Shares to include for file access monitoring.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SharesToExclude**
Shares to exclude for file access monitoring.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **VolumesToInclude**
Volumes that are active for the file policy. The list can include items which are regular expressions, such as 'vol*' or 'user?'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **VolumesToExclude**
Volumes that are inactive for the file policy. The list can include items which are regular expressions, such as 'vol*' or 'user?'. Note that if a policy has both an exclude list and an include list, the include list is ignored by the filer when processing user requests.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ExportPoliciesToInclude**
Export Policies to include for file access monitoring.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ExportPoliciesToExclude**
Export Policies to exclude for file access monitoring.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **FileExtensionsToInclude**
File extensions included for screening.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **FileExtensionsToExclude**
File extensions excluded for screening.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **CheckExtensionsOnDirectories**
If specified, directory names are subjected to extensions check, similar to file names.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsMonitoringOfObjectsWithNoExtensionEnabled**
Indicates whether monitoring of Objects with no extension is enabled or not.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyScopeConfig

---

### Notes
Category: fpolicy
API: fpolicy-policy-scope-create
Family: vserver

---

### Syntax
```PowerShell
New-NcFpolicyScope [-PolicyName] <String> [-SharesToInclude <String[]>] [-SharesToExclude <String[]>] [-VolumesToInclude <String[]>] [-VolumesToExclude <String[]>] [-ExportPoliciesToInclude 
```
```PowerShell
<String[]>] [-ExportPoliciesToExclude <String[]>] [-FileExtensionsToInclude <String[]>] [-FileExtensionsToExclude <String[]>] [-CheckExtensionsOnDirectories] 
```
```PowerShell
[-IsMonitoringOfObjectsWithNoExtensionEnabled <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
