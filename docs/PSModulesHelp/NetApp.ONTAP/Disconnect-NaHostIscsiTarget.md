Disconnect-NaHostIscsiTarget
----------------------------

### Synopsis
Disconnect the host from an iSCSI target.

---

### Description

Disconnect the host from an iSCSI target.

---

### Related Links
* [Get-NaHostIscsiSession](Get-NaHostIscsiSession)

* [Get-NaHostIscsiTarget](Get-NaHostIscsiTarget)

* [Connect-NaHostIscsiTarget](Connect-NaHostIscsiTarget)

---

### Examples
> Example 1

```PowerShell
Disconnect-NaHostIscsiTarget iqn.1992-08.com.netapp:sn.135107386
Disconnect the target with an Iqn of iqn.1992-08.com.netapp:sn.135107386
```
> Example 2

```PowerShell
Get-NaHostIscsiTarget | where {$_.IsConnected} | Disconnect-NaHostIscsiTarget
Disconnect all currently connected targets.
```

---

### Parameters
#### **SessionId**
The SessionId of the session to disconnect.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TargetName**
The Iqn of the target to disconnect.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: host

---

### Syntax
```PowerShell
Disconnect-NaHostIscsiTarget [-SessionId <String>] [-TargetName] <String> [<CommonParameters>]
```
