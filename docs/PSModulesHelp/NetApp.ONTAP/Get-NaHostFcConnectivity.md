Get-NaHostFcConnectivity
------------------------

### Synopsis
Get information about the host fibre channel connections to the current controller.

---

### Description

Get information about the host fibre channel connections to the current controller.

---

### Related Links
* [Get-NaHostFcAdapter](Get-NaHostFcAdapter)

---

### Examples
> Example 1

Get-NaHostFcConnectivity
Get the host fibre channel connectivity to the current controller.

Wwnn                          ConnectedTargets              Wwpn                          Igroup
----                          ----------------              ----                          ------
20:00:00:e0:8b:86:fc:9a       {0b}                          21:00:00:e0:8b:86:fc:9a       {fujirx200rre3_4_fcp}

---

### Parameters
#### **Wwnn**
The WWNN for which to check connectivity.  If not specified, all WWNNs of the host fibre channel adapters will be checked.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Controller**
The Data ONTAP controller object, embodied by an NaController object.  This parameter is returned by the Connect-NaController cmdlet.  If not specified, the value in the global variable CurrentNaController is used.

|Type                  |Required|Position|PipelineInput|Aliases         |
|----------------------|--------|--------|-------------|----------------|
|`[AbstractController]`|false   |named   |false        |Filer<br/>Server|

---

### Inputs

---

### Outputs
* DataONTAP.Types.Fc.FcConnectivity

---

### Notes
Category: host
API: fcp-adapter-initiators-list-info

---

### Syntax
```PowerShell
Get-NaHostFcConnectivity [[-Wwnn] <String[]>] [-Controller <AbstractController>] [<CommonParameters>]
```
