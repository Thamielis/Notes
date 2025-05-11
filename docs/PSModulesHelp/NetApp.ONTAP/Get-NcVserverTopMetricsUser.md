Get-NcVserverTopmetricsUser
---------------------------

### Synopsis
Retrieves a list of users with the most IO activity.

---

### Description

Retrieves a list of users with the most IO activity. This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcVserverTopMetricsUser -Vserver vs0
NcController : 10.236.154.53
Iops         : DataONTAP.C.Types.Vserver.Iops
UserId       : 0
UserName     : root
SvmName      : vs0
SvmUuid      : cb316860-d764-11ec-9c70-005056a77eb2
Throughput   :

```

---

### Parameters
#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **UserName**
The name of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcVserverTopmetricsUser -Template, to get an empty vserver top metrics user object for use with advanced queries involving the Attributes like $b = Get-NcVserverTopmetricsUser -Attributes $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Vserver.VserverTopMetricsUser, to get an empty vserver top metrics user object for use with advanced queries involving the Attributes like $b = Get-NcVserverTopmetricsUser -Attributes $a.

|Type                                               |Required|Position|PipelineInput|
|---------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.VserverTopMetricsUser]`|false   |named   |false        |

#### **Query**
Specify $a = Get-NcVserverTopmetricsUser -Template, to get an empty vserver top metrics user object for use with advanced queries involving the Attributes like $b = Get-NcVserverTopmetricsUser -Query $a.

|Type                                               |Required|Position|PipelineInput|
|---------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.VserverTopMetricsUser]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverTopMetricsUser

---

### Notes
Category: Vserver
Api: api/svm/svms/{svm.uuid}/top-metrics/users
Family: controller

---

### Syntax
```PowerShell
Get-NcVolTopmetricsUser [-Vserver] <String> [-UserName <String>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopmetricsUser -Template <DataONTAP.C.Types.Vserver.VserverTopMetricsUser> [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopmetricsUser [-Attributes <DataONTAP.C.Types.Vserver.VserverTopMetricsUser>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopmetricsUser -Query <DataONTAP.C.Types.Vserver.VserverTopMetricsUser> [<CommonParameters>]
```
