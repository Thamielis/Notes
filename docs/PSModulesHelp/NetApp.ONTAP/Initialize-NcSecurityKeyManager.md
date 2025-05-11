Initialize-NcSecurityKeyManager
-------------------------------

### Synopsis
Configure key manager connectivity

---

### Description

Configure key manager connectivity

---

### Related Links
* [Get-NcSecurityKeyManager](Get-NcSecurityKeyManager)

---

### Examples
> Example 1

```PowerShell
Initialize-NcSecurityKeyManager -BootAddressV6 fcd0::12ab
Initialize security key manager for the first time

cmdlet Initialize-NcSecurityKeyManager at command pipeline position 1
Supply values for the following parameters:
(Type !? for Help.)
BootPrefixlen: 15
BootGatewayV6: cdef::0010

```

---

### Parameters
#### **Node**
Node Name

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |1       |true (ByPropertyName)|NodeName|

#### **BootInterface**
Physical Interface Used to Contact Key Server

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **BootPort**
TCP Port for the Key Server

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt16]`|false   |3       |true (ByPropertyName)|

#### **BootAddressV4**
Key Manager Boot Node IPv4 Address. If this is specified, BootGatewayV4 and BootNetmask must be specified as well.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BootAddressV6**
Key Manager Boot Node IPv6 Address. If this is specified, BootGatewayV6 and BootPrefixlen must be specified as well.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **OnboardPassphrase**
Onboard Key Manager Cluster-wide Passphrase.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **UseExternalUsb**
Use external USB for Onboard Key Storage
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **CcModeEnabled**
Enable Common Criteria Mode?
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **SyncMetroclusterConfig**
Sync MetroCluster Configuration from Peer.
This parameter is available in ONTAP 9.5 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: security key manager
API: security-key-manager-setup
Family: cluster

---

### Syntax
```PowerShell
Initialize-NcSecurityKeyManager [[-Node] <String>] [[-BootInterface] <String>] [[-BootPort] <UInt16>] [-BootAddressV4 <String>] [-BootAddressV6 <String>] [-OnboardPassphrase <String>] 
```
```PowerShell
[-UseExternalUsb <Boolean>] [-CcModeEnabled <Boolean>] [-SyncMetroclusterConfig <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [<CommonParameters>]
```
