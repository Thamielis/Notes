Out-RssFeed
-----------

### Synopsis
Outputs RSS items into an RSS feed

---

### Description

Outputs RSS items into an RSS feed.  Items can be easily created with New-RssItem

---

### Related Links
* [New-RssItem](New-RssItem)

---

### Examples
> EXAMPLE 1

```PowerShell
New-RssItem -Title "My Vacation" -Category Stupid, Stuff -Link http://bit.ly/myvacation -Author Bob -Description "Stuff I did on my vacation" | 
    Out-RssFeed -Title "My Blog" -Description "Things I Decided To Say to the World" -Link "http://my.blog"
```

---

### Parameters
#### **Item**
An Rss Item

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|true    |1       |true (ByValue)|

#### **Title**
The title of the RSS feed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Description**
The description of the RSS feed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **DatePublished**
The date the feed was published

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |4       |false        |

#### **Link**
A Link to the feed page

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|true    |5       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Out-RssFeed [-Item] <String[]> [-Title] <String> [-Description] <String> [[-DatePublished] <DateTime>] [-Link] <Uri> [<CommonParameters>]
```
