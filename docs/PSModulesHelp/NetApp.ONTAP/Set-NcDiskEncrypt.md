Set-NcDiskEncrypt
-----------------

### Synopsis
Alters encryption parameters on one or more self-encrypting disks (SEDs).

---

### Description

Alters encryption parameters on one or more self-encrypting disks (SEDs). The successful completion of this cmdlet only indicates the operation has started. Monitor operation progress using the Get-NcDiskEncryptStatus cmdlet

---

### Related Links
* [Get-NcDiskEncrypt](Get-NcDiskEncrypt)

* [Get-NcDiskEncryptStatus](Get-NcDiskEncryptStatus)

---

### Parameters
#### **Disk**
Name of one or more self-encrypting disks (SED). Data ONTAP wildcards permitted.

|Type        |Required|Position|PipelineInput        |Aliases          |
|------------|--------|--------|---------------------|-----------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|DiskName<br/>Name|

#### **DataKeyId**
Key ID of the new authentication key. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FipsKeyId**
Key ID of the new authentication key for FIPS Compliance. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **EncryptionOperation**
Name of the operation to apply to encrypting disks. This parameter is supported with Rest only.
Valid Values:

* rekey_data_default
* rekey_data_auto_id
* sanitize_disk

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set. This parameter is supported with Ontapi only.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[DiskEncryptInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.DiskEncrypt.DiskEncryptInfo

---

### Notes
Category: Disk Encrypt
API: disk-encrypt-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Set-NcDiskEncrypt [-Disk] <String[]> [-DataKeyId <String>] [-FipsKeyId <String>] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskEncrypt -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Set-NcDiskEncrypt -Query <DiskEncryptInfo> [-DataKeyId <String>] [-FipsKeyId <String>] [-EncryptionOperation <String>] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount 
```
```PowerShell
<Int32>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
