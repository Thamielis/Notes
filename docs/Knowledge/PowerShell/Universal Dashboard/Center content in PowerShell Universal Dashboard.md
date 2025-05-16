---
created: 2022-05-05T12:15:34 (UTC +02:00)
tags: []
source: https://blog.ironmansoftware.com/universal-dashboard-center-content/
author: 
---

# Center content in PowerShell Universal Dashboard

> ## Excerpt
> In this post, we'll look at how to center content in PowerShell Universal Dashboard.

---
![Image Description](https://blog.ironmansoftware.com/images/daily-powershell.png)

## Daily PowerShell #67

#### January 13, 2022

#### ![quote](https://blog.ironmansoftware.com/images/quote.png) [Discuss this Article](https://forums.ironmansoftware.com/t/center-content-in-powershell-universal-dashboard)

In this post, we’ll look at how to center content in PowerShell Universal Dashboard.

## How does Universal Dashboard work?

Universal Dashboard creates websites by executing PowerShell cmdlets, converting the output to JSON and then translating that to HTML and CSS that is shown to the user. The `New-UDElement` cmdlet can be used to create arbitrary HTML tags with attributes. Using this cmldet, we can center elements.

## Use `New-UDElement` to Center Content

`New-UDElement` supports an `-Attributes` property which accepts a hashtable of key\\value pairs that will be passed to the element when created. This can include the `style` property to adjust the CSS styles of the element.

The following example will create an HTML `div` tag that has a couple of styles set and some content.

```
New-UDElement -Tag div -Attributes @{
    style = @{
        textAlign = 'center'
        width = '100%'
    }
} -Content {
    New-UDTypography -Text 'Loading...' -Variant h5
    New-UDProgress -Circular
}
```

The resulting HTML will look something like this.

```
<div style="text-align: center; width: 100%"><!-->Content<--></div>
```

If you were to put this `New-UDElement` into your dashboard, it would look like this.

![Universal Dashboard Centered Content](https://blog.ironmansoftware.com/images/center.png)

## `New-UDCenter` Function

You can take the above `New-UDElement` call and create a function that you can then use throughout your dashboard.

```
function New-UDCenter {
    param([ScriptBlock]$Content)

    New-UDElement -tag div -Content $Content -Attributes @{
        style = @{
            textAlign = 'center'
            width = '100%'
        }
    }
}
```

Now, your dashboard would become a bit easier to read.

```
New-UDDashboard -Title 'Test' -Content {
    New-UDCenter -Content {
        New-UDTypography -Text 'Loading groups' -Variant h5
        New-UDProgress -Circular
    }
}
```

___
