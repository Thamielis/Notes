Get-NcVolTopmetricsUser
-----------------------

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
Get-NcVolTopmetricsUser -Volume vol1 -Vserver vs0
NcController : 10.236.154.53
Iops         : DataONTAP.C.Types.Volume.Iops
UserId       : 0
UserName     : root
SvmName      : vs0
SvmUuid      : cb316860-d764-11ec-9c70-005056a77eb2
Throughput   :
VolumeName   : vol1
VolumeUuid   : 04860ee0-d837-11ec-ab49-005056a7bc56

```

---

### Parameters
#### **Volume**
The name of the volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **UserName**
The name of the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcVolTopmetricsUser -Template, to get an empty vol top metrics user object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsUser -Attributes $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Volume.VolTopMetricsUser, to get an empty vol top metrics user object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsUser -Attributes $a.

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.VolTopMetricsClient]`|false   |named   |false        |

#### **Query**
Specify $a = Get-NcVolTopmetricsUser -Template, to get an empty vol top metrics user object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsUser -Query $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.VolTopMetricsUser]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolTopMetricsUser

---

### Notes
Category: Volume
Api: /storage/volumes/{volume.uuid}/top-metrics/users
Family: controller

---

### Syntax
```PowerShell
Get-NcVolTopmetricsUser [-Volume] <String> -Vserver <String> [-UserName <String>] [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsUser -Template <DataONTAP.C.Types.Volume.VolTopMetricsUser> [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsUser [-Attributes <DataONTAP.C.Types.Volume.VolTopMetricsUser>] [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsUser -Query <DataONTAP.C.Types.Volume.VolTopMetricsUser> [<CommonParameters>]
```
