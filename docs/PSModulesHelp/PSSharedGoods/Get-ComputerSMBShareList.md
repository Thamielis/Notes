Get-ComputerSMBShareList
------------------------

### Synopsis
Enumerate shares on a remote or local host and returns the name, type, and special remark for those shares.

---

### Description

Enumerate shares on a remote or local host and returns the name, type, and special remark for those shares.
Doesnt return the permissions on the share, or logging to given computer
Similar to 'net view /All \\ComputerName'

---

### Related Links
* [https://gist.github.com/jborean93/017d3d890ae8d33276a08d3f5cc7eb45](https://gist.github.com/jborean93/017d3d890ae8d33276a08d3f5cc7eb45)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerSMBShareList -ComputerName some-host
```
> EXAMPLE 2

```PowerShell
Get-ComputerSMBShareList -ComputerName "DC1" | ft -AutoSize
```

---

### Parameters
#### **ComputerName**
The host to enumerate the shares for. Can be accepted as pipeline input by value.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **InputObject**

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|false   |named   |true (ByValue)|

#### **Name**
The name of the share to filter on. Can be accepted as pipeline input by value.

|Type        |Required|Position|PipelineInput|Aliases  |
|------------|--------|--------|-------------|---------|
|`[String[]]`|false   |2       |false        |ShareName|

#### **SkipDiskSpace**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [PSCustomObject]@{
    ComputerName = [String]'The computer the share relates to'
    Name = [String]'The name of the share'
    Path = [string]'\\ComputerName\Name\'
    Type = [Win32Share.ShareType] An flag enum of the share properties, can be
        Disk = Disk drive share
        PrintQueue = Print queue share
        CommunicationDevice = Communication device share
        Ipc = Interprocess communication share
        Temporary = A temporary share
        Special = Typically a special/admin share like IPC$, C$, ADMIN$
    Remark = [String]'More info on the share'
    TotalBytes = [System.Nullable[int]]
    TotalFreeBytes = [System.Nullable[int]]
    FreeBytesAvailableToUser = [System.Nullable[int]]
}

---

### Notes
Original author: Jordan Borean (@jborean93)

Modified by: Matt Cargile (@mattcargile)
Modified by: Przemyslaw Klys

---

### Syntax
```PowerShell
Get-ComputerSMBShareList [-ComputerName] <String[]> [[-Name] <String[]>] [-SkipDiskSpace] [<CommonParameters>]
```
```PowerShell
Get-ComputerSMBShareList [-InputObject <String>] [-Name <String[]>] [-SkipDiskSpace] [<CommonParameters>]
```
