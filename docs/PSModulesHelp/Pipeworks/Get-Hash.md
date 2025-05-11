Get-Hash
--------

### Synopsis
Gets a hash for an object

---

### Description

Gets a unique hash for an object

---

### Related Links
* [Write-PowerShellHashtable](Write-PowerShellHashtable)

---

### Examples
> EXAMPLE 1

```PowerShell
1..10 | Get-Hash
```
> EXAMPLE 2

```PowerShell
dir | Get-Hash
```

---

### Parameters
#### **InputObject**
The input object

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |1       |true (ByValue)|

#### **Algorithm**
The algorithm to use.  By default, MD5
Valid Values:

* MD5
* SHA1
* SHA256
* SHA384
* SHA512
* HMAC

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **OutputObject**
If set, will output an object containing the input, hash, and algorithm

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsByte**
If set, will output the hash bytes, instead of the hexadecimal encoding of the bytes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

* [Byte[]](https://learn.microsoft.com/en-us/dotnet/api/System.Byte[])

* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-Hash [-InputObject] <PSObject> [[-Algorithm] <String>] [-OutputObject] [-AsByte] [<CommonParameters>]
```
