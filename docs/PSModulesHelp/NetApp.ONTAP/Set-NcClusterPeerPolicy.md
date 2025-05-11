Set-NcClusterPeerPolicy
-----------------------

### Synopsis
Modify the cluster peering policy configuration.

---

### Description

Modify the cluster peering policy configuration.

---

### Related Links
* [Get-NcClusterPeerPolicy](Get-NcClusterPeerPolicy)

---

### Examples
> Example 1

```PowerShell
Set-NcClusterPeerPolicy -AllowUnauthenticatedAccess $true -MinPassphraseLength 10
Change the cluster peer policy to allow unauthenticated access and raise the minimum password length.

IsUnauthenticatedAccessPermitted          : True
NcController                              : 10.63.10.37
PassphraseMinimumLength                   : 10

```

---

### Parameters
#### **AllowUnauthenticatedAccess**
If true, unauthenticated communication between cluster peers is permitted.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MinPassphraseLength**
Minimum length for a passphrase.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **IsUnencryptedAccessPermitted**
Whether unauthenticated communication between cluster peers is permitted.  If true, unauthenticated communication between cluster peers is permitted.
This parameter is available in ONTAP 9.4 and later.

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

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterPeer.ClusterPeerPolicy

---

### Notes
Category: cluster peer
API: cluster-peer-policy-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcClusterPeerPolicy [-AllowUnauthenticatedAccess <Boolean>] [-MinPassphraseLength <Int32>] [-IsUnencryptedAccessPermitted <Boolean>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
