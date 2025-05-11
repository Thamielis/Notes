Get-FTP
-------

### Synopsis
Gets files from FTP

---

### Description

Lists files on an FTP server, or downloads files

---

### Related Links
* [Push-FTP](Push-FTP)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FTP -FTP "ftp://edgar.sec.gov/edgar/full-index/1999/" -Download -Filter "*.idx", "*.xml"
```
> EXAMPLE 2

```PowerShell
Get-FTP -FTP "ftp://edgar.sec.gov/edgar/full-index/1999/" -Download -Filter "*.idx", "*.xml"  -DownloadAsJob
```

---

### Parameters
#### **FtpRoot**
The root url of an FTP server

|Type   |Required|Position|PipelineInput        |Aliases|
|-------|--------|--------|---------------------|-------|
|`[Uri]`|true    |1       |true (ByPropertyName)|FTP    |

#### **FtpFile**
A list of specific files on an FTP server.  Useful for when dealing with FTP servers that do not allow listing.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Uri[]]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Credential**
The credential used to connect to FTP.  If not provided, will connect anonymously.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|false   |named   |true (ByPropertyName)|

#### **Download**
If set, will download files instead of discover them

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **DownloadPath**
The download path (by default, the downloads directory)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Filter**
If provided, will only download files that match the filter

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Force**
If set, will download files that already have been downloaded and have the exact same file size.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **DownloadAsJob**
If set, downloads will run as a background job

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **UseWorkflow**
If set, downloads will be run in parallel in a PowerShell workflow

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **HideProgress**
If set, download progress will not be displayed

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **BufferSize**
The size of the copy buffer.  By default, this is 50kb

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

---

### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)

---

### Syntax
```PowerShell
Get-FTP [-FtpRoot] <Uri> [-Credential <PSCredential>] [-Download] [-DownloadPath <String>] [[-Filter] <String[]>] [-Force] [-DownloadAsJob] [-UseWorkflow] [-HideProgress] [-BufferSize <UInt32>] [<CommonParameters>]
```
```PowerShell
Get-FTP [-FtpFile] <Uri[]> [-Credential <PSCredential>] [-DownloadPath <String>] [-DownloadAsJob] [-UseWorkflow] [-HideProgress] [-BufferSize <UInt32>] [<CommonParameters>]
```
