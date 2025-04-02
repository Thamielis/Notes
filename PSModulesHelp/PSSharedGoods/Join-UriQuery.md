Join-UriQuery
-------------

### Synopsis
Provides ability to join two Url paths together including advanced querying

---

### Description

Provides ability to join two Url paths together including advanced querying which is useful for RestAPI/GraphApi calls

---

### Examples
> EXAMPLE 1

```PowerShell
Join-UriQuery -BaseUri 'https://evotec.xyz/' -RelativeOrAbsoluteUri '/wp-json/wp/v2/posts' -QueryParameter @{
    page     = 1
    per_page = 20
    search   = 'SearchString'
}
```
> EXAMPLE 2

```PowerShell
Join-UriQuery -BaseUri 'https://evotec.xyz/wp-json/wp/v2/posts' -QueryParameter @{
    page     = 1
    per_page = 20
    search   = 'SearchString'
}
```
> EXAMPLE 3

```PowerShell
Join-UriQuery -BaseUri 'https://evotec.xyz' -RelativeOrAbsoluteUri '/wp-json/wp/v2/posts'
```

---

### Parameters
#### **BaseUri**
Primary Url to merge

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|true    |1       |false        |

#### **RelativeOrAbsoluteUri**
Additional path to merge with primary url (optional)

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |2       |false        |

#### **QueryParameter**
Parameters and their values in form of hashtable

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |3       |false        |

#### **EscapeUriString**
If set, will escape the url string

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Switch]`|false   |named   |false        |EscapeUrlString|

---

### Notes
General notes

---

### Syntax
```PowerShell
Join-UriQuery [-BaseUri] <Uri> [[-RelativeOrAbsoluteUri] <Uri>] [[-QueryParameter] <IDictionary>] [-EscapeUriString] [<CommonParameters>]
```
