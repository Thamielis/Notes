Get-NcNvmeInterface
-------------------

### Synopsis
Iterate over a list of NVMe Interface objects.

---

### Description

Iterate over a list of NVMe Interface objects.

---

### Examples
> Example 1

```PowerShell
Get-NcNvmeInterface -Vserver vinoths_vs_nvme
Iterate over a list of NVMe Interface objects of the vserver vinoths_vs_nvme

Comment            : -
FcWwnn             : 20:00:00:50:56:ac:1c:f4
FcWwpn             : 20:01:00:50:56:ac:1c:f4
HomeNode           : sti31-vsim-ucs476e
HomePort           : 1a
Lif                : vinoths_lif1
LifUuid            : 20b20e03-971d-11e8-a570-005056acdb28
NcController       : 10.236.44.127
PhysicalProtocol   : fibre_channel
StatusAdmin        : up
TransportAddress   : nn-0x2000005056ac1cf4:pn-0x2001005056ac1cf4
TransportProtocols : {fc_nvme}
Vserver            : vinoths_vs_nvme
VserverUuid        : e671810e-9717-11e8-a570-005056acdb28

```

---

### Parameters
#### **Vserver**
Vserver Name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Lif**
Logical Interface

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[NvmeInterfaceInfo]`|false   |named   |false        |

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
Specify to get an empty NvmeInterfaceInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NvmeInterfaceInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNvmeInterface -Template" to get the initially empty NvmeInterfaceInfo object.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[NvmeInterfaceInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nvme.NvmeInterfaceInfo

---

### Notes
Category: nvme
API: nvme-interface-get-iter
Family: ontap-cluster,ontap-vserver

---

### Syntax
```PowerShell
Get-NcNvmeInterface [[-Vserver] <String[]>] [[-Lif] <String[]>] [-Attributes <NvmeInterfaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeInterface -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeInterface -Query <NvmeInterfaceInfo> [-Attributes <NvmeInterfaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
