Add-NcLunAttributes
-------------------

### Synopsis
Adds an attribute to a LUN

---

### Description

Adds an attribute to a LUN.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcLunAttribute](Get-NcLunAttribute)

---

### Examples
> Example 1

Add-NcLunAttributes -Path /vol/Vol1/Test -Name testVald -Value TestValdetails -VserverContext vs0
Adds an attribute to a LUN

Path                               : testVald
Alignment                          :
Application                        :
ApplicationUuid                    :
BackingSnapshot                    :
BlockSize                          :
Class                              :
CloneBackingSnapshot               :
Comment                            :
CreationTimestamp                  :
CreationTimestampDT                :
DeviceBinaryId                     :
DeviceId                           :
DeviceTextId                       :
IsClone                            :
IsCloneAutodeleteEnabled           :
IsInconsistentImport               :
IsRestoreInaccessible              :
IsSpaceAllocEnabled                :
IsSpaceReservationEnabled          :
Mapped                             :
MultiprotocolType                  :
NcController                       : 172.21.91.21
Node                               :
Online                             :
PrefixSize                         :
QosAdaptivePolicyGroup             :
QosPolicyGroup                     :
Qtree                              :
ReadOnly                           :
Serial7Mode                        :
SerialNumber                       :
ShareState                         :
Size                               :
SizeUsed                           :
Staging                            :
State                              :
SuffixSize                         :
Uuid                               :
Volume                             :
Vserver                            :
Statistics                         :
LunAttribute                       :
QosPolicy                          :
LunMap                             :
Copy                               :
ConsistencyGroup                   :
Movement                           :
Space                              :
Metric                             :
Vvol                               :
Location                           :
Status                             :
LogicalUnit                        :
BlockSizeSpecified                 : False
CreationTimestampSpecified         : False
DeviceIdSpecified                  : False
IsCloneAutodeleteEnabledSpecified  : False
IsCloneSpecified                   : False
IsInconsistentImportSpecified      : False
IsRestoreInaccessibleSpecified     : False
IsSpaceAllocEnabledSpecified       : False
IsSpaceReservationEnabledSpecified : False
MappedSpecified                    : False
OnlineSpecified                    : False
PrefixSizeSpecified                : False
ReadOnlySpecified                  : False
SizeSpecified                      : False
SizeUsedSpecified                  : False
StagingSpecified                   : False
SuffixSizeSpecified                : False

---

### Parameters
#### **Path**
Path of the LUN for which to set attribute value.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Lun    |

#### **Name**
Name of the attribute to set.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Value**
Value of the attribute.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
Api: /api/storage/luns/{lun.uuid}/attributes
Family: vserver

---

### Syntax
```PowerShell
Add-NcLunAttributes [-Path] <String> [-Name] <String> [-Value] <String> [<CommonParameters>]
```
