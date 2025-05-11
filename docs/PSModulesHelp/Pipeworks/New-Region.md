New-Region
----------

### Synopsis
Creates a new web region.

---

### Description

Creates a new web region.  Web regions are lightweight HTML controls that help you create web pages.

---

### Related Links
* [New-Webpage](New-Webpage)

---

### Examples
Makes a JQueryUI tab

```PowerShell
New-Region -Layer @{
    "Tab1" = "Content In Tab One"
    "Tab2" = "Content in Tab Two"
} -AsTab
```
Makes a JQueryUI accordian

New-Region -Layer @{
    "Accordian1" = "Content In The first Accordian"
    "Accordian1" = "Content in the second Accordian"
} -AsAccordian
Makes an empty region

```PowerShell
New-Region -Style @{} -Content "My Layer" -LayerID MyId
```
A Centered Region containing Microdata

```PowerShell
New-Region -ItemType http://schema.org/Event -Style @{
    'margin-left' = '7.5%'
    'margin-right' = '7.5%'
} -Content '
<a itemprop="url" href="nba-miami-philidelphia-game3.html">
NBA Eastern Conference First Round Playoff Tickets:
<span itemprop="name"> Miami Heat at Philadelphia 76ers - Game 3 (Home Game 1) </span>  </a> 
<meta itemprop="startDate" content="2016-04-21T20:00">    Thu, 04/21/16    8:00 p.m.  
<div itemprop="location" itemscope itemtype="http://schema.org/Place">    
<a itemprop="url" href="wells-fargo-center.html">    Wells Fargo Center    </a>    
<div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">      
<span itemprop="addressLocality">Philadelphia</span>,      <span itemprop="addressRegion">PA</span>    
</div>  
</div>  
<div itemprop="offers" itemscope itemtype="http://schema.org/AggregateOffer">
Priced from: <span itemprop="lowPrice">$35</span>    <span itemprop="offerCount">1938</span> tickets left  
</div>'
```

---

### Parameters
#### **Content**
The content within the region.  This content will be placed on an unnamed layer.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |1       |true (ByValue)|

#### **Layer**
A set of layer names and layer content

|Type         |Required|Position|PipelineInput|Aliases|
|-------------|--------|--------|-------------|-------|
|`[Hashtable]`|false   |1       |false        |Item   |

#### **LayerUrl**
A set of layer names and layer URLs.  Any time the layer is brought up, the content will be loaded via AJAX

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **LayerLink**
A set of layer direct links

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **Order**
The order the layers should appear.  If this is not set, the order will
be the alphabetized list of layer names.

|Type        |Required|Position|PipelineInput|Aliases   |
|------------|--------|--------|-------------|----------|
|`[String[]]`|false   |named   |false        |LayerOrder|

#### **Default**
The default layer.  If this is not set and if -DefaultToFirst is not set, a layer 
will be randomly chosen.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DefaultToFirst**
The default layer.  If this is not set and if -DefaultToFirst is not set, a layer 
will be randomly chosen.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LayerID**
The Name of the the container.  The names becomes the HTML element ID of the root container.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |named   |false        |Id<br/>Container|

#### **LeftMargin**
The percentage margin on the left.  The region will appear this % distance from the side of the screen, regardless of resolution

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |2       |true (ByPropertyName)|

#### **RightMargin**
The percentage margin on the right.  The region will appear this % distance from the side of the screen, regardless of resolution

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |3       |true (ByPropertyName)|

#### **TopMargin**
The percentage margin on the top.  The region will appear this % distance from the top of the screen, regardless of resolution

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |4       |true (ByPropertyName)|

#### **BottomMargin**
The percentage margin on the bottom.  The region will appear this % distance from the bottom of the screen, regardless of resolution

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |5       |true (ByPropertyName)|

