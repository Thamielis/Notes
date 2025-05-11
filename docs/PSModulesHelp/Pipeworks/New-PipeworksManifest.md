New-PipeworksManifest
---------------------

### Synopsis
Creates a Pipeworks manifest for a module, so it can become a site.

---

### Description

Creates a Pipeworks manifest for a module, so that it can become a pipeworks site.

The Pipeworks manifest is at the heart of how you publish your PowerShell as a web site or software service.

New-PipeworksManifest is designed to help you create Pipeworks manifests for most common cases.

---

### Related Links
* [Get-PipeworksManifest](Get-PipeworksManifest)

---

### Examples
Creates a quick site to download the ScriptCoverage module

```PowerShell
New-PipeworksManifest -Name ScriptCoverage -Domain ScriptCoverage.Start-Automating.com, ScriptCoverasge.StartAutomating.com -AllowDownload
```

---

### Parameters
#### **Name**
The name of the module

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Domain**
A list of domains where the site will be published

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Uri[]]`|false   |2       |true (ByPropertyName)|

#### **SecureSetting**
The names of secure settings that will be used within the website.  You should have already configured these settings locally with Add-SecureSetting.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Keyword**
A list of Keywords that will be used for all pages in the website

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **WebCommand**
Commands used within the site.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |4       |true (ByPropertyName)|

#### **Logo**
The logo of the website.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **AllowDownload**
If set, the module will be downloadable.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |6       |true (ByPropertyName)|

#### **Table**
The table for the website.  
This is used to store public information

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |7       |true (ByPropertyName)|

#### **UserTable**
The usertable for the website.  
This is used to enable logging into the site, and to store private information

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|

#### **UserPartition**
The partition in the usertable where information will be stored.  By default, "Users".  
This is used to enable logging into the site, and to store private information

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |9       |true (ByPropertyName)|

#### **TableAccountNameSetting**
The name of the secure setting containing the table storage account name.  By default, AzureStorageAccountName

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TableAccountKeySetting**
The name of the secure setting containing the table storage account key.  By default, AzureStorageAccountKey

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **LiveConnectID**
The LiveConnect ID.
This is used to enable Single Sign On using a Microsoft Account.  
You must also provide a LiveConnectSecretSetting, and a SecureSetting containing the LiveConnect App Secret.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |10      |true (ByPropertyName)|

#### **LiveConnectSecretSetting**
The name of the SecureSetting that contains the LiveConnect client secret.
This is used to enable Single Sign On using a Microsoft Account.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |11      |true (ByPropertyName)|

#### **LiveConnectScope**
The LiveConnect Scopes to use.  If not provided, wl.basic, wl.signin, wl.birthday, and wl.emails will be requested

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |12      |true (ByPropertyName)|

#### **FacebookAppId**
The facebook AppID to use.  If provided, then like buttons will be added to each page and users will be able to login with Facebook

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FacebookScope**
The facebook login scope to use.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Schematic**
The schematics used to publish the website.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |13      |true (ByPropertyName)|

#### **Group**
A group describes how commands and topics should be grouped together.

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[Hashtable[]]`|false   |14      |true (ByPropertyName)|

#### **PaypalEmail**
A paypal email to use for payment processing.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |15      |true (ByPropertyName)|

#### **CommandOrder**
The in which the commands will be shown.  If not provided, commands are sorted alphabetically.  
If a Group is provided instead, the Group will be used

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **MainRegion**
Settings related to the main region.  
If you need to change the default look and feel of the main region on a pipeworks site, supply a hashtable containing parameters you would use for New-Region.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |named   |true (ByPropertyName)|

#### **InnerRegion**
Settings related to the inner region.  
If you need to change the default look and feel of the inner regions in a pipeworks site, supply a hashtable containing parameters you would use for New-Region.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |named   |true (ByPropertyName)|

#### **AdditionalSetting**
Any addtional settings

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[Hashtable[]]`|false   |named   |true (ByPropertyName)|

#### **AnalyticsID**
A Google Analytics ID.  This will be added to each page for tracking purposes

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **GoogleSiteVerification**
A google site verification.  This will validate the site for Google Webmaster Tools

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BingValidationKey**
A Bing Validation Key.  This will validate the site for Bing Webmaster Tools

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Style**
A style sheet to use

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |named   |true (ByPropertyName)|

#### **UseBootstrap**
If set, will use Bootstrap when creating the page

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[Switch]`|false   |named   |false        |Bootstrap|

#### **ForegroundColor**
The foreground color
|Color

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **BackgroundColor**
The background color
|Color

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LinkColor**
The link color
|Color

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Css**
A list of CSS files to use

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SlideShow**
A list slides in a slideshow.  Slides can either be a URL, or HTML content

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **GitIt**
GitIt - Git projects to include

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[Hashtable[]]`|false   |named   |true (ByPropertyName)|

#### **JQueryUITheme**
The JQueryUI Theme to use.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TrustedWalkthru**
Trusted walkthrus will run their sample code.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **WebWalkthru**
Web walkthrus will output HTML

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **AdSenseID**
An AdSense ID

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AdSlot**
An AdSense AdSlot

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AddPlusOne**
If set, will add a plusone to each page

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Tweet**
If set, will add a tweet button to each page

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **UseRaphael**
If set, will use the Raphael.js library in the site

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **UseGraphael**
If set, will use the g.Raphael.js library in the site

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **UseTablesorter**
If set, will use the tablesorter JQuery plugin in the site

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Branding**
If set, will change the default branding.  By default, pages will display "Powered By PowerShell Pipeworks"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Win8Identity**
Provides the identity of a Win8 App

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Win8Publisher**
Provides the publisher of a Win8 App

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Win8Version**
Provides the version of a Win8 App

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Version]`|false   |named   |true (ByPropertyName)|

#### **Win8Logo**
Provides logos for use in a Win8 App

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
New-PipeworksManifest [-Name] <String> [[-Domain] <Uri[]>] [[-SecureSetting] <String[]>] [[-Keyword] <String[]>] [[-WebCommand] <Hashtable>] [[-Logo] <String>] [[-AllowDownload]] [[-Table] <String>] [[-UserTable] <String>] [[-UserPartition] <String>] [-TableAccountNameSetting <String>] [-TableAccountKeySetting <String>] [[-LiveConnectID] <String>] [[-LiveConnectSecretSetting] <String>] [[-LiveConnectScope] <String[]>] [-FacebookAppId <String>] [-FacebookScope <String>] [[-Schematic] <String[]>] [[-Group] <Hashtable[]>] [[-PaypalEmail] <String>] [-CommandOrder <String[]>] [-MainRegion <Hashtable>] [-InnerRegion <Hashtable>] [-AdditionalSetting <Hashtable[]>] [-AnalyticsID <String>] [-GoogleSiteVerification <String>] [-BingValidationKey <String>] [-Style <Hashtable>] [-UseBootstrap] [-ForegroundColor <String>] [-BackgroundColor <String>] [-LinkColor <String>] [-Css <String[]>] [-SlideShow <String[]>] [-GitIt <Hashtable[]>] [-JQueryUITheme <String>] [-TrustedWalkthru <String[]>] [-WebWalkthru <String[]>] [-AdSenseID <String>] [-AdSlot <String>] [-AddPlusOne] [-Tweet] [-UseRaphael] [-UseGraphael] [-UseTablesorter] [-Branding <String>] [-Win8Identity <String>] [-Win8Publisher <String>] [-Win8Version <Version>] [-Win8Logo <Hashtable>] [<CommonParameters>]
```
