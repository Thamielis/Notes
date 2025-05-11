Invoke-WebCommand
-----------------

### Synopsis
Invokes the commands within a web service

---

### Description

Invokes the commands within a Pipeworks web service

---

### Related Links
* [ConvertTo-ModuleService](ConvertTo-ModuleService)

---

### Examples
Invoke-WebCommand is the Pipeworks function runs commands in a web service.  It's automatically called in many places, but can be used on the command line to emulate and debug running on the web.

---

### Parameters
#### **Command**
The command that is being executed

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CommandInfo]`|true    |named   |true (ByValue, ByPropertyName)|

#### **FriendlyName**
A friendly name for the service

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **ParameterOrder**
The order of the displayed parameters

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **RunWithoutInput**
If set, allows the command to be run without any parameters.  This is especially useful for Get- commands.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideParameter**
If set, these parameters will be hidden from a command handler's input and output parameters.  
They will still be visible in help.

|Type        |Required|Position|PipelineInput|Aliases      |
|------------|--------|--------|-------------|-------------|
|`[String[]]`|false   |4       |false        |DenyParameter|

#### **AnalyticsId**
The ID to use for Google Analytics tracking

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AdSenseID**
The AdSenseID used to monetize the command with Google AdSense

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AdSlot**
The AdSlotId used to monetize the command with Google AdSense

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AllowDownload**
If set, allows the command to be downloaded

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RunOnline**
If set, the command will be enabled as a web service.  This parameter is implied by almost every other parameter (except -ShowHelp, which contravenes it), and is primarily present for backwards-compatibility.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PaymentProcessed**
If set, the payment has been processed by the server.  This is used internally to finalize actions after payments.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SessionThrottle**
If SessionThrottle is set, the request handler will wait for at least the -SessionThrottle before 
allowing the user to re-run the command.  This can be useful in mitigating Denial of Service attacks
as well as providing an avenue to upsell (i.e. a free user can run a command once a minute, where as a premium user can run requests without the throttle)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **EscapeOutput**
If set, escapes the output from the command, so it can be embedded into a webpage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Style**
The CSS Style section to use for the page

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **PlainOutput**
If set, will output the results of the command without encasing it in a container

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ContentType**
If set, will output the results of the command with a particular content type

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Method**
Sets the method used for the web form.  By default, POST is used, but Get is required if the command outputs binary data (like image streams)
Valid Values:

* POST
* GET

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AntiSocial**
If set, will not add sharing links to the page

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ServiceUrl**
The Module Service URL.  
If this is not set, this will automatically be the url to the command directory.

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **WebFrontEnd**
The Web Front End for a command, declared in HTML.  Setting a Web Front End will override the default front end with any web page.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MobileWebFrontEnd**
The Mobile Web Front End for a command, declared in HTML.  Setting a Mobile Web Front End will override the default front end with any web page.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CookieParameter**
A table of parameters that will get their value from a cookie

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **SaveInCookie**
If set, will save the output in a cookie.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ParameterAlias**
A table of parameter URL aliases.  These allow URLs to the sevice to become shorter.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **ParameterDefaultValue**
Default values for the parameters

|Type         |Required|Position|PipelineInput|Aliases         |
|-------------|--------|--------|-------------|----------------|
|`[Hashtable]`|false   |named   |false        |DefaultParameter|

#### **ParameterFromSetting**
Parameters that are taken from the web.config settings

|Type         |Required|Position|PipelineInput|Aliases         |
|-------------|--------|--------|-------------|----------------|
|`[Hashtable]`|false   |named   |false        |SettingParameter|

#### **ParameterFromUser**
Parameters that are taken from the user settings

|Type         |Required|Position|PipelineInput|Aliases      |
|-------------|--------|--------|-------------|-------------|
|`[Hashtable]`|false   |named   |false        |UserParameter|

#### **PipeInto**
Any additional commands that the command can be piped into.    
In the Sandbox service, these commands will be allowed as well

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **RunInSandBox**
If set, will allow the command to be run in a sandbox

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MarginPercent**
The margin on either side of the module content.  Defaults to 7.5%.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **MarginPercentLeft**
The margin on the left side of the module content. Defaults to 7.5%.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **MarginPercentRight**
The margin on the left side of the module content. Defaults to 7.5%.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **RequireLogin**
If set, will only allow logged-in users to run the command

|Type      |Required|Position|PipelineInput|Aliases                                          |
|----------|--------|--------|-------------|-------------------------------------------------|
|`[Switch]`|false   |named   |false        |RequiresLogin<br/>RequiredLogin<br/>LoginRequired|

#### **RequireAppKey**
If set, will require an app key to run the command.  Logged in users will automatically use their app key

|Type      |Required|Position|PipelineInput|Aliases                                             |
|----------|--------|--------|-------------|----------------------------------------------------|
|`[Switch]`|false   |named   |false        |RequiresAppKey<br/>RequiredAppKey<br/>AppKeyRequired|

#### **UserTable**
If set, will track uses of an appkey.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UserPartition**
The partition in a usertable containing data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **KeepUserHistory**
If set, will track parameters the user supplied for a command, and when they ran it.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **KeepHistory**
If set, will keep a history of command input and output

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **KeepResult**
If set, will keep results in the UseTrackingTable

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseTrackingTable**
If set, will track uses of the command.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TrackProperty**
If set, will track unique properties of the output, such as the number of times an item with a particular ID is output.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **TrackParameter**
If set, will track unique parameters in the input, such as the number of times an input value is used

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **StorageAccountSetting**
The name of the web.config setting containing the storage account name.  Required for tracking.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageKeySetting**
The name of the web.config setting containing the storage account key. Required for tracking.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IfLoggedInAs**
Allows the command to be run only if the user is logged as one of the values.  
Values can be email addresses or userids.  With email addresses, wildcards (i.e. *@microsoft.com) will be supported.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ValidUserPartition**
Validates that users are allowed to run the command by checking objects with a Condition property found in ValidUserPartition

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConfigSetting**
Any config settings

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **CostPerRun**
A table of costs per run by locale

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **PayNow**
If set, makes the person pay before the command is actually executed

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |BuyNow |

#### **SubscribeNow**
If set, makes the person subscribe before the command is actually executed

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Currency**
The currency used for the transaction.  By default, US Dollars.  Additional currencies are treated as additional purchasing options

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **BillingFrequency**
The frequency for the subscription.  By default, every month.  Additional billing frequencies are used to create additional subscription options.
Valid Values:

* Daily
* Weekly
* Monthly
* Yearly

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PromptForConfirmation**
If set, prompts for confirmation before a command will be run

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ConfirmationMessage**
A custom confirmation message.  If provided, -PromptForConfirmation is assumed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RedirectTo**
A location to redirect to when the command is complete.

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **RedirectIn**
The amount of time to wait before redirecting (by default, no time)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Cost**
The cost to run the command. Providing more than one cost is used to create additional subscription options.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Double[]]`|false   |named   |false        |

