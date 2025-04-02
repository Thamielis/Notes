Get-NcSecurityKeyManagerRestoreV2
---------------------------------

### Synopsis
Restore the key IDs from the specified key management server for the specified node. Deprecated as of ONTAP 9.6 and may be removed in a future release.

---

### Description

Restore the key IDs from the specified key management server for the specified node. Deprecated as of ONTAP 9.6 and may be removed in a future release.

---

### Parameters
#### **NodeName**
Node

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **KeyManagerIpAddress**
IP Address

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **KeyTag**
Key Tag

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **KeyId**
Key ID

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[KeyManagerRestoreInfoV2]`|false   |named   |false        |

#### **Controller**

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[KeyManagerRestoreInfoV2]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: security key manager
API: security-key-manager-restore-v2-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecurityKeyManagerRestoreV2 [[-NodeName] <String[]>] [[-KeyManagerIpAddress] <String[]>] [[-KeyTag] <String[]>] [[-KeyId] <String[]>] [-Attributes <KeyManagerRestoreInfoV2>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityKeyManagerRestoreV2 -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityKeyManagerRestoreV2 -Query <KeyManagerRestoreInfoV2> [-Attributes <KeyManagerRestoreInfoV2>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
