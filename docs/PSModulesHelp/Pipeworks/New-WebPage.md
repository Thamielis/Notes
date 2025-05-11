New-WebPage
-----------

### Synopsis
Creates a new web page, with some help

---

### Description

Creates a new web page containing the most commonly used web technologies.

Using New-WebPage, you can generate the scaffolding for 

- Linked or nested style sheets
- Pages built with JQuery, JQueryUI, TableSorter, or Twitter Bootstrap
- Linked RSS feeds        
- Global Javascript declarations
- Global javascript error handlers
- Simple Redirect pages 
- Embedded Analytics        
- Native looking applications in Safari
- Pinned Sites in IE

---

### Related Links
* [New-Region](New-Region)

* [Write-Link](Write-Link)

* [Out-HTML](Out-HTML)

---

### Examples
> EXAMPLE 1

Hello World</h1>' | New-WebPage -Title "Hello World"

---

### Parameters
#### **Title**
The Title of the Web Page
|LinesForInput 2

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **PageContent**
The page content.  The page content contains quoted strings or the commands New-Region and Write-Link    
|LinesForInput 20

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[ScriptBlock]`|false   |2       |true (ByPropertyName)|

#### **PageHeader**
Any additional content for the Page Header

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Template**
The name of the template file that will be used to display the item.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Rss**
One or more links to RSS feeds, as a pair of values

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **PinnedSiteName**
The IE pinned site name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PinnedSiteTooltip**
The IE pinned site tooltip

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PinnedSiteUrl**
The IE pinned site url

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **UseJQuery**
If set, the page will use JQuery

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **JQueryVersion**
The Version of JQuery to use

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |named   |false        |

#### **UseJQueryUI**
If set, the page will use JQuery UI

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **JQueryUIVersion**
The version of JQueryUI to use

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |named   |false        |

#### **PinnedSiteJumpList**
Pairs of site jump item names and jump urls

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **Css**
The CSS style table

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **StyleSheet**
One or more linked style sheets

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Uri[]]`|false   |named   |false        |

#### **AnalyticsID**
A Google analytics ID

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

#### **ShowJavaScriptError**
If set, Javascript errors will be shown

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideSafariUI**
If set, the Safari default UI elements will be hidden and

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **JavaScript**
One or more script tags

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PageBody**
Content to place within the body element

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |true (ByValue, ByPropertyName)|

#### **RedirectTo**
If set, will make the page a light redirect to another URL

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|false   |5       |true (ByPropertyName)|

#### **RedirectIn**
The amount of time to wait before a redirect

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |named   |true (ByPropertyName)|

#### **Keyword**
The keyword list

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Description**
The meta description

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **PostalCode**
The postal code (or zip code) list

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |named   |false        |ZipCode|

#### **Metadata**
A table of additional metadata

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **ContentDeliveryNetworkPreference**
The content delivery network to use for libraries like JQuery.
Valid Values:

* Google
* Microsoft
* Local

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |CDN    |

#### **JQueryUITheme**
The jQueryUI Theme.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseTwitterBootstrap**
If set, will use the twitter bootstrap layout CSS

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Switch]`|false   |named   |false        |UseBootstrap|

#### **UseUserJQueryUITheme**
If set, will use the JQueryUITheme preferred by the user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GoogleMerchantID**
If set, will add the google checkout header.  This will allow products within the page to have an "add to cart" button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GoogleCheckoutCurrency**
The checkout currency to use for the page

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NoCache**
If set, will add http-equiv meta tags to force a refresh

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExpirationDate**
If set, will add http-equiv meta tags to expire the cache at a certain date

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **HideFromSearchEngine**
If set, will add meta tags to hide the content from search engines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoDocType**
If set, will not add a doctype.  Otherwise, the document will be marked as HTML5.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BingValidationKey**
The validation key for Bing Webmaster Tools

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GoogleSiteVerification**
The Google Webmaster Tools

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OpenGraph**
A set of opengraph data.  Do not prefix with og:

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **FacebookAppId**
The FaceBook AppId.  
This is used to initiate the Facebook JavaScript API for Like and other OpenGraph verbs

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseTableSorter**
If set, will use the [jQuery tablesorter plugin](http://tablesorter.com)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseRaphael**
If set, will use [Raphael](http://raphaeljs.com/)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseGRaphael**
If set, will use [GRaphael](http://g.raphaeljs.com/)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseFilePicker**
If set, will use [filepicker.io](http://filepicker.io)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IgnoreManifest**
If set, will ignore settings in the pipeworks manifest.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Depth**
The depth of the page

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
New-WebPage [[-Title] <String>] [[-PageContent] <ScriptBlock>] [-PageHeader <String[]>] [-Template <String[]>] [-Rss <Hashtable>] [-PinnedSiteName <String>] [-PinnedSiteTooltip <String>] [-PinnedSiteUrl <Uri>] [-UseJQuery] [-JQueryVersion <Version>] [-UseJQueryUI] [-JQueryUIVersion <Version>] [-PinnedSiteJumpList <Hashtable>] [-Css <Hashtable>] [-StyleSheet <Uri[]>] [[-AnalyticsID] <String>] [-ShowJavaScriptError] [-HideSafariUI] [-JavaScript <String[]>] [-PageBody <String[]>] [[-RedirectTo] <Uri>] [-RedirectIn <TimeSpan>] [[-Keyword] <String[]>] [[-Description] <String>] [-PostalCode <String[]>] [-Metadata <Hashtable>] [-ContentDeliveryNetworkPreference <String>] [-JQueryUITheme <String>] [-UseTwitterBootstrap] [-UseUserJQueryUITheme] [-GoogleMerchantID <String>] [-GoogleCheckoutCurrency <String>] [-NoCache] [-ExpirationDate <DateTime>] [-HideFromSearchEngine] [-NoDocType] [-BingValidationKey <String>] [-GoogleSiteVerification <String>] [-OpenGraph <Hashtable>] [-FacebookAppId <String>] [-UseTableSorter] [-UseRaphael] [-UseGRaphael] [-UseFilePicker] [-IgnoreManifest] [-Depth <UInt32>] [<CommonParameters>]
```
