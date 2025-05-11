Set-NcSecurityIpSec
-------------------

### Synopsis
Updates IPsec configuration.

---

### Description

Updates IPsec configuration. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcSecurityIpSec](Get-NcSecurityIpSec)

---

### Examples
> Example 1

Set-NcSecurityIpSec -Enabled $true -ReplayWindow 64
Enabled ReplayWindow NcController
------- ------------ ------------
   True           64 172.26.206.81

---

### Parameters
#### **Enabled**
Indicates whether or not IPsec is enabled.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|true    |0       |true (ByPropertyName)|

#### **ReplayWindow**
Replay window size in packets, where 0 indicates that the relay window is disabled." +
            "Possible values are : [ 0, 64, 128, 256, 512, 1024 ]"
Valid Values:

* 0
* 64
* 128
* 256
* 512
* 1024

|Type     |Required|Position|PipelineInput         |
|---------|--------|--------|----------------------|
|`[long?]`|true    |1       |false (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityIpSec

---

### Notes
Category: Security
Api: api/security/ipsec
Family: NcController

---

### Syntax
```PowerShell
Set-NcSecurityIpSec [[-Enabled] <bool?>] [[-ReplayWindow] <long?>] [<CommonParameters>]
```
