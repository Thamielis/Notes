Get-NcSecurityIpSec
-------------------

### Synopsis
Retrieves IPsec configuration.

---

### Description

Retrieves IPsec configuration. This cmdlet is supported with Rest

---

### Related Links
* [Set-NcSecurityIpSec](Set-NcSecurityIpSec)

---

### Examples
> Example 1

Get-NcSecurityIpSec -Enabled $false -ReplayWindow 0
Enabled NcController  ReplayWindow
------- ------------  ------------
  False 172.26.206.81            0

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

#### **Template**
Specify $a = Get-NcSecurityIpSec  -Template, to get an empty SecurityIpSec object for use with advanced queries involving the Attributes like $b = Get-NcSecurityIpSec  -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcSecurityIpSec  -Template, to get an empty SecurityIpSec object for use with advanced queries involving the Attributes like $b = Get-NcSecurityIpSec  -Query $a.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[SecurityIpSec]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Security.SecurityIpSec, to get an empty net port metrics object for use with advanced queries involving the Attributes like $b = Get-NcSecurityIpSec  -Attributes $a.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[SecurityIpSec]`|false   |named   |false        |

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
Get-NcSecurityIpSec [[-Enabled] <bool?>] [[-ReplayWindow] <long?>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityIpSec -Template <DataONTAP.C.Types.Security.SecurityIpSec> [<CommonParameters>]
```
```PowerShell
Get-NcSecurityIpSec -Query <SecurityIpSec> [-Attributes <SecurityIpSec>] [<CommonParameters>]
```
