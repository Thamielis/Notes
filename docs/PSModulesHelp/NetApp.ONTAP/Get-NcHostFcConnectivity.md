Get-NcHostFcConnectivity
------------------------

### Synopsis
Get information about the host fibre channel connections to the current controller.

---

### Description

Get information about the host fibre channel connections to the current controller.

---

### Examples
> Example 1

Get-NcHostFcConnectivity
Get the host fibre channel connectivity to the current cluster.

Wwnn                          ConnectedTargets              Wwpn                          Igroup
----                          ----------------              ----                          ------
20:01:00:e0:8b:a6:fc:9a       {0b}                          21:01:00:e0:8b:a6:fc:9a       {wsfcrre_fcp, fujirx200rre...

---

### Parameters
#### **Wwnn**
The WWNN for which to check connectivity.  If not specified, all WWNNs of the host fibre channel adapters will be checked.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Fc.FcConnectivity

---

### Notes
Category: host
API: fcp-initiator-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcHostFcConnectivity [[-Wwnn] <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
