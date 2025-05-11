Set-NcNetServicePolicy
----------------------

### Synopsis
Updates a service policy for network interfaces.

---

### Description

Updates a service policy for network interfaces.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcNetServicePolicy](Get-NcNetServicePolicy)

* [New-NcNetServicePolicy](New-NcNetServicePolicy)

* [Remove-NcNetServicePolicy](Remove-NcNetServicePolicy)

---

### Examples
> Example 1

```PowerShell
Set-NcNetServicePolicy -Name testPolicy -Scope cluster -IpSpaceName Default -Services intercluster_core
Name         : testPolicy
Scope        : cluster
Services     : {intercluster_core}
IpSpace      : DataONTAP.C.Types.Net.Ipspace
IsBuiltIn    : False
NcController : 172.26.206.81
Svm          :
Uuid         : f379e490-a921-11ec-8765-d039ea03b6f2

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetServicePolicy

---

### Notes
Category: Net
Api: /network/ip/service-policies/{uuid}
Family: Controller

---

### Syntax
```PowerShell
Set-NcNetServicePolicy [[-Name] <String>] [[-Scope] <String>] [-IpSpaceName <String>] [-Services <string[]>] [-Vserver <String>] [<CommonParameters>]
```
