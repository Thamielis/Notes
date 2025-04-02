Add-NaHostIscsiConnection
-------------------------

### Synopsis
Add a connection to an existing iSCSI session.

---

### Description

Add a connection to an existing iSCSI session.

---

### Related Links
* [Remove-NaHostIscsiConnection](Remove-NaHostIscsiConnection)

---

### Examples
> Example 1

Add-NaHostIscsiConnection -SessionId fffffa800a2d7428-4000013700000056
Add a connection to the given session.

SessionId                            TargetName                                     NumConnections           NumDevices
---------                            ----------                                     --------------           ----------
fffffa800a2d7428-4000013700000056    iqn.1992-08.com.netapp:sn.149c3db9b3c...                    3                    0

---

### Parameters
#### **SessionId**
Session ID to add connection.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **TargetIp**
IP address of the target portal to connect to.  If not specified, the default IP address will be used.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TargetPort**
The target port to connect to.  The default is 3260.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt16]`|false   |named   |true (ByPropertyName)|

#### **InitiatorIp**
IP address the initiator should use to connect to the target.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HeaderDigest**
If specified, header digest will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DataDigest**
If specified, data digest will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Credential**
The CHAP username/password to use to authenticate the target.  If not specified, no authentication will be used when connecting to the target.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

#### **MutualChap**
If specified, mutual CHAP will be used.  To use mutual CHAP, an initiator CHAP secret must be set on the Configuration page of the iSCSI Initiator Properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RadiusVerify**
If specified, use RADIUS to authenticate target credentials.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RadiusGenerate**
If specified, use RADIUS to generate user authentication credentials.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.Toolkit.Windows.IscsiSessionInfo

---

### Notes
Category: host

---

### Syntax
```PowerShell
Add-NaHostIscsiConnection [-SessionId] <String> [-TargetIp <String>] [-TargetPort <UInt16>] [-InitiatorIp <String>] [-HeaderDigest] [-DataDigest] [<CommonParameters>]
```
```PowerShell
Add-NaHostIscsiConnection [-SessionId] <String> [-TargetIp <String>] [-TargetPort <UInt16>] [-InitiatorIp <String>] [-Credential <PSCredential>] [-MutualChap] [-HeaderDigest] [-DataDigest] 
```
```PowerShell
[-RadiusVerify] [<CommonParameters>]
```
```PowerShell
Add-NaHostIscsiConnection [-SessionId] <String> [-TargetIp <String>] [-TargetPort <UInt16>] [-InitiatorIp <String>] [-MutualChap] [-HeaderDigest] [-DataDigest] [-RadiusGenerate] 
```
```PowerShell
[-RadiusVerify] [<CommonParameters>]
```
