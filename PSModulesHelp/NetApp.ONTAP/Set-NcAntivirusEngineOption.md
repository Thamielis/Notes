Set-NcAntivirusEngineOption
---------------------------

### Synopsis
Modify the attributes of antivirus engine options.

---

### Description

Modify the attributes of antivirus engine options.

---

### Related Links
* [Get-NcAntivirusEngineOption](Get-NcAntivirusEngineOption)

---

### Examples
> Example 1

```PowerShell
Set-NcAntivirusEngineOption -HeuristicAnalysis $true -MacroAnalysis $true
Set the HeuristicAnalysis and MacroAnalysis engine options.
```

---

### Parameters
#### **GroupArchiveUnpack**
If true, scan archive file formats.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MaxRecursionDepth**
Max recursion depth into archives.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **HeuristicAnalysis**
If true, heuristic virus search analysis.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MacroAnalysis**
If true, macro virus search analysis.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ScanMime**
If true, scan MIME-encoded files.

|Type       |Required|Position|PipelineInput        |Aliases |
|-----------|--------|--------|---------------------|--------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|ScanMine|

#### **MimeLinesToScan**
Max lines to scan to identify MIME file.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **CacheSize**
Max cache size for scanning files.
Specify the cache size using the following format:
<number>[k|m|g|t]

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProxyHost**
proxy server name e.g. http://proxy_server_name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProxyPort**
Proxy server port number.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **ProxyLogin**
Proxy server login.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProxyPassword**
Proxy server password.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DecompressedFileCountLimit**
File count to decompress in archive.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **DecompressedFileSizeLimit**
Max size of files in archive.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Decimal]`|false   |named   |true (ByPropertyName)|

#### **DecompressionLayersLimit**
Max layers to traverse in archive.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **DecompressionSizeFactor**
Max decompression size factor of files in archive.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **IsSpywareEnabled**
Spyware enable/disable.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Antivirus.AvEngineOption

---

### Notes
Category: antivirus
API: av-set-engine-options
Family: cluster

---

### Syntax
```PowerShell
Set-NcAntivirusEngineOption [-GroupArchiveUnpack <Boolean>] [-MaxRecursionDepth <Int64>] [-HeuristicAnalysis <Boolean>] [-MacroAnalysis <Boolean>] [-ScanMime <Boolean>] [-MimeLinesToScan 
```
```PowerShell
<Int64>] [-CacheSize <String>] [-ProxyHost <String>] [-ProxyPort <Int64>] [-ProxyLogin <String>] [-ProxyPassword <String>] [-DecompressedFileCountLimit <Int64>] [-DecompressedFileSizeLimit 
```
```PowerShell
<Decimal>] [-DecompressionLayersLimit <Int64>] [-DecompressionSizeFactor <Int64>] [-IsSpywareEnabled <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
