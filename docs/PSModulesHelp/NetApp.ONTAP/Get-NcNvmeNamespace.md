Get-NcNvmeNamespace
-------------------

### Synopsis
Iterate over a list of NVMe target namespace objects.

---

### Description

Iterate over a list of NVMe target namespace objects.

---

### Examples
> Example 1

```PowerShell
Get-NcNvmeNamespace -Vserver vinoths_vs_nvme
Iterate over a list of NVMe target namespace objects of the vserver vinoths_vs_name

Anagrpid                     :
BlockSize                    : 4096
Comment                      :
CreationTimestamp            : 1533301320
IsReadOnly                   : False
NcController                 : 10.236.44.127
Node                         : sti31-vsim-ucs476e
Nsid                         :
Ostype                       : linux
Path                         : /vol/vinoths_vol1/vinoths_ns1
Qtree                        :
RestoreInaccessible          : False
Size                         : 1073741824
SizeUsed                     : 0
State                        : online
Subsystem                    :
Uuid                         : 4cad1fc1-874d-468a-80d1-26008306c885
Volume                       : vinoths_vol1
Vserver                      : vinoths_vs_nvme
VserverUuid                  : e671810e-9717-11e8-a570-005056acdb28
AnagrpidSpecified            : False
IsReadOnlySpecified          : True
NsidSpecified                : False
RestoreInaccessibleSpecified : True

```

---

### Parameters
#### **Vserver**
Vserver Name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Path**
Namespace Path

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[NvmeNamespaceInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
Specify to get an empty NvmeNamespaceInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NvmeNamespaceInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNvmeNamespace -Template" to get the initially empty NvmeNamespaceInfo object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[NvmeNamespaceInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nvme.NvmeNamespaceInfo

---

### Notes
Category: nvme
API: nvme-namespace-get-iter
Family: ontap-cluster,ontap-vserver

---

### Syntax
```PowerShell
Get-NcNvmeNamespace [[-Vserver] <String[]>] [[-Path] <String[]>] [-Attributes <NvmeNamespaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeNamespace -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeNamespace -Query <NvmeNamespaceInfo> [-Attributes <NvmeNamespaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
