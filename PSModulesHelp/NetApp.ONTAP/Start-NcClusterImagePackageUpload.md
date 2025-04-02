Start-NcClusterImagePackageUpload
---------------------------------

### Synopsis

Start-NcClusterImagePackageUpload [-FilePath] <string> [-Controller <NcController[]>] [-ZapiCall] [-Hydrate <string>] [-WhatIf] [-Confirm] [-ZapiRetryCount <int>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **Controller**

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |Benannt |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **FilePath**
Software or Firmware package located on the local filesystem.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |0       |false        |

#### **Hydrate**

Valid Values:

* No
* Partial
* Yes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |Benannt |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **ZapiCall**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[switch]`|false   |Benannt |false        |ONTAPI |

#### **ZapiRetryCount**

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[int]`|false   |Benannt |false        |

---

### Inputs
NetApp.Ontapi.Filer.C.NcController[]

---

### Outputs
* DataONTAP.C.Types.ClusterImage.ClusterImagePackageUpload

---

### Syntax
```PowerShell
syntaxItem                                                                                                                   
```
```PowerShell
----------                                                                                                                   
```
```PowerShell
{@{name=Start-NcClusterImagePackageUpload; CommonParameters=True; WorkflowCommonParameters=False; parameter=System.Object[]}}
```
