Get-NcProtocolS3ServicesPolicy
------------------------------

### Synopsis
Retrieves the S3 policies SVM configuration.This cmdlet is supported with Rest.

---

### Description

Get a list of S3 policies SVM configuration.

---

### Related Links
* [New-NcProtocolS3ServicesPolicy](New-NcProtocolS3ServicesPolicy)

---

### Examples
> Example 1

```PowerShell
Get-NcProtocolS3ServicesPolicy
Retrieves all the S3 policies SVM configuration..

NcController : 10.236.154.100
Name         : Policy1
Comment      : S3 policy.
ReadOnly     : False
Statements   : {FullAccessToBucket1}
SvmName      : vs0
SvmUuid      : c78011e8-bc7c-11ec-8d87-005056a7b9f3

```

---

### Parameters
#### **Name**
Specifies the name of the policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Comment**
Can contain any additional information about the S3 policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vservers.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|SvmName|

#### **Attributes**
For improved scalability in large clusters, provide a ProtocolS3ServicesPoliciesOutput object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcProtocolS3ServicesPolicy -Template" to get the initially empty ProtocolS3ServicesPoliciesOutput object.  If not specified, all data is returned for each object.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[ProtocolS3ServicesPoliciesOutput]`|false   |named   |false        |

#### **Template**
Specify to get an empty ProtocolS3ServicesPoliciesOutput object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ProtocolS3ServicesPoliciesOutput object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcProtocolS3ServicesPolicy -Template" to get the initially empty ProtocolS3ServicesPoliciesOutput object.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[ProtocolS3ServicesPoliciesOutput]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3ServicesPoliciesOutput

---

### Notes
Category: S3
API: protocols/s3/services/{svm.uuid}/policies
Family: cluster

---

### Syntax
```PowerShell
Get-NcProtocolS3ServicesPolicy [[-Name] <String>] [[-Vserver] <String>] [-Comment <String>] [-ReadOnly <Boolean>] [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesPolicy -Template [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesPolicy -Query <ProtocolS3ServicesPoliciesOutput> [-Attributes <ProtocolS3ServicesPoliciesOutput>] [<CommonParameters>]
```
