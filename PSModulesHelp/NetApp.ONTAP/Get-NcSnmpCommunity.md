Get-NcSnmpCommunity
-------------------

### Synopsis
Retrieves the list of SNMP users on the cluster.

---

### Description

Retrieves the list of SNMP users on the cluster. This cmdlet is supported with Rest.

---

### Related Links
* [Add-NcSnmpCommunity](Add-NcSnmpCommunity)

* [Remove-NcSnmpCommunity](Remove-NcSnmpCommunity)

---

### Examples
> Example 1

Get-NcSnmpCommunity
Get all SNMP users for the current cluster.

Name            Scope      AuthenticationMethod      OwnerName
----            -----      --------------------      ---------
public          svm        community                 vs0
snmpuser        cluster    usm                       C1_sti9-vsim-ucs387e_1654597824

> Example 2

$q = Get-NcSnmpCommunity -Template
$q.Scope = "cluster"
Get-NcSnmpCommunity -Query $q
Get all SNMP users in the cluster for the given scope.

Name            Scope      AuthenticationMethod      OwnerName
----            -----      --------------------      ---------
public          cluster    community                 C1_sti9-vsim-ucs387e_1654597824
snmpuser        cluster    usm                       C1_sti9-vsim-ucs387e_1654597824

---

### Parameters
#### **Community**
SNMP user name

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |0       |true (ByPropertyName)|Name   |

#### **Scope**
Scope of SNMP use. Set to svm for data Storage Virtual Machine (SVM) SNMP users and to cluster for administrative SVM SNMP users. Possible values are: [svm, cluster]

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **VserverContext**
Name of Svm

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a RestSnmpCommunityInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSnmpCommunity -Template" to get the initially empty RestSnmpCommunityInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[RestSnmpCommunityInfo]`|false   |named   |false        |

#### **Template**
Specify to get an empty RestSnmpCommunityInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a RestSnmpCommunityInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnmpCommunity -Template" to get the initially empty RestSnmpCommunityInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[RestSnmpCommunityInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snmp.RestSnmpCommunityInfo

---

### Notes
Category: snmp
Api: /api/support/snmp/users
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnmpCommunity [[-Community] <String>] [[-Scope] <String>] [-VserverContext <String>] [<CommonParameters>]
```
```PowerShell
Get-NcSnmpCommunity -Template [<CommonParameters>]
```
```PowerShell
Get-NcSnmpCommunity -Query <RestSnmpCommunityInfo> [-Attributes <RestSnmpCommunityInfo>] [<CommonParameters>]
```
