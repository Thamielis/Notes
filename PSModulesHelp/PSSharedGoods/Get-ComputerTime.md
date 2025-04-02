Get-ComputerTime
----------------

### Synopsis
Gets time difference between computers and time source including boot time

---

### Description

Gets time difference between computers and time source including boot time

---

### Examples
> EXAMPLE 1

Get-ComputerTime -TimeTarget AD2, AD3, EVOWin | Format-Table -AutoSize
Output

Name   LocalDateTime       RemoteDateTime      InstallTime         LastBootUpTime      TimeDifferenceMinutes TimeDifferenceSeconds TimeDifferenceMilliseconds TimeSourceName
----   -------------       --------------      -----------         --------------      --------------------- --------------------- -------------------------- --------------
AD2    13.08.2019 23:40:26 13.08.2019 23:40:26 30.05.2018 18:30:48 09.08.2019 18:40:31  8,33333333333333E-05                 0,005                          5 AD1.ad.evotec.xyz
AD3    13.08.2019 23:40:26 13.08.2019 17:40:26 26.05.2019 17:30:17 09.08.2019 18:40:30  0,000266666666666667                 0,016                         16 AD1.ad.evotec.xyz
EVOWin 13.08.2019 23:40:26 13.08.2019 23:40:26 24.05.2019 22:46:45 09.08.2019 18:40:06  6,66666666666667E-05                 0,004                          4 AD1.ad.evotec.xyz
> EXAMPLE 2

```PowerShell
Get-ComputerTime -TimeSource AD1 -TimeTarget AD2, AD3, EVOWin | Format-Table -AutoSize
```
> EXAMPLE 3

```PowerShell
Get-ComputerTime -TimeSource 'pool.ntp.org' -TimeTarget AD2, AD3, EVOWin | Format-Table -AutoSize
```

---

### Parameters
#### **TimeSource**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Domain**
Parameter description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **TimeTarget**
Specifies computer on which you want to run the CIM operation. You can specify a fully qualified domain name (FQDN), a NetBIOS name, or an IP address. If you do not specify this parameter, the cmdlet performs the operation on the local computer using Component Object Model (COM).

|Type        |Required|Position|PipelineInput|Aliases     |
|------------|--------|--------|-------------|------------|
|`[String[]]`|false   |3       |false        |ComputerName|

#### **Credential**
Specifies a user account that has permission to perform this action. The default is the current user.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |4       |false        |

#### **ForceCIM**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-ComputerTime [[-TimeSource] <String>] [[-Domain] <String>] [[-TimeTarget] <String[]>] [[-Credential] <PSCredential>] [-ForceCIM] [<CommonParameters>]
```
