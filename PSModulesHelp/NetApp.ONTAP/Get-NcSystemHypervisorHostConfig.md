Get-NcSystemHypervisorHostConfig
--------------------------------

### Synopsis
Get the attributes of the hypervisor host config.

---

### Description

Get the attributes of the hypervisor host config.

---

### Examples
> Example 1

```PowerShell
Get-NcSystemHypervisorHostConfig -Node sapanj-vsim3
Get the attributes of the hypervisor host config.

AddressIpv4       : 10.140.111.44
NcController      : 10.140.111.42
Node              : sapanj-vsim3
PortIpv4          : 161
PortIpv4Specified : True

```

---

### Parameters
#### **Node**
Node

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information isavailable will be returned.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[SystemHypervisorHostConfigInfo]`|false   |named   |false        |

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
Specify to get an empty Hypervisor Host Config object object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a Hypervisor Host Config object object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSystemHypervisorHostConfig -Template" to get the initially empty Hypervisor Host Config object object.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[SystemHypervisorHostConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.SystemHypervisorHostConfigInfo

---

### Notes
Category: system
API: system-hypervisor-host-config-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcSystemHypervisorHostConfig [[-Node] <String[]>] [-Attributes <SystemHypervisorHostConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemHypervisorHostConfig -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemHypervisorHostConfig -Query <SystemHypervisorHostConfigInfo> [-Attributes <SystemHypervisorHostConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
