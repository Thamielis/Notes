New-HTMLImage
-------------

### Synopsis
Creates IMG tag with image link or image bundled inline

---

### Description

Creates IMG tag with image link or image bundled inline

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLImage -Source 'https://evotec.pl/image.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '100%'
```

---

### Parameters
#### **Source**
Link to an image or file path to an image

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **UrlLink**
Specifies the URL of the page the link goes to when user clicks an image

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |2       |false        |

#### **AlternativeText**
Specifies an alternate text for the image, if the image for some reason cannot be displayed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Class**
Overwrites default CSS settings for links

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Target**
The target attribute specifies where to open the linked document.
* _blank	Opens the linked document in a new window or tab
* _self	Opens the linked document in the same frame as it was clicked (this is default)
* _parent	Opens the linked document in the parent frame
* _top	Opens the linked document in the full body of the window
Additionally framename can be given. Default is _blank

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Width**
Width of an image (optional)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

#### **Height**
Height of an image (optional)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **Inline**
Inserts given Image URL/File directly into HTML

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableCache**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLImage [[-Source] <String>] [[-UrlLink] <Uri>] [[-AlternativeText] <String>] [[-Class] <String>] [[-Target] <String>] [[-Width] <Object>] [[-Height] <Object>] [-Inline] [-DisableCache] [<CommonParameters>]
```
