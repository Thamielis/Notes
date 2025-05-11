New-RssItem
-----------

### Synopsis
Creates a new RSS Feed Item

---

### Description

Creates a new RSS Feed Item.  When use with Out-Feed, can easily publish any information as RSS

---

### Related Links
* [Out-RssFeed](Out-RssFeed)

---

### Examples
> EXAMPLE 1

```PowerShell
New-RssItem -Title 'My Post' -Description 'Things I Learning While Writing Pipeworks' -Author $env:UserName -Link '.' -Category Stuff, OtherStuff
```

---

### Parameters
#### **Title**
The post title

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Description**
The post description

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |2       |true (ByPropertyName)|ArticleBody<br/>Html|

#### **Link**
The post link

|Type   |Required|Position|PipelineInput        |Aliases|
|-------|--------|--------|---------------------|-------|
|`[Uri]`|true    |3       |true (ByPropertyName)|Url    |

#### **Author**
The author of the post

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |4       |true (ByPropertyName)|Creator|

#### **DatePublished**
Then the post was published

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[DateTime]`|false   |5       |true (ByPropertyName)|pubDate|

#### **Category**
Categories for the post

|Type        |Required|Position|PipelineInput        |Aliases                      |
|------------|--------|--------|---------------------|-----------------------------|
|`[String[]]`|false   |6       |true (ByPropertyName)|Keyword<br/>Keywords<br/>Tags|

#### **AsHTML**
If set, returns the RSS item as HTML with microdata

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
New-RssItem [-Title] <String> [-Description] <String> [-Link] <Uri> [-Author] <String> [[-DatePublished] <DateTime>] [[-Category] <String[]>] [-AsHTML] [<CommonParameters>]
```
