Remove-NaHostIscsiConnection
----------------------------

### Synopsis
Remove a connection from an iSCSI session.

---

### Description

Remove a connection from an iSCSI session.

---

### Related Links
* [Add-NaHostIscsiConnection](Add-NaHostIscsiConnection)

---

### Examples
> Example 1

Remove-NaHostIscsiConnection -ConnectionId fffffa800a2d7428-000000000000623c -SessionId fffffa800a2d7428-4000013700000056
Remove the given connection from the given session.

SessionId                            TargetName                                     NumConnections           NumDevices
---------                            ----------                                     --------------           ----------
fffffa800a2d7428-4000013700000056    iqn.1992-08.com.netapp:sn.149c3db9b3c...                    2                    0

---

### Parameters
#### **SessionId**
Session ID from which to remove connection.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **ConnectionId**
Connection ID to remove.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
Remove-NaHostIscsiConnection [-SessionId] <String> [-ConnectionId] <String> [<CommonParameters>]
```
