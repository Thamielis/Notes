Get-NcSecurityProtocol
----------------------

### Synopsis
Get the security protocol configuration

---

### Description

Get the security protocol configuration

---

### Examples
> Example 1

Get-NcSecurityProtocol -Application rsh
Gives the security protocol configuration for application rsh

Application                                         Enabled NcController                               EnabledSpecified
-----------                                         ------- ------------                               ----------------
rsh                                                   False 10.238.73.251                                          True

---

### Parameters
#### **Application**
Name of the application.Possible values: rsh, telnet

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP.

|Type                    |Required|Position|PipelineInput|Aliases          |
|------------------------|--------|--------|-------------|-----------------|
|`[SecurityProtocolInfo]`|false   |2       |false        |DesiredAttributes|

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
* DataONTAP.C.Types.Security.SecurityProtocolInfo

---

### Notes
Category: security
API: security-protocol-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecurityProtocol [-Application] <String> [[-Attributes] <SecurityProtocolInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
