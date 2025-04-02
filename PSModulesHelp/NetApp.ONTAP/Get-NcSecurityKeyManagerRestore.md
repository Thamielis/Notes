Get-NcSecurityKeyManagerRestore
-------------------------------

### Synopsis
Restore the authentication passphrase and key ID pairs from all the key managers known to this cluster.

---

### Description

Restore the authentication passphrase and key ID pairs from all the key managers known to this cluster.

---

### Related Links
* [Get-NcSecurityKeyManager](Get-NcSecurityKeyManager)

* [Get-NcSecurityKeyManagerKeys](Get-NcSecurityKeyManagerKeys)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityKeyManagerRestore
Get all authentication keys restored.

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

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[KeyManagerRestoreInfo]`|false   |named   |false        |

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

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[KeyManagerRestoreInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecurityKeyManager.KeyManagerRestoreInfo

---

### Notes
Category: security key manager
API: security-key-manager-restore-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecurityKeyManagerRestore [-Node <String[]>] [-KeyManagerIPAddress <String[]>] [-Attributes <KeyManagerRestoreInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityKeyManagerRestore -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityKeyManagerRestore -Query <KeyManagerRestoreInfo> [-Attributes <KeyManagerRestoreInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
