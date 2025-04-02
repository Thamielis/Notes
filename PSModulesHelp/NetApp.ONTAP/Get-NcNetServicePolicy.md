Get-NcNetServicePolicy
----------------------

### Synopsis
Retrieves a collection of service policies.

---

### Description

Retrieves a collection of service policies. This cmdlet is supported with Rest.

---

### Related Links
* [Set-NcNetServicePolicy](Set-NcNetServicePolicy)

* [New-NcNetServicePolicy](New-NcNetServicePolicy)

* [Remove-NcNetServicePolicy](Remove-NcNetServicePolicy)

---

### Examples
> Example 1

```PowerShell
Get-NcNetServicePolicy
IpSpace      :
IsBuiltIn    :
Name         : default-route-announce
NcController : 172.26.206.81
Scope        : cluster
Services     :
Svm          :
Uuid         : 49f9f917-9ebc-11ec-a82e-d039ea024c8c

```

---

### Parameters
#### **Name**
Specifies the name of the aggregate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Scope**
Scope of Service Policy. Set to \"svm\" for interfaces owned by an SVM. Otherwise, set to \"cluster\". Possible values are: [svm, cluster].

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsBuiltIn**
Specifies if service policy is built-in.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[bool]`|false   |named   |true (ByPropertyName)|

#### **IpSpaceName**
Name of IpSpace.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Services**
Ip Services.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |SvmName|

#### **Uuid**
Uuid of Service Policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcNetServicePolicy -Template, to get an NetService Policy object for use with advanced queries involving the Attributes like $b = Get-NcNetServicePolicy -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcNetServicePolicy -Template, to get an NetService Policy object for use with advanced queries involving the Attributes like $b = Get-NcNetServicePolicy -Query $a.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Net.NetServicePolicy]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Net.NetServicePolicy, to get an empty NetService Policy object for use with advanced queries involving the Attributes like $b = Get-NcNetServicePolicy -Attributes $a.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Net.NetServicePolicy]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetServicePolicy

---

### Notes
Category: Net
Api: /network/ip/service-policies
Family: Controller

---

### Syntax
```PowerShell
Get-NcNetServicePolicy [[-Name] <String>] [[-Scope] <String>] [-Status <String>] [-IsBuiltIn <bool>] [-IpSpaceName <String>] [-Services <string[]>] [-Vserver <String>] [-Uuid <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetServicePolicy -Template <DataONTAP.C.Types.Net.NetServicePolicy> [<CommonParameters>]
```
```PowerShell
Get-NcNetServicePolicy -Query <DataONTAP.C.Types.Net.NetServicePolicy> [<CommonParameters>]
```
```PowerShell
Get-NcNetServicePolicy [-Attributes <DataONTAP.C.Types.Net.NetServicePolicy>] [<CommonParameters>]
```
