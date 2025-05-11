Get-PageUrls
------------

### Synopsis
Parse all of the URLs out of a given file.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PageUrls microsoft.html http://www.microsoft.com
Gets all of the URLs from HTML stored in microsoft.html, and converts relative
URLs to the domain of http://www.microsoft.com
```
> EXAMPLE 2

```PowerShell
Get-PageUrls microsoft.html http://www.microsoft.com 'aspx$'
Gets all of the URLs from HTML stored in microsoft.html, converts relative
URLs to the domain of http://www.microsoft.com, and returns only URLs that end
in 'aspx'.
```

---

### Parameters
#### **Path**
The filename to parse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **BaseUrl**
The URL from which you downloaded the page.
For example, http://www.microsoft.com

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Images**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Pattern**
The Regular Expression pattern with which to filter
the returned URLs

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
Get-PageUrls [-Path] <String> [-BaseUrl] <String> [-Images] [[-Pattern] <String>] [<CommonParameters>]
```
