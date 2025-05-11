Get-Web
-------

### Synopsis
Gets content from the web, or parses web content.

---

### Description

Gets content from the web.  

If -Tag is passed, extracts out tags from within the document.

If -AsByte is passed, returns the response bytes

---

### Related Links
* [http://schema.org](http://schema.org)

---

### Examples
Download the Microsoft front page and extract out links

```PowerShell
Get-Web -Url http://microsoft.com/ -Tag a
```
Extract the rows from ConvertTo-HTML

```PowerShell
$text = Get-ChildItem | Select Name, LastWriteTime | ConvertTo-HTML | Out-String 
Get-Web "tr" $text
```
Extract all PHP elements from a directory of .php scripts

```PowerShell
Get-ChildItem -Recurse -Filter *.php | 
    Get-Web -Tag .\?php, \?
```
Extract all asp tags from .asp files

```PowerShell
Get-ChildItem -Recurse | 
    Where-Object { '.aspx', '.asp'. '.ashx' -contains $_.Extension } |
    Get-Web -Tag .\%
```
Get a list of all schemas from schema.org

```PowerShell
$schemasList = Get-Web -Url http://schema.org/docs/full.html -Tag a | 
    Where-Object { $_.Xml.href -like '/*' } | 
    ForEach-Object { "http://schema.org" + $_.xml.Href }
```
Extract out the example of a schema from schema.org

```PowerShell
$schema = 'http://schema.org/Event'
Get-Web -Url $schema -Tag pre | 
    Where-Object { $_.Xml.Class -like '*prettyprint*' }  | 
    ForEach-Object {
        Get-Web -Html $_.Xml.InnerText -AsMicrodata -ItemType $schema 
    }
```
List the top 1000 sites on the web:

```PowerShell
Get-Web "http://www.google.com/adplanner/static/top1000/" -Tag 'a' | 
    where-Object {$_.Tag -like "*_blank*" }  | 
    ForEach-Object {
        ([xml]$_.StartTag.Replace('"t', '" t')).a.href
    }
```

---

### Parameters
#### **Tag**
The tags to extract.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **TextInTag**
If used with -Tag, -RequireAttribute will only match tags with a given keyword in the tag

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Html**
The source HTML.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Url**
The Url

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Uri    |

#### **Root**
The root of the website.  
All images, css, javascript, related links, and pages beneath this root will be downloaded into a hashtable

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Parameter**
Any parameters to the URL

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |2       |true (ByPropertyName)|

#### **FileName**
Filename

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|Fullname|

#### **UserAgent**
The User Agent

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **HideProgress**
If set, will not show progress for long-running operations

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsByte**
If set, returns resutls as bytes

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Switch]`|false   |named   |false        |Byte<br/>Bytes|

#### **AsXml**
If set, returns results as XML

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Xml    |

#### **AsJson**
If set, returns results as json

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsMicrodata**
If set, extracts Microdata out of a page

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[Switch]`|false   |named   |false        |Microdata|

#### **ItemType**
If set, will get back microdata from the page that matches an itemtype

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **OpenGraph**
If set, extracts OpenGraph information out of a page

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MetaData**
If set, will extract all meta tags from a page

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ContentType**
The MIME content type you're requesting from the web site

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WebCredential**
The credential used to connect to the web site

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|false   |named   |true (ByPropertyName)|

#### **UseDefaultCredential**
If set, will use the default user credential to connect to the web site

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Method**
The HTTP method to use
Valid Values:

* GET
* POST
* PUT
* DELETE
* OPTIONS
* HEAD
* TRACE
* CONNECT
* MERGE

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Header**
a hashtable of headers to send with the request.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **RequestBody**
The Request Body.  This can be either a string, or bytes

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Data**
Any request ascii data.  Data will be joined together with &, and will be sent in the request body.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **UseWebRequest**
If set, will use a the Net.WebRequest class to download.  Otherwise, will use the xmlhttprequest.  
Xmlhttprequest adds some extra headers and caches GET requests, so, if you wish to avoid this, -UseWebRequest.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ProgressIdentifier**
A Progress Identifier.  This is used to show progress inside of an existing layer of progress bars.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **UseErrorAsResult**
If set, the server error will be turned into a result.  
This is useful for servers that provide complex error information inside of XML or JSON.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OutputResponseHeader**
If set, then a note property will be added to the result containing the response headers

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Timeout**
The amount of time before a web request times out.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Async**
If set, will request the web site asynchronously, and return the results

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Get-Web [-Tag <String[]>] [-TextInTag <String[]>] -Html <String> [-HideProgress] [-AsByte] [-AsXml] [-AsJson] [-AsMicrodata] [-ItemType <String[]>] [-OpenGraph] [-MetaData] [-ContentType <String>] [-Header <Hashtable>] [-RequestBody <Object>] [-Data <String[]>] [-UseWebRequest] [-ProgressIdentifier <Int32>] [-UseErrorAsResult] [-OutputResponseHeader] [-Timeout <TimeSpan>] [-Async] [<CommonParameters>]
```
```PowerShell
Get-Web [-Tag <String[]>] [-TextInTag <String[]>] [-Url] <String> [[-Parameter] <Hashtable>] [-UserAgent <String>] [-HideProgress] [-AsByte] [-AsXml] [-AsJson] [-AsMicrodata] [-ItemType <String[]>] [-OpenGraph] [-MetaData] [-ContentType <String>] [-WebCredential <PSCredential>] [-UseDefaultCredential] [-Method <String>] [-Header <Hashtable>] [-RequestBody <Object>] [-Data <String[]>] [-UseWebRequest] [-ProgressIdentifier <Int32>] [-UseErrorAsResult] [-OutputResponseHeader] [-Timeout <TimeSpan>] [-Async] [<CommonParameters>]
```
```PowerShell
Get-Web [-Tag <String[]>] [-TextInTag <String[]>] -Root <String> [-HideProgress] [-AsByte] [-AsXml] [-AsJson] [-AsMicrodata] [-ItemType <String[]>] [-OpenGraph] [-MetaData] [-ContentType <String>] [-Header <Hashtable>] [-RequestBody <Object>] [-Data <String[]>] [-UseWebRequest] [-ProgressIdentifier <Int32>] [-UseErrorAsResult] [-OutputResponseHeader] [-Timeout <TimeSpan>] [-Async] [<CommonParameters>]
```
```PowerShell
Get-Web [-Tag <String[]>] [-TextInTag <String[]>] -FileName <String> [-HideProgress] [-AsByte] [-AsXml] [-AsJson] [-AsMicrodata] [-ItemType <String[]>] [-OpenGraph] [-MetaData] [-ContentType <String>] [-Header <Hashtable>] [-RequestBody <Object>] [-Data <String[]>] [-UseWebRequest] [-ProgressIdentifier <Int32>] [-UseErrorAsResult] [-OutputResponseHeader] [-Timeout <TimeSpan>] [-Async] [<CommonParameters>]
```
