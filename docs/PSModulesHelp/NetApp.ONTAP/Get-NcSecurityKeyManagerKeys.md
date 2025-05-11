Get-NcSecurityKeyManagerKeys
----------------------------

### Synopsis
Return the authentication passphrase and key ID pairs stored in all of the key managers known to the cluster and whether restored (present in the nodes' key tables).

---

### Description

Return the authentication passphrase and key ID pairs stored in all of the key managers known to the cluster and whether restored (present in the nodes' key tables).

---

### Related Links
* [Get-NcSecurityKeyManager](Get-NcSecurityKeyManager)

* [Get-NcSecurityKeyManagerRestore](Get-NcSecurityKeyManagerRestore)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityKeyManagerKeys
Get keys from all key managers on all nodes.

KeyIdCount          : 0
KeyIds              : 
KeyManagerIpAddress : 10.72.211.100
NcController        : 10.238.49.117
NodeName            : aparajir-vsim2
KeyIdCountSpecified : True

KeyIdCount          : 0
KeyIds              : 
KeyManagerIpAddress : 10.72.211.100
NcController        : 10.238.49.117
NodeName            : aparajir-vsim1
KeyIdCountSpecified : True

```

---

### Parameters
#### **Node**
Restrict results to the specified node(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                         |
|------------|--------|--------|---------------------|--------------------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Nodes<br/>NodeName<br/>NodeNames|

#### **KeyManagerIPAddress**
Restrict results to specified key manager(s).

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **KeyManagerServerStatus**
Restrict results to key manager(s) with specified status. Possible values : 'available', 'not_responding', 'unknown'

|Type        |Required|Position|PipelineInput        |Aliases                    |
|------------|--------|--------|---------------------|---------------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Status<br/>KeyManagerStatus|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[KeyManagerQueryInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[KeyManagerQueryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecurityKeyManager.KeyManagerQueryInfo

---

### Notes
Category: security key manager
API: security-key-manager-query-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecurityKeyManagerKeys [-Node <String[]>] [-KeyManagerIPAddress <String[]>] [-KeyManagerServerStatus <String[]>] [-Attributes <KeyManagerQueryInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityKeyManagerKeys -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityKeyManagerKeys -Query <KeyManagerQueryInfo> [-Attributes <KeyManagerQueryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