#### **Border**
The border for the region.  Becomes the CSS border attribute of the main container

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **HideDirectionButton**
If set, hides the forward and back buttons

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideMoreButton**
If set, hides the more button

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideTitleArea**
If set, hides the title area

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HorizontalRuleUnderTitle**
If set, shows a horizontal rule under the title

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToolbarAbove**
If set, places the toolbar above

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ToolbarMargin**
The margin of the toolbar

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Logo**
URL for a logo to go on the title of each page

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **NotRequestAware**
If set, the control will not be aware of the web request string.
Otherwise, a URL can provide which layer of a region to show.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsStaticRegion**
If set, the region will have any commands to change its content, 
and will only have one layer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NotCool**
If set, turns off fade effects

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TransitionTime**
The transition time for all fade effects.  Defaults to 200ms

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **LayerHeadingSize**
The layer heading size

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **KeyFrameCount**
The number of keyframes in all transitions

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **CanPan**
If set, enables a pan effect within the layers

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CanDrag**
If set, the entire container can be dragged

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ScrollSpeed**
The scroll speed (when on iOs or webkit)

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **CssClass**
The CSS class to use

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Style**
A custom CSS style.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **FixedSize**
If set, the layer will not be automatically resized, and percentage based margins will be ignored

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableLayerSwitcher**
If set, will not allow the contents of the layer to be switched

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutoSwitch**
If set, will automatically switch the contents on an interval

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **AsAccordian**
If set, will create the region as an JQueryUI Accordion.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsTab**
If set, will create the region as an JQueryUI Tab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TabBelow**
If set, the JQueryUI tab will appear below the content, instead of above

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OpenOnMouseOver**
If set, will open the tabs on a mouseover event

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsPopout**
If set, will create a set of popout regions.  When the tile of each layer is clicked, the layer will be shown.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsPopdown**
If set, will create a set of popdown regions.  As region is clicked, the underlying content will be shown below.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsPopIn**
If set, will create a set of popdown regions.  As region is clicked, the underlying content will be shown below.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsSlideShow**
If set, will create a slide of the layers.  If a layer title is clicked, the slideshow will stop

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsPortlet**
If set, the layer will be created as a portlet

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsNewspaper**
If set, the layer will be created as a newspaper

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UnderlineNewspaperHeadline**
If set, the newspaper headline buttons will be underlined

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseButtonForNewspaperHeadline**
If set, newspaper headlines will be displayed as buttons

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NewspaperHeadingAlignment**
The alignment used for the heading in a newspaper
Valid Values:

