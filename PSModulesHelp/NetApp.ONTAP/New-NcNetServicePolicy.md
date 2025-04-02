New-NcNetServicePolicy
----------------------

### Synopsis
Creates a service policy for network interfaces.

---

### Description

Creates a service policy for network interfaces. This cmdlet is supported with Rest

---

### Related Links
* [Set-NcNetServicePolicy](Set-NcNetServicePolicy)

* [Get-NcNetServicePolicy](Get-NcNetServicePolicy)

* [Remove-NcNetServicePolicy](Remove-NcNetServicePolicy)

---

### Examples
> Example 1

```PowerShell
New-NcNetServicePolicy -Name testPolicy -Scope svm -IpSpaceName Default -Vserver vs0
Name         : testPolicy
Scope        : svm
IpSpace      : DataONTAP.C.Types.Net.Ipspace
IsBuiltIn    : False
NcController : 172.26.206.81
Services     : {}
Svm          : DataONTAP.C.Types.Net.Svm
Uuid         : d04b00c8-a300-11ec-a6ff-d039ea03b6f2

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

#### **IpSpaceName**
Name of IpSpace.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Services**
Ip Services.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|SvmName|

#### **IpSpace**
To instantiate, use New-Object DataONTAP.C.Types.Net.Ipspace.

|Type                             |Required|Position|PipelineInput        |
|---------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Net.Ipspace]`|false   |named   |true (ByPropertyName)|

#### **Svm**
To instantiate, use New-Object DataONTAP.C.Types.Net.Svm.

|Type                         |Required|Position|PipelineInput        |
|-----------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Net.Svm]`|false   |named   |true (ByPropertyName)|

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
New-NcNetServicePolicy [[-Name] <String>] [[-Scope] <String>] [-IpSpaceName <String>] [-Services <string[]>] [-Vserver <String>] [-Uuid <String>] [-IpSpace <DataONTAP.C.Types.Net.Ipspace>] 
```
```PowerShell
[-Svm <DataONTAP.C.Types.Net.Svm>] [<CommonParameters>]
```
