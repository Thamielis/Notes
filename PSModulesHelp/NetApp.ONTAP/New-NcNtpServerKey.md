New-NcNtpServerKey
------------------

### Synopsis
Create an NTP symmetric authentication key.

---

### Description

Create an NTP symmetric authentication key.

---

### Examples
> Example 1

```PowerShell
New-NcNtpServerKey -Id 3 -Type sha1 -Value da39a3ee5e6b4b0d3255bfef95601890afd80709
Creates an NTP symmetric authentication key with Id 3 of type sha1.

Id           : 3
NcController : 10.236.44.243
Type         : sha1
Value        : da39a3ee5e6b4b0d3255bfef95601890afd80709
IdSpecified  : True

```

---

### Parameters
#### **Id**
NTP symmetric authentication key ID.  The ID must be in the range 1-65535.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |1       |true (ByPropertyName)|

#### **Type**
NTP symmetric authentication key type.  Only SHA1 currently
supported.
Possible values: 
<ul>
  <li> "sha1" 
</ul>

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Value**
NTP symmetric authentication key value.  The value must be exactly 40 hexadecimal digits for SHA1 keys.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
* DataONTAP.C.Types.NtpServer.NtpKeyInfo

---

### Notes
Category: ntp-server
API: ntp-server-key-create
Family: ontap-cluster

---

### Syntax
```PowerShell
New-NcNtpServerKey [-Id] <Int32> [-Type] <String> [-Value] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
