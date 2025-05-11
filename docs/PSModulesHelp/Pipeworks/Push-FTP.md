Push-FTP
--------

### Synopsis
Pushes items to an FTP server

---

### Description

Pushes a directory to an FTP server

---

### Related Links
* [Get-FTP](Get-FTP)

---

### Examples
> EXAMPLE 1

```PowerShell
Push-Ftp -Path c:\Example -Include *.aspx
```

---

### Parameters
#### **Path**
The local path

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Include**
If set, will only include items that match the wildcard

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Exclude**
If set, will exclude items that match the wildcard

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **FTP**
The FTP server

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|true    |4       |true (ByPropertyName)|

#### **Credential**
The credentail used to connect to the FTP server

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|true    |5       |true (ByPropertyName)|

---

### Outputs
* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Push-FTP [-Path] <String> [[-Include] <String[]>] [[-Exclude] <String[]>] [-FTP] <Uri> [-Credential] <PSCredential> [<CommonParameters>]
```
