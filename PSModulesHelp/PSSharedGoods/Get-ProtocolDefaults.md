Get-ProtocolDefaults
--------------------

### Synopsis
Gets a list of default settings for SSL/TLS protocols

---

### Description

Gets a list of default settings for SSL/TLS protocols

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ProtocolDefaults -AsList | Format-Table
```
> EXAMPLE 2

```PowerShell
Get-ProtocolDefaults -WindowsVersion 'Windows 10 1809' | Format-Table
```

---

### Parameters
#### **WindowsVersion**
Windows Version to search for

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AsList**
If true, returns a list of protocol names for all Windows Versions, otherwise returns a single entry for the specified Windows Version

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Notes
Based on: https://docs.microsoft.com/en-us/windows/win32/secauthn/protocols-in-tls-ssl--schannel-ssp-

According to this https://github.com/MicrosoftDocs/windowsserverdocs/issues/2783 SCHANNEL service requires direct enablement so the list is kind of half useful

---

### Syntax
```PowerShell
Get-ProtocolDefaults -WindowsVersion <String> [<CommonParameters>]
```
```PowerShell
Get-ProtocolDefaults -AsList [<CommonParameters>]
```
