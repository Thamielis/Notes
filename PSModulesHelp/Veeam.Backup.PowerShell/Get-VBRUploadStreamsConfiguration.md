Get-VBRUploadStreamsConfiguration
---------------------------------

### Synopsis
Returns details on data transfer settings for job sessions.

---

### Description

This cmdlet returns the VBRUploadStreamsConfiguration object. This object contains the following details on data transfer settings for job sessions:
- State: specifies the state of the multithreaded data transfer option. It can be either enabled (True) or disabled (False).
- StreamCount: specifies the number of TCP/IP connections per job session.

---

### Examples
> Getting Details on Data Transfer Settings

Get-VBRUploadStreamsConfiguration
             Enabled                  StreamCount
             -------                  -----------
                True                            5
This command returns the following details on data transfer settings for job sessions:
- The multithreaded data transfer option is enabled.
- The number of TCP/IP connections per job is set to five.

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRUploadStreamsConfiguration [<CommonParameters>]
```
