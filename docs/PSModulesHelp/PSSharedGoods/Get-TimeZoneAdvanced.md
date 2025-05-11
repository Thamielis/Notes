Get-TimeZoneAdvanced
--------------------

### Synopsis
Retrieves the time zone information for the specified computer(s).

---

### Description

This function retrieves the time zone information for the specified computer(s) including the computer name, time zone caption, and current local time.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-TimeZoneAdvanced
# Retrieves time zone information for the local computer.
```
> EXAMPLE 2

```PowerShell
Get-TimeZoneAdvanced -ComputerName "Server01", "Server02" -Credential $cred
# Retrieves time zone information for Server01 and Server02 using specified credentials.
```

---

### Parameters
#### **ComputerName**
Specifies the name(s) of the computer(s) to retrieve the time zone information from. Default is the local computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Credential**
Specifies the credentials to use for accessing remote computers.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-TimeZoneAdvanced [[-ComputerName] <String[]>] [[-Credential] <PSCredential>] [<CommonParameters>]
```
