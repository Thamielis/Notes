Update-DSEntryBase
------------------

### Synopsis
Update an entry.

---

### Description

Update an entry (Modified entry should be in jsonBody). Unless you know exactly what you are doing, you should probably use the CMDlets created by us to update entries.

---

### Related Links
* [Get-DSEntry](Get-DSEntry)

* [Update-DSRDPEntry](Update-DSRDPEntry)

* [Update-DSSSHShellEntry](Update-DSSSHShellEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $credResponse = Get-DSEntry -EntryID $id
        $cred = $credResponse.data
        $cred.data.passwordItem | Add-Member -MemberType NoteProperty -Name SensitiveData -Value 'newPassword'
        Update-DSEntryBase -JsonBody (ConvertTo-Json -InputObject $cred -Depth 4)
An existing credential entry with an existing password is fetched. Its password is changed to 'newPassword' by adding a sensitive data property to passwordItem. The entry is converted in json with the requiered depth to avoid being flatten. The entry is updated afterwards.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FromRDMConnection**
Entry obtained from Get-DSEntry -AsRDMConnection. It can be used to update an entry

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[ConnectionInfoEntity]`|true    |1       |false        |

#### **JsonBody**
Entry in JSON

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Update-DSEntryBase -detailed". For technical information, type "Get-Help Update-DSEntryBase -full".

---

### Syntax
```PowerShell
Update-DSEntryBase [-JsonBody] <String> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Update-DSEntryBase [-FromRDMConnection] <ConnectionInfoEntity> [-AsLegacyResponse] [<CommonParameters>]
```
