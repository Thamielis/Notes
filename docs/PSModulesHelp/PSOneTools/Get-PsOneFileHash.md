Get-PsOneFileHash
-----------------

### Synopsis
Calculates a unique hash value for file content and strings, and is capable of calculating partial hashes to speed up calculation for large content

---

### Description

Calculates a cryptographic hash for file content and strings to identify identical content. 
This can take a long time for large files since the entire file content needs to be read.
In most cases, duplicate files can safely be identified by looking at only part of their content.
By using parameters -StartPosition and -Length, you can define the partial content that should be used for hash calculation.
Any file or string exceeding the size specified in -Length plus -StartPosition will be using a partial hash
unless -Force is specified. This speeds up hash calculation tremendously, especially across the network.
It is recommended that partial hashes are verified by calculating a full hash once it matters.
So if indeed two large files share the same hash, you should use -Force to calculate their hash again.
Even though you need to calculate the hash twice, calculating a partial hash is very fast and makes sure
you calculate the expensive full hash only for files that have potential duplicates.

---

### Related Links
* [https://powershell.one](https://powershell.one)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PsOneFileHash -String "Hello World!" -Algorithm MD5
Calculates the hash for a string using the MD5 algorithm
```
> EXAMPLE 2

```PowerShell
Get-PSOneFileHash -Path "$home\Documents\largefile.mp4" -StartPosition 1000 -Length 1MB -Algorithm SHA1
Calculates the hash for the file content. If the file is larger than 1MB+1000, a partial hash is calculated,
starting at byte position 1000, and using 1MB of data
```
> EXAMPLE 3

```PowerShell
Get-ChildItem -Path $home -Recurse -File -ErrorAction SilentlyContinue | 
    Get-PsOnePartialFileHash -StartPosition 1KB -Length 1MB -BufferSize 1MB -AlgorithmName SHA1 |
    Group-Object -Property Hash, Length | 
    Where-Object Count -gt 1 |
    ForEach-Object {
        $_.Group | Select-Object -Property Length, Hash, Path
    } |
    Out-GridView -Title 'Potential Duplicate Files'
Takes all files from the user profile and calculates a hash for each. Large files use a partial hash.
Results are grouped by hash and length. Any group with more than one member contains potential
duplicates. These are shown in a gridview.
```

---

### Parameters
#### **Path**
path to file with hashable content

|Type      |Required|Position|PipelineInput                 |Aliases |
|----------|--------|--------|------------------------------|--------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|FullName|

#### **String**
path to file with hashable content

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **StartPosition**
byte position to start hashing

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Length**
bytes to hash. Larger length increases accuracy of hash.
Smaller length increases hash calculation performance

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **BufferSize**
internal buffer size to read chunks
a larger buffer increases raw reading speed but slows down
overall performance when too many bytes are read and increases
memory pressure
Ideally, length should be equally dividable by this

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **AlgorithmName**
hash algorithm to use. The fastest algorithm is SHA1. MD5 is second best
in terms of speed. Slower algorithms provide more secure hashes with a 
lesser chance of duplicates with different content
Valid Values:

* MD5
* SHA1
* SHA256
* SHA384
* SHA512

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[HashAlgorithmName]`|false   |named   |false        |

#### **Force**
overrides partial hashing and always calculates the full hash

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-PsOneFileHash [-Path] <String> [-StartPosition <Int32>] [-Length <Int64>] [-BufferSize <Int32>] [-AlgorithmName <HashAlgorithmName>] [-Force] [<CommonParameters>]
```
```PowerShell
Get-PsOneFileHash [-String] <String> [-StartPosition <Int32>] [-Length <Int64>] [-BufferSize <Int32>] [-AlgorithmName <HashAlgorithmName>] [-Force] [<CommonParameters>]
```
