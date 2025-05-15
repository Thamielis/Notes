---
created: 2022-05-05T12:19:36 (UTC +02:00)
tags: []
source: https://blog.ironmansoftware.com/universal-dashboard-button-color/
author: 
---

# Setting button colors in PowerShell Universal Dashboard

> ## Excerpt
> In this post, we'll look at how to set button colors in PowerShell Universal Dashboard.

---
#### ![quote](https://blog.ironmansoftware.com/images/quote.png) [Discuss this Article](https://forums.ironmansoftware.com/t/setting-button-colors-in-powershell-universal-dashboard)

In this post, we’ll look at how to set button colors in PowerShell Universal Dashboard.

## Using the `-Color` Parameter

The `-Color` parameter is used to set between the primary and secondary theme colors. When the theme changes, the button colors will automatically change.

```
New-UDButton -Text 'Primary' -Color primary 
New-UDButton -Text 'Secondary' -Color secondary
```

![](https://blog.ironmansoftware.com/images/button-default-theme-color.png)

## Using the `-Style` Parameter

The `-Style` parameter allows you to set the button colors using CSS styles. You can set the foreground and background colors by defining them in a hashtable.

```
New-UDButton -Text 'Styled' -Style @{
    backgroundColor = 'red'
    color = 'white'
}
```

![](https://blog.ironmansoftware.com/images/button-style-color.png)

## Using Theme Overrides

You can override the button colors in the theme so it applies to all buttons.

```
$Theme = @{
   overrides = @{
       MuiButton = @{
           root = @{
               backgroundColor = 'blue !important'
               color = 'white !important'
           }
       }
   }
}
New-UDDashboard -Theme $Theme -Title 'Hello' -Content {
    New-UDButton -Text 'Themed'
}
```

![](https://blog.ironmansoftware.com/images/button-custom-theme-color.png)

___
