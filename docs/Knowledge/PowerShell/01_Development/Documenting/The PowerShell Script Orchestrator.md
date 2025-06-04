---
created: 2025-04-17T17:02:12 (UTC +02:00)
tags: []
source: https://www.progress.com/blogs/powershell-script-orchestrator
author: Adam Bertram
---

# The PowerShell Script Orchestrator

---
![powershell-script](https://www.progress.com/images/default-source/ipsblogposts/powershell-script-1.jpg?sfvrsn=4dea371d_4)

With companies moving services to the cloud, applications offering robust APIs and a driving need for automation, we need a more mature scripting language.

Some scripting languages are designed for one purpose and one purpose only. VBScript and batch files were used to automate small tasks. These languages were meant to offer a helping hand with various ad hoc tasks solely on local Windows systems. Nowadays, this just won't cut it.  We need an automation Swiss army knife. We need a PowerShell script.

### [Related Article: PowerShell Scripting and Open Management Infrastructure (OMI)](https://www.progress.com/blogs/powershell-scripting-and-open-management-infrastructure-omi)

Since PowerShell can interact with just about anything you can think of, it can be considered an automation orchestrator coordinating all kinds of different products and services to work together. Let's jump into an example of how PowerShell can build a workflow and orchestrate a multi-service setup.

PowerShell can scrape information from web pages and work with APIs. This allows me to create a script that takes input from a web page, for example, and post this information to another service with an available API. To demonstrate this, let's grab the current weather for my region and, if it's beautiful weather, send a tweet on Twitter bragging about the sunshine.

We first need to get the weather. Local weather is provided by a few different web services for free via an API. I'm going to choose openweathermap.org. To use this service, you'll first need to sign up for an [API key](http://openweathermap.org/appid). It's free. Once you've got your API key, we can now use PowerShell to query the weather for any city in the world! To do that, we'll have to make a call out to the API using the Invoke-WebRequest command and pass the URI to the API.

_$resultsJSON = Invoke-WebRequest "api.openweathermap.org/data/2.5/weather?q=,&units=metric&appid=&type=accurate&mode=json"_

Be sure to replace the city, country and API key placeholders. This will pull down the data in JSON format. To get it in a more readable format, it can be converted to a PowerShell object with the ConvertFrom-Json command.

_$weather = ConvertFrom-Json $resultsJson.Content_

This will create an object with various familiar property names.

![PowerShell](https://www.progress.com/images/default-source/ipsblogposts/picture1-1111111116.jpg?sfvrsn=73d1c508_4)

At this point, it's just a matter of manipulating this data to display in any format you'd like. For a great example, [a Github user created a script](https://github.com/obs0lete/Get-Weather/blob/master/Get-Weather.ps1) that pretties up the output quite a bit.

### [Related Article: Advanced PowerShell Functions: Upping Your Game](https://www.progress.com/blogs/advanced-powershell-functions-upping-game)

Now that I have some weather data, I'll now need to figure out how to filter out when I want to send a tweet. Since 22 degrees Celsius is a nice temp, let's pick that one. To do that, I'll add an If statement to look at the main property of the object above.

_if ($weather.main.temp_ -_gt 22) {_

_\## send tweet bragging_

_}_

I now have what I need to send the tweet. For this, I'll use the pre-built [MyTwitter module](https://github.com/MyTwitter/MyTwitter). For this module to work, you'll also need an API key from Twitter. For full instructions, refer to [this blog post](http://www.adamtheautomator.com/twitter-module-powershell/). I'll need to save my Twitter API credentials to my computer so that MyTwitter can authenticate to Twitter's API. I'll use the New-MyTwitterConfiguration command to do this providing it all of the data necessary.

![PowerShell](https://www.progress.com/images/default-source/ipsblogposts/picture11-111111114.jpg?sfvrsn=ebc5d0ad_4)

Once I've got that setup, I can now send tweets from this PowerShell script. To do so, I'll use the Send-Tweet command. I'll add this command inside of the If block and run the script which should send a tweet on my behalf if the weather is over 22 degrees Celsius.

_if ($weather.main.temp_ -_gt 22) {_

_Send-Tweet -Message "The weather here is $($weather.main.temp)! I bet you wish you were here."_

_}_

Notice that I can even include the actual temperature in the tweet since I'm querying that from the weather API.

![PowerShell](https://www.progress.com/images/default-source/ipsblogposts/picture111-11111113.jpg?sfvrsn=b9721f32_4)

This is just one example of how PowerShell can act as a service orchestrator. You've seen that by using built-in commands and freely available projects from the PowerShell community, it's possible to use PowerShell to orchestrate a lot of things. Don't think of PowerShell as just a scripting language. As you've seen, PowerShell is capable of manipulating services outside the realm of "typical" scripting languages.

With this newfound knowledge of PowerShell as an automation orchestrator, can you think of any other situation where building automation around web services like this might be beneficial?

### [![New Call-to-action](https://www.progress.com/images/default-source/ipsblogposts/628fe090-4a09-40fc-ac84-0b45b08ee373.jpg?sfvrsn=298fd6db_4)](https://www.progress.com/resources/papers/how-to-automate-using-powershell)
