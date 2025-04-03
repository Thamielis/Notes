---
created: 2022-06-10T21:38:18 (UTC +02:00)
tags: []
source: https://blog.ironmansoftware.com/universal-dashboard-loading/
author: 
---

# Universal Dashboard Loading Dialogs

> ## Excerpt
> This post outlines how to show loading dialogs for various actions within Universal Dashboard.

---
#### ![quote](https://blog.ironmansoftware.com/images/quote.png) [Discuss this Article](https://forums.ironmansoftware.com/t/universal-dashboard-loading-dialogs)

Loading data or executing commands that manipulate external systems may take time. Without the proper indications in place, it may be confusing to the user when long running operations are taking place. In this post, we’ll look at various ways to show loading and progress in Universal Dashboard.

This post was written using [PowerShell Universal](https://ironmansoftware.com/powershell-universal) v1.3.

## Progress Component

In this post, we’ll take advantage of a custom progress loading component. It will show a spinner and some text.

```
function New-Progress {
    param(
        $Text
    )

    New-UDElement -tag 'div' -Attributes @{ style = @{ padding = "20px"; textAlign = 'center'} } -Content {
        New-UDRow -Columns {
            New-UDColumn -Content {
                New-UDTypography -Text $Text -Variant h4
            }
        }
        New-UDRow -Columns {
            New-UDColumn -Content {
                New-UDProgress -Circular 
            }
        }
    }
}
```

![](https://blog.ironmansoftware.com/images/progress.png)

## Pages

In Universal Dashboard v3, all pages are dynamic pages. This means that PowerShell script is executed every time a page is loaded. One of the potential problems with this architecture is that long running scripts can cause delays that would prevent the user from seeing anything progressing. You can avoid this scenario by using `$Cache` and `$Session` variables.

### Session

Some data is session specific. Session variables allow you to store data for a particular user. The below code will check the `$Session:SessionPageLoaded` variable to see if the data has been loaded. A `New-UDEndpoint` is used to run an endpoint in the background once the page is loaded. In this example, we’re waiting 5 seconds before setting a couple of session variables and then reloading the `content` dynamic using `Sync-UDElement`.

```
$Pages += New-UDPage -Name 'Session' -Content {
    New-UDDynamic -Id 'content' -Content {
        if ($Session:SessionPageLoaded)
        {
            New-UDTypography -Text "Some random text $($Session:SessionData)"
        }
        else 
        {
            New-Progress -Text 'Loading session data...'
            
            New-UDElement -Tag 'div' -Endpoint {
                Start-Sleep 5
                $Session:SessionPageLoaded = $true
                $Session:SessionData = Get-Random
                Sync-UDElement -Id 'content'
            }
        }
    }
}
```

### Cache

Similar to the session example above, a cache variable could also be used. Cache variables are shared across all sessions.

```
$Pages += New-UDPage -Name 'Cache' -Content {
    New-UDDynamic -Id 'content' -Content {
        if ($Cache:CachePageLoaded)
        {
            New-UDTypography -Text "Some random text $($Cache:CacheData) $var"
        }
        else 
        {
            New-Progress -Text 'Loading cache data...'
            New-UDElement -Tag 'div' -Endpoint {
                Start-Sleep 5
                $Cache:CachePageLoaded = $true
                $Cache:CacheData = Get-Random
                Sync-UDElement -Id 'content'
            }
        }
    }
}
```

## Components

We can also use the same type of script to load individual components or contents of a component. In this example, we use the same method of using a cache variable and loading the contents of a tab.

```
$Pages += New-UDPage -Name 'Component' -Content {

    New-UDTabs -Tabs {
        New-UDTab -Text 'Tab 1' -Content {
            New-UDDynamic -Id 'tabContent' -Content {
                if ($Cache:TabLoaded)
                {
                    New-UDTypography -Text "Some random text $($Cache:TabData)"
                }
                else 
                {
                    New-Progress -Text 'Loading tab data...'
                    New-UDElement -Tag 'div' -Endpoint {
                        Start-Sleep 5
                        $Cache:TabLoaded = $true
                        $Cache:TabData = Get-Random
                        Sync-UDElement -Id 'tabContent'
                    }
                }
            }
        }
        New-UDTab -Text 'Tab 2' -Content {
            
        }
    }
}
```

![](https://blog.ironmansoftware.com/images/component-progress.png)

## Determinate Progress

Sometimes, you will have a good indication of the amount of progress that has taken place. In this example, we look at how to use a deterministic `UDProgress` to display the percent completed. The script creates a `New-UDProgress` within a dynamic region and sets the `PercentComplete` to a session variable. In an endpoint, there is a loop that iterates through 1 to 100 and updates the session variable and refreshes the dynamic region. The result is a progress bar that moves along as your script progresses.

```
$Pages += New-UDPage -Name 'Percent Complete' -Content {

    New-UDDynamic -Id 'percent' -Content {
        New-UDProgress -PercentComplete $Session:PercentComplete
    }

    New-UDElement -Tag 'div' -Endpoint {
        1..100 | ForEach-Object {
            $Session:PercentComplete = $_
            Sync-UDElement -Id 'percent'
            Start-Sleep -Milli 100
        }
    }
}
```

![](https://blog.ironmansoftware.com/images/progress.gif)

## Form Progress

Submitting data in a form is one of the scenarios that may take some time to process. You’ll likely be interacting with other systems that can have variable performance. To avoid any strange delays for the user or to report on the progress of the operation, you can put the form within a dynamic region and then update progress as the form progresses. In this example, after the processing is complete, the form will be reset to it’s original state.

```
$Pages += New-UDPage -Name 'Form' -Content {
    New-UDDynamic -Id 'form' -Content {
        if ($Session:FormProcessing)
        {
            New-Progress -Text 'Submitting form...'
        }
        else 
        {
            New-UDForm -Content {
                New-UDTextbox -Label 'Name'
            } -OnSubmit {
                $Session:FormProcessing = $true 
                Sync-UDElement -Id 'form'
                Start-Sleep 5
                $Session:FormProcessing = $false 
                Sync-UDElement -Id 'form'
            }
        }
    }
}
```

## Conclusion

In this post, we looked at how to create various progress loading dialogs to provide feedback to users when long running operations are taking place.