#### **CostFactor**
A cost factor table

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **ShowHelp**
If set, will show the help for a command, but will not run it

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HelpObject**
If provided, will use this PSOBject for the command help.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |named   |false        |

#### **HideRelatedItem**
If set, will hide the related items in command help.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |HideRelatedItems|

#### **NoOutputMessage**
The string shown to a person when the command does not throw an error but has not output

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |NoOp   |

#### **OutputProperty**
The properties from the output to display

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **LinkTo**
Will link selected items to items from a command

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **Hidden**
If set, the command will be hidden from web front ends, but can still be directly invoked.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsTypename**
If provided, the output will be rendered with a given type name.  
Changing this will allow you to override the look and feel of any object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AsEmail**
If provided, will lookup the user by email and will run commands as them.      
This is used for montezation, and should only be used directly very carefully.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AsUserId**
If provided, will lookup the user by email and will run commands as them.      
This is used for montezation, and should only be used directly very carefully.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NoAjax**
If provided, will not use ajax while running the command

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Notify**
If provided, will use window.external.notify to provide a notification message when complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IgnoreManifest**
If set, default values and other information the pipeworks manifest will be ignored.  This allows you to execute commands with parameters that would not be available to a web user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Invoke-WebCommand -Command <CommandInfo> [[-FriendlyName] <String>] [[-ParameterOrder] <String[]>] [-RunWithoutInput] [[-HideParameter] <String[]>] [-AnalyticsId <String>] [-AdSenseID <String>] [-AdSlot <String>] [-AllowDownload] [-RunOnline] [-PaymentProcessed] [-SessionThrottle <TimeSpan>] [-EscapeOutput] [-Style <Hashtable>] [-PlainOutput] [-ContentType <String>] [-Method <String>] [-AntiSocial] [-ServiceUrl <Uri>] [-WebFrontEnd <String>] [-MobileWebFrontEnd <String>] [-CookieParameter <Hashtable>] [-SaveInCookie <String>] [-ParameterAlias <Hashtable>] [-ParameterDefaultValue <Hashtable>] [-ParameterFromSetting <Hashtable>] [-ParameterFromUser <Hashtable>] [-PipeInto <String[]>] [-RunInSandBox] [-MarginPercent <Double>] [-MarginPercentLeft <Double>] [-MarginPercentRight <Double>] [-RequireLogin] [-RequireAppKey] [-UserTable <String>] [-UserPartition <String>] [-KeepUserHistory] [-KeepHistory] [-KeepResult] [-UseTrackingTable <String>] [-TrackProperty <String[]>] [-TrackParameter <String[]>] [-StorageAccountSetting <String>] [-StorageKeySetting <String>] [-IfLoggedInAs <String[]>] [-ValidUserPartition <String>] [-ConfigSetting <Hashtable>] [-CostPerRun <Hashtable>] [-PayNow] [-SubscribeNow] [-Currency <String[]>] [-BillingFrequency <String[]>] [-PromptForConfirmation] [-ConfirmationMessage <String>] [-RedirectTo <Uri>] [-RedirectIn <TimeSpan>] [-Cost <Double[]>] [-CostFactor <Hashtable>] [-ShowHelp] [-HelpObject <PSObject>] [-HideRelatedItem] [-NoOutputMessage <String>] [-OutputProperty <String[]>] [-LinkTo <Hashtable>] [-Hidden] [-AsTypename <String>] [-AsEmail <String>] [-AsUserId <String>] [-NoAjax] [-Notify <String>] [-IgnoreManifest] [<CommonParameters>]
```
