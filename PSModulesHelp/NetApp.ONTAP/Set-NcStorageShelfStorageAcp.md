Set-NcStorageShelfStorageAcp
----------------------------

### Synopsis
Configure connection.

---

### Description

Configure connection to storage shelf acp.

---

### Related Links
* [Get-NcStorageShelfAcp](Get-NcStorageShelfAcp)

* [Get-NcStorageShelfAcpModule](Get-NcStorageShelfAcpModule)

---

### Examples
> Example 1

Set-NcStorageShelfStorageAcp -IsEnabled $true
Enable storage shelf acp

-

---

### Parameters
#### **IsEnabled**
The state to which the connection needs to be configured

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|true    |1       |true (ByPropertyName)|

#### **Subnet**
The subnet that the configuration will use to setup connection

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Netmask**
The netmask that the configuration will use to setup connection

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Channel**
The channel to which the connection needs to be configured.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: ses
API: storage-shelf-storage-acp-configure
Family: cluster

---

### Syntax
```PowerShell
Set-NcStorageShelfStorageAcp [-IsEnabled] <Boolean> [[-Subnet] <String>] [[-Netmask] <String>] [-Channel <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
