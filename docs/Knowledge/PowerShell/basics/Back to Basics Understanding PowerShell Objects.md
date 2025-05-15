---
created: 2022-03-10T13:13:35 (UTC +01:00)
tags: []
source: https://adamtheautomator.com/powershell-objects/
author: 
---

# Back to Basics: Understanding PowerShell Objects
## Excerpt
> Learn some key concepts when it comes to objects in PowerShell and apply to your own scripting through coding and visualizations.

---
PowerShell is a _powerful_ language. But what makes this scripting language so powerful? PowerShell objects. What are these magical objects and how does PowerShell work with them? Stay tuned to find out.

PowerShell is an object-oriented language and shell. This is a departure from the traditional shells like cmd and Bash. These traditional shells focused on text aka strings and while still useful, are limited in their capabilities. Nearly everything in PowerShell is an object.

In this article, you’ll learn some key concepts when it comes to objects in PowerShell. By the end of this article, you’ll have learned how to apply this knowledge to your own scripting through helpful example code and visualizations.

So buckle up! You’re in for a memorable experience that will help you master the concept of objects in PowerShell!

---
## Index
- [Prerequisites](((64557f98-4275-44bb-b8b3-733706b6cb71)))
- [Understanding the Anatomy of an Object](https://adamtheautomator.com/powershell-objects/#Understanding_the_Anatomy_of_an_Object "Understanding the Anatomy of an Object")
	- [Discovering Object Members with Get-Member](https://adamtheautomator.com/powershell-objects/#Discovering_Object_Members_with_Get-Member "Discovering Object Members with Get-Member")
	- [Object Types and Classes](https://adamtheautomator.com/powershell-objects/#Object_Types_and_Classes "Object Types and Classes")
	- [Properties](https://adamtheautomator.com/powershell-objects/#Properties "Properties")
	- [Aliases](https://adamtheautomator.com/powershell-objects/#Aliases "Aliases")
	- [Methods](https://adamtheautomator.com/powershell-objects/#Methods "Methods")
	- [Other MemberTypes](https://adamtheautomator.com/powershell-objects/#Other_MemberTypes "Other MemberTypes")
- [Working with Objects in PowerShell](https://adamtheautomator.com/powershell-objects/#Working_with_Objects_in_PowerShell "Working with Objects in PowerShell")
	- [Controlling Returned Object Properties](https://adamtheautomator.com/powershell-objects/#Controlling_Returned_Object_Properties "Controlling Returned Object Properties")
	- [Sorting Objects](https://adamtheautomator.com/powershell-objects/#Sorting_Objects "Sorting Objects")
	- [Filtering Objects](https://adamtheautomator.com/powershell-objects/#Filtering_Objects "Filtering Objects")
	- [Counting and Averaging Objects Returned](https://adamtheautomator.com/powershell-objects/#Counting_and_Averaging_Objects_Returned "Counting and Averaging Objects Returned")
	- [Taking Action on Objects with Loops](https://adamtheautomator.com/powershell-objects/#Taking_Action_on_Objects_with_Loops "Taking Action on Objects with Loops")
	- [Comparing Objects](https://adamtheautomator.com/powershell-objects/#Comparing_Objects "Comparing Objects")
- [Working With Custom Objects](https://adamtheautomator.com/powershell-objects/#Working_With_Custom_Objects "Working With Custom Objects")
	- [Creating Custom Objects From Hashtables](https://adamtheautomator.com/powershell-objects/#Creating_Custom_Objects_From_Hashtables "Creating Custom Objects From Hashtables")
	- [Adding & Removing Properties](https://adamtheautomator.com/powershell-objects/#Adding_Removing_Properties "Adding & Removing Properties")
- [Quick Intro to Methods](https://adamtheautomator.com/powershell-objects/#Quick_Intro_to_Methods "Quick Intro to Methods")
- [Conclusion](https://adamtheautomator.com/powershell-objects/#Conclusion "Conclusion")
  ---
## Prerequisites
id:: 64557f98-4275-44bb-b8b3-733706b6cb71

In this article, you’re going to learn about objects in PowerShell via a hands-on approach. If you choose to follow along and try the code examples, Windows PowerShell 5.1 or any version of PowerShell 6+ should work. However, all examples you see will be performed on Windows 10 build 1903 with Windows PowerShell 5.1.
-
## Understanding the Anatomy of an Object  
Objects are everywhere in PowerShell. You might be asking yourself “_What does an object look like?_” In this first section, you’ll get an overview of what an object consists of. Once you get a broad view of what makes an object an object, you’ll then get to dive into some code examples! #.ol-nested
-
- ### Discovering Object Members with Get-Member
  Objects have many different types of information associated with them. In PowerShell, this information is sometimes called _members_. An object member is a generic term that refers to all information associated with an object.
  
  To discover information about an object (members), you can use the `Get-Member` cmdlet. The `Get-Member` cmdlet is a handy command that allows you find available properties, methods and so on for any object in PowerShell.
  
  For example, let’s say you want to view members for a particular object returned via the `Get-Service` cmdlet. You can do so by piping the output of the `Get-Service` command to the `Get-Member` cmdlet as see below.
  
  ```powershell
  language-powershellGet-Service -ServiceName 'BITS' | Get-Member
  ```
  
  Get used to the `Get-Member` cmdlet. You’re going to be using it a lot in this article.
  
  > _Every command in PowerShell that produces output can be piped to `Get-Member`. Just remember to make this cmdlet the very last in the pipeline as it will overwrite output with its own output._
-
### Object Types and Classes
Without going into a lot of detail on object-oriented programming, every object has a “schema”. An object’s “schema” is a template of sorts that contains the blueprint to create an object. That blueprint is called a _type_.

Every object in PowerShell has a specific type. Each object has a blueprint from which it was created. An object type is defined by a [class](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes?view=powershell-7.1). Consider this example; 9 is _number_, _Bluegill_ is _fish, Labrador_ is _dog, etc._ The class comes before the type.

Objects are _instances_ of classes with a particular type.

Don’t worry about getting deep into this topic. Unless you’re a software developer, you probably don’t need to worry too much about the semantics at this point. It is, however, an important concept to know at a basic level.
-
- ### Properties
  The most important concept about objects you should understand is _properties_. Properties are attributes that describe an object. An object can have many different properties attached to it representing various attributes.
  
  One of the easiest ways to discover what properties exists on objects is using the `Get-Member` cmdlet. You can see below that by using the `MemberType` parameter, `Get-Member` will limit the output returned to only objects. You’ll also see it displays the object type of _System.ServiceProcess.ServiceController_ as well.
  
  ```powershell
  PS51> Get-Service | Get-Member -MemberType Property
  ```
  
  ![Get-Service object properties](https://adamtheautomator.com/wp-content/uploads/2020/06/1-34-1024x457.png)
  Get-Service object properties
  
  Now take the example of the BITS service covered earlier and see the specific values of that object’s properties using the below code. The `Get-Member` cmdlet allows you to find the property names but not the values. Using PowerShell’s `Select-Object` cmdlet, however, you can inspect the property values.
  
  Below you can see that `StartType` is a property on the object. The object returned has many different members but by using the `Select-Object` cmdlet, it is limiting the output to _only_ show that property.
  
  ```powershell
  PS51> Get-Service -ServiceName 'BITS' | Select-Object -Property 'StartType'
  ```
  
  ![BITS service start type](https://adamtheautomator.com/wp-content/uploads/2020/06/1-35-1024x111.png)
  BITS service start type
  
  Properties are, by far, the most common component of an object you’ll work with in PowerShell.
-
- ### Aliases
  Some properties have a `MemberType` of `Alias`. Aliases are pseudonyms for property names. They can sometimes give properties a more intuitive name.
  
  You can see an example of an object with aliases using the `Get-Service` cmdlet again as shown below. The Property `Name` is aliased to `ServiceName` and `RequiredServices` is aliased to the `ServicesDependedOn` property.
  
  ```powershell
  PS51> Get-Service | Get-Member -MemberType 'AliasProperty'
  ```
  
  ![AliasProperty members on service objects](https://adamtheautomator.com/wp-content/uploads/2020/06/2-16-1024x235.png)
  AliasProperty members on service objects
  
  When a property has an alias, you can reference that property’s value using the alias name rather than the actual property name. In this example, a descriptive attribute like `Name` and `RequiredServices` is more intuitive and easier to type than `ServiceName` and `ServicesDependedOn`.
  
  You can see an example of referencing these aliases below.
  
  ```powershell
  # Use the AliasProperty in place of an actual property name
  PS51> $Svc = Get-Service -ServiceName 'BITS' #Object you are working with
  PS51> $Svc.Name
  BITS
  PS51> $Svc.RequiredServices
  ```
  
  You should see the following output. Notice again that you are keeping the code short, clean and concise. The information is the same, regardless of using the alias or not:
  
  ![Properties on the BITS service object](https://adamtheautomator.com/wp-content/uploads/2020/06/4-11-1024x410.png)
  Properties on the BITS service object
-
- ### Methods
  Properties are only one piece that creates an object; _methods_ are also an important concept to understand. Methods are the actions that can be performed on an object. Like properties, you can discover methods on an object by using the `Get-Member` cmdlet.
  
  To limit `Get-Member`‘s output to only methods, set the `MemberType` parameter value to `Method` as shown below.
  
  ```powershell
  PS51> Get-Service | Get-Member -MemberType 'Method'
  ```
  
  ![Methods on service objects](https://adamtheautomator.com/wp-content/uploads/2020/06/5-12-1024x463.png)
  Methods on service objects
  
  As a beginner, you’ll use methods much less frequently than properties.
-
### Other MemberTypes
Properties, methods and aliases are not the only types of members an object can have. However, they will be, by far, the most common type of members you’ll be working with.

For completeness, below are a few other types of members you might come across.
- Script Property – These are used to calculate property values.
- Note Property – These are used for static property names.
- Property Sets – These are like aliases that contain just what the name implies; sets of properties. For example, you have created a custom property called `Specs` for your `Get-CompInfo` function. `Specs` is actually a subset of the properties Cpu, Mem, Hdd, IP. The primary purpose of property sets is to provide a single property name to concatenate a group of properties.
  
  > _t’s also important to mention the concept of object events. Events are outside of the scope of this article._
-
- ## Working with Objects in PowerShell
  Now that you have a basic understanding of what an object consists of, let’s start getting our hands dirty and get into some code.
  
  Many PowerShell commands produce output but sometimes you don’t need to see all of this output. You need to limit or manipulate that output somehow. Fortunately, PowerShell has a few different commands that allow you to do just that.
  
  Let’s start out with an example of enumerating all services on the local computer using the `Get-Service` cmdlet as shown below. You can see by the output many different services (objects) are returned.
  
  ```powershell
  PS51> Get-Service -ServiceName *
  ```
  
  ![Using a wildcard on ServiceName parameter](https://adamtheautomator.com/wp-content/uploads/2020/06/6-12-1024x465.png)
  Using a wildcard on ServiceName parameter
-
- ### Controlling Returned Object Properties
  Continuing on with the `Get-Service` example, perhaps you don’t need to see each property. Instead, you just need to see the `Status` and `DisplayName` properties. To limit properties returned, you’d use the `Select-Object` cmdlet.
  
  The `Select-Object` cmdlet “filters” various properties from being returned to the PowerShell pipeline. To “filter” object properties from being returned, you can use the `Property` parameter and specify a comma-delimited set of one or more properties to return.
  
  You can see below an example of only returning the `Status` and `DisplayName` properties.
  
  ```powershell
  PS51> Get-Service -ServiceName * | Select-Object -Property 'Status','DisplayName'
  ```
  
  ![Showing the Status and DisplayName properties](https://adamtheautomator.com/wp-content/uploads/2020/06/7-12-1024x341.png)
  Showing the Status and DisplayName properties
-
- ### Sorting Objects
  Perhaps you’re building a report to show services and their status. For easy information digesting, you’d like to sort the objects returned by the value of the `Status` property. To do so, you can use the `Sort-Object` cmdlet.
  
  The `Sort-Object` cmdlet allows you to collect all of the objects returned and then output them in the order you define.
  
  For example, using the `Property` parameter of `Sort-Object`, you can specify one or more properties on the incoming objects from `Get-Service` to sort by. PowerShell will pass each object to the `Sort-Object` cmdlet and then return them sorted by the value of the property.
  
  You can see below an example of returning all service objects sorted by their `Status` properly returned in descending order using the `Descending` switch parameter of `Sort-Object`.
  
  ```powershell
  Get-Service -ServiceName * | Select-Object -Property 'Status','DisplayName' |
  Sort-Object -Property 'Status' -Descending
  ```
  
  ![Using Sort-Object to sort service objects by Status in descending order](https://adamtheautomator.com/wp-content/uploads/2020/06/8-10-1024x452.png)
  Using Sort-Object to sort service objects by Status in descending order
  
  > _The pipe \[ `|` \] in PowerShell is one of a few line continuation techniques you should use when necessary. [Use it rather than backticks](https://www.itprotoday.com/powershell/breaking-lines-powershell-lose-backtick)._
-
- ### Filtering Objects
  Maybe you decide you don’t want to see all of the services on a machine. Instead, you need to limit the output by specific criteria. One way to filter the number of objects returned is by using the `[Where-Object](https://adamtheautomator.com/powershell-where-object/ "Where-Object")` cmdlet.
  
  While the `Select-Object` cmdlet limits the output of specific properties, the `Where-Object` cmdlet limits the output of entire objects.
  
  The `Where-Object` cmdlet is similar in function to the [SQL WHERE  clause](https://www.w3schools.com/sql/sql_where.asp). It acts as a filter of the original source to only return certain objects that match a specific criteria.
  
  Perhaps you’ve decided that you only want objects returned with a `Status` property value of  `Running` and only those with a `DisplayName` property value that begins with `A`.
  
  You can see in the next code snippet a `Where-Object` reference was inserted between `Select-Object` and `Sort-Object` in the pipeline order. Using a scriptblock value with a required condition crated for each object to meet via the `FilterScript` parameter, you can craft any kind of query you’d like.
  
  > _Check out the `Format-Table` cmdlet if you want to manipulate how output is returned to the console._
  
  ```powershell
  Get-Service * | Select-Object -Property 'Status','DisplayName' |
  Where-Object -FilterScript {$_.Status -eq 'Running' -and $_.DisplayName -like "Windows*" |
  Sort-Object -Property 'DisplayName' -Descending | Format-Table -AutoSize
  ```
  
  ![Formatting object output](https://adamtheautomator.com/wp-content/uploads/2020/06/9-8-1024x529.png)
  Formatting object output
-
- ### Counting and Averaging Objects Returned
  The `Get-Service` command returns many different objects. Using the `Where-Object` cmdlet, you have filtered out a portion of those objects but how many? Introducing the `Measure-Object` cmdlet.
  
  The `Measure-Object` cmdlet is a PowerShell command that, among other mathematical operations, can count how many objects it receives via the pipeline.
  
  Perhaps you’d like to know how many objects are eventually returned by the time your combined commands run. You can pipe the final output to the `Measure-Object` cmdlet to find the total number of objects returned as shown below.
  
  ```powershell
  Get-Service * | Select-Object -Property 'Status','DisplayName' |
  Where-Object {$_.Status -eq 'Running' -and $_.DisplayName -like "Windows*" |
  Sort-Object -Property 'DisplayName' -Descending | Measure-Object
  ```
  
  Once the commands are done processing, you’ll see, in this case, there were 21 objects returned initially created with the `Get-Service` cmdlet.
  
  ![Finding the number of objects returned with Measure-Object](https://adamtheautomator.com/wp-content/uploads/2020/06/10-5-1024x320.png)
  Finding the number of objects returned with Measure-Object
  
  Perhaps you’re only looking for the total objects returned. Since the `Measure-Object` command returns the total objects found via a `Count` property, you can reference the `Select-Object` cmdlet again. But this time, only returning the `Count` property.
  
  ```powershell
  Get-Service * | Select-Object -Property 'Status','DisplayName' |
  Where-Object {$_.Status -eq 'Running' -and $_.DisplayName -like "Windows*" |
  Sort-Object -Property 'DisplayName' -Descending |
  Measure-Object |
  # We start over again, filtering first, formatting last
  Select-Object -Property 'Count'
  ```
  
  ![Only returning the count property](https://adamtheautomator.com/wp-content/uploads/2020/06/11-4-1024x239.png)
  Only returning the count property
-
- ### Taking Action on Objects with Loops
  As each object is processed via the pipeline, you can take action on each object with a loop. There are different kinds of loops in PowerShell but sticking with pipeline examples, let’s look into the `ForEach-Object` cmdlet.
  
  The `ForEach-Object` cmdlet allows you to take action on each object flowing into it. This behavior is best explained with an example.
  
  Continuing to use a `Get-Service` example, perhaps you’d like to find all services on a Windows computer with a name that starts with “Windows” and is running. Using the `Where-Object` cmdlet, you can create the conditions as you’ve done earlier.
  
  ```powershell
  Where-Object -FilterScript {$_.DisplayName -Like "Windows*" -and $_.Status -eq 'Running'}
  ```
  
  But now instead of returning entire objects or even a few properties, you’d like to return the string _<ServiceName> is running_ for each object using the code \*\*`Write-Host -ForegroundColor 'Yellow' <ServiceName> "is running"`.
  
  You are now manipulating the output and creating your own string. The only way to do that is to use the `ForEach-Object` cmdlet as shown below. Below you can see that _for each_ object returned via `Where-Object`, PowerShell runs the code `[Write-Host](https://adamtheautomator.com/powershell-write-host/ "Write-Host") -ForegroundColor 'Yellow' $_.DisplayName "is running"`.
  
  ```powershell
  Get-Service -ServiceName * |
  Where-Object {$_.DisplayName -Like "Windows*" -and $_.Status -eq 'Running'} | 
  Foreach-Object {
  Write-Host -ForegroundColor 'Yellow' $_.DisplayName "is running"
  }
  ```
  
  ![Filtering by property with Where-Object](https://adamtheautomator.com/wp-content/uploads/2020/06/12-3-1024x580.png)
  Filtering by property with Where-Object
  
  The `ForEach-Object` cmdlet is useful in many ways. As an example, you could build in additional logic to enumerate through every service object found and based on a property value, change the color and wording of the output string or even perform an additional action such as starting a stopped service.
  
  Imagine the possibilities this provides to you! With a little thought and planning, you could create a script that takes one command and effortlessly executes it across many objects.
-
- ### Comparing Objects
  Sometimes you need to look at two objects and compare property values.
  
  Perhaps you have two systems on your network that are nearly identical. However, you are experiencing what you expect to be a configuration issue with a service on one of the two systems.
  
  You conclude that since these systems are in different parts of your network that you will need to use remote commands to gather the information in a PowerShell session. You open your favorite editor and create a script. This script, as you can see below, connects to two different servers and enumerates all processes on each of them.
  
  ```powershell
  $A = 'Svr01a.contoso.com'
  $B = 'Svr02b.contoso.com'
  
  $ProcA = Invoke-Command -ComputerName $A -ScriptBlock {Get-Process -Name *}
  $ProcB = Invoke-Command -ComputerName $B -ScriptBlock {Get-Process -Name *}
  ```
  
  You’ve now captured all of the processes on each computer in the `$ProcA` and `$ProcB` variables. You now need to compare them. You could manually look through each set of processes or you could do it the easy way and use a cmdlet called `Compare-Object`.
  
  `Compare-Object` allows you to compare two different objects’ property values. This cmdlet reads each property in each object, looks at their values and then returns what’s different, by default and also what’s the same.
  
  To use `Compare-Object`, specify a `ReferenceObject` and a `DifferenceObject` parameter providing each object as the parameter values as shown below.
  
  ```powershell
  Compare-Object -ReferenceObject $ProcA -DifferenceObject $ProcB
  ```
  
  By default, `Compare-Object` will only return differences in the objects indicated by the `SideIndicator` property.  The symbols or _side indicators_ used are `>`, `<` , & `=` to show the matches of objects being compared.
  
  ![Running Compare-Object](https://adamtheautomator.com/wp-content/uploads/2020/06/13-3-1024x341.png)
  Running Compare-Object
  
  > _You can use the switch parameter `IncludeEqual` with `Compare-Object` to return object properties that are the same. If so, you’ll see `==` as the side indicator. Similarly, you can use `ExcludeDifferent` to leave out differences._
  
  The `Compare-Object` cmdlet is a very useful cmdlet. If you would like to learn more, be sure to visit the [online documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/compare-object?view=powershell-7.1&viewFallbackFrom=powershell-6).
-
## Working With Custom Objects
Now that you have a good understanding of what objects are and how you can work with them, it’s time to create your own objects!
-
- ### Creating Custom Objects From Hashtables
  One way to create your own objects is by using hashtables. Hashtables are sets of key/value pairs precisely what you need for creating properties for an object.
  
  Let’s start by creating a custom PowerShell object with some key/values using a hashtable. In the below example, you are creating a hashtable. This hashtable is representing a single object and it’s properties. Once the hashtable `$CarHashtable` has been defined, you then cast use the `PsCustomObject` _[type accelerator](https://devblogs.microsoft.com/scripting/use-powershell-to-find-powershell-type-accelerators/)._
  
  The pscustomobject type accelerator is a quick way to create an instance of the pscustomobject class.  This behavior is called [casting](https://mcpmag.com/articles/2013/07/23/object-spell-in-powershell.aspx).
  By the end of the below code snippet, you have an object (`$CarObject`) of type _pscustomobject_ with five properties assigned to it.
  
  ```powershell
  ## Define the hashtable
  $CarHashtable = @{
    Brand      = 'Ford'
    Style      = 'Truck'
    Model      = 'F-150'
    Color      = 'Red'
    Drivetrain = '4x4'
  }
  
  ## Create an object
  $CarObject = [PsCustomObject]$CarHashTable
  ```
  
  Alternatively, you can also use the `New-Object` cmdlet. Using the same hashtable, instead of using the _pscustomobject_ type accelerator, you could do it the long-form way with `New-Object`. An example of this is shown below.
  
  ```powershell
  $CarHashtable = @{
    Brand      = 'Ford'
    Style      = 'Truck'
    Model      = 'F-150'
    Color      = 'Red'
    Drivetrain = '4x4'
  }
  
  #Create an object
  $CarObject = New-Object -TypeName PsObject -Properties $CarHashtable
  ```
  
  When `$CarObject` is created, you can now see below that you can reference each of the properties just as if it came from a built-in PowerShell cmdlet like `Get-Service`.
  
  ![Inspecting object properties](https://adamtheautomator.com/wp-content/uploads/2020/06/14-3-1024x341.png)
  Inspecting object properties
-
### Adding & Removing Properties
Not only can you create custom objects, but you can add to them as well. Recall using the `Get-Member` cmdlet? `Get-Member` has a relative called `Add-Member`. The `Add-Member` cmdlet doesn’t enumerate members, it _adds_ them.

Using the previously created custom object as an example, perhaps you’d like to add a model year property to that object. You can do that by piping an object to `Add-Member` specifying:
- The type of member (in this case a simple `NoteProperty`)
- The name of the property (`Year`)
- The value of the property (`Value`)
  
  You can see an example of this below.
  
  ```powershell
  PS51> $CarObject | Add-Member -MemberType NoteProperty -Name 'Year' -Value '2010'
  ```
  
  You can see below again that it appears just like any other property.
  
  ![Adding and viewing a new property](https://adamtheautomator.com/wp-content/uploads/2020/06/15-3-1024x320.png)
  
  Adding and viewing a new property
  
  You can use similar techniques to add many different types of members. If you would like to explore more on your own, take a look at the `Add-Member` [documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/add-member?view=powershell-7.1&viewFallbackFrom=powershell-6).
  
  You can just as easily remove a member from an object. Although there is no `Remove-Member` cmdlet, you can still make it happen by calling the `Remove()` method on the object as shown below. You’ll learn about methods in the next section.
  
  ```powershell
  $CarObject.psobject.properties.remove('Drivetrain')
  ```
- ## Quick Intro to Methods
  Throughout this article, you’ve been working with properties. You’ve read property values, created your own properties and added and removed them. But you haven’t really done much to the environment. You haven’t changed anything on the server. Let’s take some action with _methods_.
  
  Methods perform some kind of action. Objects store information while methods take action.
  
  For example, you may be aware of the `Stop-Service` command. This command stops a Windows service. To do that, you can send an object from `Get-Service` directly to `Stop-Service` to make it happen.
  
  You can see below an example of stopping the BITS service. This example stops the BITS service and then checks the status to ensure it’s stopped. You’ve taken two actions with cmdlets; stopping the service and checking the status.
  
  ```powershell
  Get-Service -ServiceName 'BITS' | Stop-Service
  Get-Service -ServiceName 'BITS'
  ```
  
  Rather than running `Get-Service` twice and executing a separate command, `Stop-Service`, instead, you can leverage methods that are built right into the service objects. Many objects have methods. In this case, `Stop-Service` and that second `Get-Service` reference isn’t even needed.
  
  ![Running commands to stop and start a service](https://adamtheautomator.com/wp-content/uploads/2020/06/16-6-1024x363.png)
  Running commands to stop and start a service
  
  By invoking methods on the service object itself, you can stop and retrieve the updated status all using a single object. Below you can see this in action. Notice that by using the  `Stop()`  and `Start()` methods, you can manipulate the service just like the commands did.
  
  To ensure the `Status` property value is up to date after the service status has changed, you can invoke the `Refresh()` method which acts like another `Get-Service` command call.
  
  ```powershell
  ## Stop BITS on the local machine
  $Svc = Get-Service -ServiceName 'BITS' #Object you are working with
  $Svc.Stop() #Method / action you are taking
  $Svc.Refresh() #Method / action you are taking
  $Svc.Status #Property
  
  #Start BITS on the local machine
  $Svc = Get-Service -ServiceName 'BITS' #Object you are working with
  $Svc.Start() #Method / action you are taking
  $Svc.Refresh() #Method / action you are taking
  $Svc.Status #Property
  ```
  
  You should see the following output:
  
  ![Executing methods on the service object](https://adamtheautomator.com/wp-content/uploads/2020/06/17-2-1024x277.png)
  Executing methods on the service object
  
  For more information on methods, check out the [about\_Methods help topic](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_methods?view=powershell-7.1).
-
## Conclusion
There are many things that you can do with objects in PowerShell. This article was just a primer to get you started learning them. In this article, you have learned some of the basics about what objects are, how to take action, manipulate and create them. You’ve seen a few different scenarios which showed you how to perform these tasks with code samples. Keep calm, and learn PowerShell. Thanks for reading!