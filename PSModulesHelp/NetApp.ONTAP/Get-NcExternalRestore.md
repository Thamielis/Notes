Get-NcExternalRestore
---------------------

### Synopsis
Restore the key IDs from all the key management servers known to this cluster.

---

### Description

Restore the key IDs from all the key management servers known to this cluster.

---

### Parameters
#### **NodeName**
The node name.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
The Vserver name.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **KeyServer**
The key server from which the key was restored.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **KeyId**
The ID of the restored key.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **KeyTag**
The tag of the restored key.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

#### **Attributes**

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[KeyManagerExternalRestore]`|false   |named   |false        |

#### **VserverContext**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[KeyManagerExternalRestore]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: security-key-manager
API: external-restore-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcExternalRestore [[-NodeName] <String[]>] [[-Vserver] <String[]>] [[-KeyServer] <String[]>] [[-KeyId] <String[]>] [[-KeyTag] <String[]>] [-Attributes <KeyManagerExternalRestore>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcExternalRestore -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcExternalRestore -Query <KeyManagerExternalRestore> [-Attributes <KeyManagerExternalRestore>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