* left
* center
* right

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NewspaperHeadingSize**
The size of the headings in a newspaper

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **NewspaperColumn**
The width of the columns in the newspaper

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Single[]]`|false   |named   |false        |

#### **ExpandNewspaperColumn**
The columns that will be expanded

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ColumnCount**
The number of columns in a Portlet

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **ColumnWidth**
The width of a column within a Portlet

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AsPopup**
If set, will create a set of JQueryUI buttons which popup JQueryUI dialogs

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsWidget**
If set, will create a set of JQueryUI simple widgets

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsResizable**
If set, will create the layer as a series of resizable items

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsDraggable**
If set, will create the layer as a series of draggable items

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsLeftSidebarMenu**
If set, the layer will be created as a left sidebar menu

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsRightSidebarMenu**
If set, the layer will be created as a right sidebar menu

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsGrid**
If set, the layer will be created as a grid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsMenu**
If set, the layer will be created as a menu

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsNavbar**
If set, the layer will be created as a Bootstrap navbar menu

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsCarousel**
If set, the layer will be created as a Bootstrap carousel

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsHeadline**
If set, the layer will be created as set of Bootstrap headlines

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsButton**
If set, the layer will be created as set of Bootstrap buttons

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsTree**
If set, the content will be displayed as a tree

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsColumn**
If set, the content will be displayed as a series of columns

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BranchColor**
The color of the branch in a tree

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ShowLayerTitle**
If set, will show large item titles for items in the carousel

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsFeaturette**
If set, the layer will be created as a Bootstrap featurette

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsRow**
If set, the layer will be created as a Bootstrap row

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsHangingSpan**
If set, the layer will be created as pair of Bootstrap rows, with content expanding down in the right half of the grid.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SpanButtonSize**
The size (in Bootstrap spans) of the buttons used in -AsHangingSpan.  
The size of the hanging area will be the remainder of the 12 span grid, with one span reserved for offset

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **RowSpan**
The Bootstrap RowSpan

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **GridItemWidth**
The width of items within a grid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **GridItemHeight**
The height of items within a grid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **SidebarWidth**
The width of a sidebar in a left or right sidebar menu

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **ItemType**
One or more item types to apply to the region.  If set, an itemscope and itemtype will be added to the region

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **AsVectorLayout**
If set, will use a vector (%percentage based layout) for the region.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideSlideNameButton**
If set, will hide the slide name buttons (effectively creating an endless slideshow)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseDotInsteadOfName**
If set, will use a middot instead of a slide name for a slideshow button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MenuBackgroundColor**
The background color in a popin

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LayerInnerOrder**
The inner order within a

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
The Parameter set design on New-Region is a little complex.  

There are two base parameter sets, raw layer content (-Content) and structured layer content (-Layer)

In each case, parameters named -As* determine how the actual layer will be rendered.

To make matters more complex, different -As* parameters require different JavaScript frameworks

---

### Syntax
```PowerShell
New-Region [[-Content] <String[]>] [-LayerID <String>] [[-LeftMargin] <Double>] [[-RightMargin] <Double>] [[-TopMargin] <Double>] [[-BottomMargin] <Double>] [-Border <String>] [-HideDirectionButton] [-HideMoreButton] [-HideTitleArea] [-HorizontalRuleUnderTitle] [-ToolbarAbove] [-ToolbarMargin <Int32>] [-Logo <Uri>] [-NotRequestAware] [-IsStaticRegion] [-NotCool] [-TransitionTime <TimeSpan>] [-LayerHeadingSize <UInt32>] [-KeyFrameCount <UInt32>] [-CanPan] [-CanDrag] [-ScrollSpeed <Int32>] [-CssClass <String[]>] [-Style <Hashtable>] [-FixedSize] [-DisableLayerSwitcher] [-OpenOnMouseOver] [-UnderlineNewspaperHeadline] [-UseButtonForNewspaperHeadline] [-NewspaperHeadingAlignment <String>] [-NewspaperHeadingSize <UInt32>] [-NewspaperColumn <Single[]>] [-ExpandNewspaperColumn <String[]>] [-ColumnCount <UInt32>] [-ColumnWidth <String>] [-AsPopup] [-AsWidget] [-AsResizable] [-AsDraggable] [-AsLeftSidebarMenu] [-AsRightSidebarMenu] [-AsGrid] [-AsMenu] [-AsNavbar] [-AsCarousel] [-AsHeadline] [-AsButton] [-AsTree] [-AsColumn] [-BranchColor <String>] [-ShowLayerTitle] [-AsFeaturette] [-AsRow] [-AsHangingSpan] [-SpanButtonSize <UInt32>] [-RowSpan <String[]>] [-GridItemWidth <UInt32>] [-GridItemHeight <UInt32>] [-SidebarWidth <UInt32>] [-ItemType <String[]>] [-AsVectorLayout] [-HideSlideNameButton] [-UseDotInsteadOfName] [-MenuBackgroundColor <String>] [-LayerInnerOrder <Hashtable>] [<CommonParameters>]
```
```PowerShell
New-Region [[-Layer] <Hashtable>] [-LayerUrl <Hashtable>] [-LayerLink <Hashtable>] [-Order <String[]>] [-Default <String>] [-DefaultToFirst] [-LayerID <String>] [[-LeftMargin] <Double>] [[-RightMargin] <Double>] [[-TopMargin] <Double>] [[-BottomMargin] <Double>] [-Border <String>] [-HideDirectionButton] [-HideMoreButton] [-HideTitleArea] [-HorizontalRuleUnderTitle] [-ToolbarAbove] [-ToolbarMargin <Int32>] [-Logo <Uri>] [-NotRequestAware] [-IsStaticRegion] [-NotCool] [-TransitionTime <TimeSpan>] [-LayerHeadingSize <UInt32>] [-KeyFrameCount <UInt32>] [-CanPan] [-CanDrag] [-ScrollSpeed <Int32>] [-CssClass <String[]>] [-Style <Hashtable>] [-FixedSize] [-DisableLayerSwitcher] [-AutoSwitch <TimeSpan>] [-AsAccordian] [-AsTab] [-TabBelow] [-OpenOnMouseOver] [-AsPopout] [-AsPopdown] [-AsPopIn] [-AsSlideShow] [-AsPortlet] [-AsNewspaper] [-UnderlineNewspaperHeadline] [-UseButtonForNewspaperHeadline] [-NewspaperHeadingAlignment <String>] [-NewspaperHeadingSize <UInt32>] [-NewspaperColumn <Single[]>] [-ExpandNewspaperColumn <String[]>] [-ColumnCount <UInt32>] [-ColumnWidth <String>] [-AsPopup] [-AsWidget] [-AsResizable] [-AsDraggable] [-AsLeftSidebarMenu] [-AsRightSidebarMenu] [-AsGrid] [-AsMenu] [-AsNavbar] [-AsCarousel] [-AsHeadline] [-AsButton] [-AsTree] [-AsColumn] [-BranchColor <String>] [-ShowLayerTitle] [-AsFeaturette] [-AsRow] [-AsHangingSpan] [-SpanButtonSize <UInt32>] [-RowSpan <String[]>] [-GridItemWidth <UInt32>] [-GridItemHeight <UInt32>] [-SidebarWidth <UInt32>] [-ItemType <String[]>] [-AsVectorLayout] [-HideSlideNameButton] [-UseDotInsteadOfName] [-MenuBackgroundColor <String>] [-LayerInnerOrder <Hashtable>] [<CommonParameters>]
```
