# Adaptive Cards with Tables and Linebreaks in Microsoft Teams

![Adaptive Card Tables](https://evotec.xyz/wp-content/uploads/2022/08/img_630252b972cae-thegem-blog-default.png)

[**PSTeams**](https://github.com/EvotecIT/PSTeams) is a **PowerShell** module that helps simplify sending notifications to Microsoft Teams via Incoming webhooks. It's easy to use and doesn't require playing with JSON. Since version 2.0, it started to support **Adaptive Cards**; in version 2.1, I've added the ability to mention people. Today I'm introducing an easy way to send data as a table and a quick way to add a line break.

## Creating Adaptive Card Tables & Line breaks

If you have ever created **Adaptive Cards** by hand with JSON, you know it's far from easy. You need to know what goes with what and what the options are. Colors are predefined (and not something you would expect), weight has specific values, and so on. **PSTeams **are there to help. Before introducing Adaptive Tables and Line breaks, you need to know that there is no native way to build tables, so one has to create them yourself using Adaptive **Column**, Adaptive **ColumnSet**, and Adaptive **TextBlock**. I've just made sure to automate it enough, so it's much easier to use in **PowerShell** than building it manually.

```powershell
$URL = "incoming webhook"
# Lets prepare dummmy object array with few elements
$Objects = @(
    [PSCustomObject] @{
        Test  = 123
        Test2 = "Tes1t"
    }
    [PSCustomObject] @{
        Test  = 456
        Test2 = "Test2"
    }
    [PSCustomObject] @{
        Test  = 789
        Test2 = "Test3"
    }
)
# Different dummy object array with few elements as ordered dictionary or hashtable
$ObjectsHashes = @(
    [ordered] @{
        Test  = 123
        Test2 = "Tes1t"
    }
    [ordered] @{
        Test  = 456
        Test2 = "Test2"
    }
    [ordered] @{
        Test  = 789
        Test2 = "Test3"
    }
)
# Lets create a new adaptive card
$Card = New-AdaptiveCard {
    # lets add some text, table and line breaks
    New-AdaptiveTextBlock -Size 'Medium' -Weight Bolder -Text 'Table usage with PSCustomObject 🔥' -Wrap
    New-AdaptiveTable -DataTable $Objects
    New-AdaptiveLineBreak
    New-AdaptiveTextBlock -Size 'Medium' -Weight Bolder -Text 'Table usage with OrderedDictionary 🤷‍♂️' -Wrap
    New-AdaptiveTable -DataTable $ObjectsHashes
    New-AdaptiveLineBreak
    New-AdaptiveTextBlock -Size 'Medium' -Weight Bolder -Text 'Table usage with display as PSCustomObject ❤️' -Wrap
    New-AdaptiveTable -DataTable $ObjectsHashes -DictionaryAsCustomObject -HeaderColor Attention
    New-AdaptiveTextBlock -Text 'Different example' -Size Large -Subtle -Spacing ExtraLarge
    New-AdaptiveLineBreak
    # and here we mix it with some sample from Adaptive cards
    New-AdaptiveContainer {
        New-AdaptiveColumnSet {
            New-AdaptiveColumn {
                New-AdaptiveImage -Url "https://adaptivecards.io/content/cats/3.png" -Size Medium -AlternateText "Shades cat team emblem" -HorizontalAlignment Center
                New-AdaptiveTextBlock -Weight Bolder -Text 'SHADES' -HorizontalAlignment Center
            } -Width Auto
            New-AdaptiveColumn {
                New-AdaptiveTextBlock -Text "Sat, Aug 31, 2019" -HorizontalAlignment Center -Wrap
                New-AdaptiveTextBlock -Text "Final" -Spacing None -HorizontalAlignment Center
                New-AdaptiveTextBlock -Text "45 - 7" -HorizontalAlignment Center -Size ExtraLarge
            } -Width Stretch -Separator -Spacing Medium
            New-AdaptiveColumn {
                New-AdaptiveImage -Url "https://adaptivecards.io/content/cats/2.png" -Size Medium -HorizontalAlignment Center -AlternateText "Skins cat team emblem"
                New-AdaptiveTextBlock -Weight Bolder -Text 'SKINS' -HorizontalAlignment Center
            } -Width Auto -Separator -Spacing Medium
        }
    }
    # and lets convert Get-Process into Adaptive card
    New-AdaptiveTextBlock -Text 'Lets convert Get-Process into Adaptive Table' -Size Large -Subtle -Spacing ExtraLarge
    New-AdaptiveLineBreak
    $TableData = Get-Process | Select-Object -First 5 -Property Name, Id, CompanyName, CPU, FileName
    New-AdaptiveTable -DataTable $TableData -HeaderHorizontalAlignment Center -HorizontalAlignment Center -HeaderColor Good -Size Small
} -Uri $URL -FullWidth -ReturnJson
$Card | ConvertFrom-Json | ConvertTo-Json -Depth 20
```

As you see above, there are about 90 lines of code, of which 30 is the definition for PowerShell objects and 60 creation of Adaptive Card, but if you look at what was produced, you get over 800 lines of JSON file. Can you imagine doing this by hand?! What is the result?

![WebHooks](https://evotec.xyz/wp-content/uploads/2022/08/img_630252b972cae.png)

The above shows that you now have **New-AdaptiveTable** that provides an easy way to send the whole table to **Adaptive Card**. You, of course, need to be aware of limits such as **width** or **height**. You won't be able to suddenly send a table with **60 columns** and expect it to work. This is why I've picked specific columns from **Get-Process** for demonstration purposes. I've also added **New-AdaptiveLineBreak**, which adds an empty line as the name suggests. This can be useful if you send more than a few lines of text, so it's a bit more readable. Tables have multiple parameters available, primarily for deciding colors, alignment, spacing, or wrapping for headers or content if you don't like the defaults.

Notice that I've also added the **ReturnJSON** parameter to **New-AdaptiveCard**. By default, you don't need this parameter, but it is useful when debugging what was sent to Teams. Also, if you don't provide an URL, whether you provide **ReturnJSON** or not, **JSON** will be returned anyway.

## Installing PSTeams PowerShell Module

How do you install it? The easiest and most optimal way is to use **PowerShellGallery**. This will get you up and running in no time. Whenever there is an update, just run **Update-Module,** and you're done.

```powershell
Install-Module PSTeams
# Update-Module PSTeams
```

However, if you're into code – want to see how everything is done, you can use **GitHub** sources. Please remember that the **PowerShellGallery** version is optimized and better for production use. If you see any issues, bugs, or features that are missing, please make sure to submit them on **GitHub**.

- Code is published as a module on [PowerShellGallery](https://www.powershellgallery.com/packages/PSTeams/)

- Issues should be reported on [GitHub](https://github.com/EvotecIT/PSTeams/issues)

- Code is published on [GitHub](https://github.com/EvotecIT/PSTeams)

If you're interested in other features of [PSTeams PowerShell Module](https://github.com/EvotecIT/PSTeams), here are a couple of blog posts that may be useful

- [Mentioning users in notifications using PSTeams PowerShell Module](https://evotec.xyz/mentioning-users-in-notifications-using-psteams-powershell-module/)

- [Introducing PSTeams 2.0 – Support for Adaptive Cards, Hero Cards, List Cards, and Thumbnail Cards](https://evotec.xyz/introducing-psteams-2-0-support-for-adaptive-cards-hero-cards-list-cards-and-thumbnail-cards/)

- [PSTeams – Send notifications to MS Teams from Mac / Linux or Windows](https://evotec.xyz/psteams-send-notifications-to-ms-teams-from-mac-linux-or-windows/)

- [Sending Messages to Microsoft Teams from PowerShell just got easier and better](https://evotec.xyz/sending-to-microsoft-teams-from-powershell-just-got-easier-and-better/)

## Building Adaptive Card using JSON

For the sake of completeness of this blog post to create the same Adaptive Card using just JSON you would need to do this:

```json
{
    "type": "message",
    "attachments": [
        {
            "contentType": "application/vnd.microsoft.card.adaptive",
            "content": {
                "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                "type": "AdaptiveCard",
                "version": "1.2",
                "body": [
                    {
                        "type": "TextBlock",
                        "text": "Table usage with PSCustomObject 🔥",
                        "size": "Medium",
                        "weight": "Bolder",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False",
                        "wrap": true
                    },
                    {
                        "type": "ColumnSet",
                        "columns": [
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "Test",
                                        "weight": "Bolder",
                                        "color": "Accent",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "123",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "456",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "789",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "Test2",
                                        "weight": "Bolder",
                                        "color": "Accent",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Tes1t",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test2",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test3",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": "TextBlock",
                        "text": "\n",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False"
                    },
                    {
                        "type": "TextBlock",
                        "text": "Table usage with OrderedDictionary 🤷‍♂️",
                        "size": "Medium",
                        "weight": "Bolder",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False",
                        "wrap": true
                    },
                    {
                        "type": "ColumnSet",
                        "columns": [
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "Name",
                                        "weight": "Bolder",
                                        "color": "Accent",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test2",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test2",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test2",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "Value",
                                        "weight": "Bolder",
                                        "color": "Accent",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "123",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Tes1t",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "456",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test2",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "789",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test3",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": "TextBlock",
                        "text": "\n",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False"
                    },
                    {
                        "type": "TextBlock",
                        "text": "Table usage with display as PSCustomObject ❤️",
                        "size": "Medium",
                        "weight": "Bolder",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False",
                        "wrap": true
                    },
                    {
                        "type": "ColumnSet",
                        "columns": [
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "Test",
                                        "weight": "Bolder",
                                        "color": "Attention",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "123",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "456",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "789",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "Test2",
                                        "weight": "Bolder",
                                        "color": "Attention",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Tes1t",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test2",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "Test3",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": "TextBlock",
                        "text": "Different example",
                        "spacing": "ExtraLarge",
                        "size": "Large",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False",
                        "isSubtle": true
                    },
                    {
                        "type": "TextBlock",
                        "text": "\n",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False"
                    },
                    {
                        "type": "Container",
                        "items": [
                            {
                                "type": "ColumnSet",
                                "columns": [
                                    {
                                        "type": "Column",
                                        "width": "auto",
                                        "items": [
                                            {
                                                "type": "Image",
                                                "url": "https://adaptivecards.io/content/cats/3.png",
                                                "size": "Medium",
                                                "alt": "Shades cat team emblem",
                                                "horizontalAlignment": "Center"
                                            },
                                            {
                                                "type": "TextBlock",
                                                "text": "SHADES",
                                                "horizontalAlignment": "Center",
                                                "weight": "Bolder",
                                                "highlight": "False",
                                                "italic": "False",
                                                "strikeThrough": "False"
                                            }
                                        ]
                                    },
                                    {
                                        "type": "Column",
                                        "width": "stretch",
                                        "items": [
                                            {
                                                "type": "TextBlock",
                                                "text": "Sat, Aug 31, 2019",
                                                "horizontalAlignment": "Center",
                                                "highlight": "False",
                                                "italic": "False",
                                                "strikeThrough": "False",
                                                "wrap": true
                                            },
                                            {
                                                "type": "TextBlock",
                                                "text": "Final",
                                                "spacing": "None",
                                                "horizontalAlignment": "Center",
                                                "highlight": "False",
                                                "italic": "False",
                                                "strikeThrough": "False"
                                            },
                                            {
                                                "type": "TextBlock",
                                                "text": "45 - 7",
                                                "horizontalAlignment": "Center",
                                                "size": "ExtraLarge",
                                                "highlight": "False",
                                                "italic": "False",
                                                "strikeThrough": "False"
                                            }
                                        ],
                                        "spacing": "Medium",
                                        "separator": true
                                    },
                                    {
                                        "type": "Column",
                                        "width": "auto",
                                        "items": [
                                            {
                                                "type": "Image",
                                                "url": "https://adaptivecards.io/content/cats/2.png",
                                                "size": "Medium",
                                                "alt": "Skins cat team emblem",
                                                "horizontalAlignment": "Center"
                                            },
                                            {
                                                "type": "TextBlock",
                                                "text": "SKINS",
                                                "horizontalAlignment": "Center",
                                                "weight": "Bolder",
                                                "highlight": "False",
                                                "italic": "False",
                                                "strikeThrough": "False"
                                            }
                                        ],
                                        "spacing": "Medium",
                                        "separator": true
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": "TextBlock",
                        "text": "Lets convert Get-Process into Adaptive Table",
                        "spacing": "ExtraLarge",
                        "size": "Large",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False",
                        "isSubtle": true
                    },
                    {
                        "type": "TextBlock",
                        "text": "\n",
                        "highlight": "False",
                        "italic": "False",
                        "strikeThrough": "False"
                    },
                    {
                        "type": "ColumnSet",
                        "columns": [
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "Name",
                                        "horizontalAlignment": "Center",
                                        "weight": "Bolder",
                                        "color": "Good",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "1Password",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "1Password",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "1Password",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "1Password",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "1Password-BrowserSupport",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "Id",
                                        "horizontalAlignment": "Center",
                                        "weight": "Bolder",
                                        "color": "Good",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "10168",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "11280",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "12180",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "18588",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "17224",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "CompanyName",
                                        "horizontalAlignment": "Center",
                                        "weight": "Bolder",
                                        "color": "Good",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "CPU",
                                        "horizontalAlignment": "Center",
                                        "weight": "Bolder",
                                        "color": "Good",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "7.03125",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "1.40625",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "1038.75",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "3.765625",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "text": "0.828125",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "FileName",
                                        "horizontalAlignment": "Center",
                                        "weight": "Bolder",
                                        "color": "Good",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False"
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    },
                                    {
                                        "type": "TextBlock",
                                        "horizontalAlignment": "Center",
                                        "size": "Small",
                                        "highlight": "False",
                                        "italic": "False",
                                        "strikeThrough": "False",
                                        "separator": true
                                    }
                                ]
                            }
                        ]
                    }
                ],
                "msteams": {
                    "width": "Full"
                }
            }
        }
    ]
}
```

[adaptive cards](https://evotec.xyz/tag/adaptive-cards/)[microsoft teams](https://evotec.xyz/tag/microsoft-teams/)[office 365](https://evotec.xyz/tag/office-365/)[powershell](https://evotec.xyz/tag/powershell/)[teams](https://evotec.xyz/tag/teams/)
