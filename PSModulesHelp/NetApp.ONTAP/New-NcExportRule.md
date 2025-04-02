New-NcExportRule
----------------

### Synopsis
Create an export rule configuration.

---

### Description

Create an export rule configuration.

---

### Related Links
* [Get-NcExportRule](Get-NcExportRule)

* [Remove-NcExportRule](Remove-NcExportRule)

* [Set-NcExportRule](Set-NcExportRule)

* [Set-NcExportRuleIndex](Set-NcExportRuleIndex)

---

### Examples
> Example 1

```PowerShell
New-NcExportRule dlamotta0101 -ClientMatch 10.69.169.172 -ReadOnlySecurityFlavor any -ReadWriteSecurityFlavor sys
Create a new export policy rule.
```

---

### Parameters
#### **Policy**
Export policy name.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **Index**
Export rule index. A next available value is assigned if no value is provided during create else the rule is inserted at the given rule index position in the export-rule table.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[UInt32]`|false   |2       |true (ByPropertyName)|RuleIndex|

#### **ClientMatch**
Client match specification for Export rule. The clients specified are enforced with this Export rule. The rule with the higher rule index value takes precedence.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ReadOnlySecurityFlavor**
Rule for read-only access.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **ReadWriteSecurityFlavor**
Rule for read-write access.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **Protocol**
Client access protocol. Default value is 'any'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Anon**
User name or ID to which anonymous users are mapped. Default value is '65534'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SuperUserSecurityFlavor**
Security flavors for the superuser. Default value is 'never'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **EnableSetUid**
If specified, the NFS server will honor SetUID bits in SETATTR operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableSetUid**
If specified, the NFS server will not honor SetUID bits in SETATTR operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableDev**
If specified, the NFS server will allow creation of devices.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableDev**
If specified, the NFS server will not allow creation of devices.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NtfsUnixSecurityOps**
Ignore/Fail unix security operations on NTFS volumes. Possible values are 'ignore', 'fail'. Default value is 'fail'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ChownMode**
Change ownership mode. Possible values are 'restricted', 'unrestricted'. Default value is 'restricted'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Exports.ExportRuleInfo

---

### Notes
Category: exports
API: export-rule-create
Family: vserver

---

### Syntax
```PowerShell
New-NcExportRule [-Policy] <String> [[-Index] <UInt32>] -ClientMatch <String> -ReadOnlySecurityFlavor <String[]> -ReadWriteSecurityFlavor <String[]> [-Protocol <String[]>] [-Anon <String>] 
```
```PowerShell
[-SuperUserSecurityFlavor <String[]>] [-EnableSetUid] [-DisableSetUid] [-EnableDev] [-DisableDev] [-NtfsUnixSecurityOps <String>] [-ChownMode <String>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
