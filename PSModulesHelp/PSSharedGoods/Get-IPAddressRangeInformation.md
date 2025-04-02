Get-IPAddressRangeInformation
-----------------------------

### Synopsis
Provides information about IP Address range

---

### Description

Provides information about IP Address range

---

### Examples
> EXAMPLE 1

```PowerShell
$CidrObject = @{
    Ip            = '10.2.10.0'
    NetworkLength = 24
}
Get-IPAddressRangeInformation -CIDRObject $CidrObject | Format-Table
```
> EXAMPLE 2

```PowerShell
Get-IPAddressRangeInformation -Network '10.2.10.0/24' | Format-Table
```
> EXAMPLE 3

```PowerShell
Get-IPAddressRangeInformation -IPAddress '10.2.10.0' -NetworkLength 24 | Format-Table
```

---

### Parameters
#### **Network**
Network in form of IP/NetworkLength (e.g. 10.2.10.0/24')

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **IPAddress**
IP Address to use

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **NetworkLength**
Network length to use

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **CIDRObject**
CIDRObject to use

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|true    |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-IPAddressRangeInformation -Network <String> [<CommonParameters>]
```
```PowerShell
Get-IPAddressRangeInformation -IPAddress <String> -NetworkLength <Int32> [<CommonParameters>]
```
```PowerShell
Get-IPAddressRangeInformation -CIDRObject <PSObject> [<CommonParameters>]
```
