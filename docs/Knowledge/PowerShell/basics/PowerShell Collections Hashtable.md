Get-TableOfContents \-Headings @(

- ['Keys and Values'][1]
	- ['Creating Hashtables'][2]
	- ['Setting Values'][3]
	- ['Accessing Values'][4]
	- ['Removing Values'][5]
	- ['Finding Keys or Values'][6]
	- ['Combining Hashtables'][7]
	- ['Copying Hashtables'][8]
- ['Parameter Splatting'][9]
	- ['Common Parameters'][10]
	- ['Splatting Conditionally'][11]
- ['Case Sensitivity'][12]
- ['Loops'][13]
- ['Ordered Items'][14]
- ['Complex Keys'][15]
- ['Commands with Hashtables'][16]
	- ['Group-Object'][17]
	- ['Select-Object'][18]
	- ['ConvertTo-Json'][19]
	- ['ConvertFrom-Json'][20]
- ['Casting to Objects'][21]
	- ['PSCustomObject'][22]
	- ['Other Types'][23]
- ['Conclusion'][24]
  
  ) | How
  
  ___
  
  At some point in your PowerShell career you realize the power and utility of hashtables. It’s barely an exaggeration to say that they’re used everywhere, for just about everything, whether it’s on the fly in-line or as a grouping structure when implementing code according to the specifications of a particular API. Today we’ll take a look at some ways to create and use them, and where you might encounter them when using other commands.
## Keys and Values

Hashtables aren’t structures exclude to PowerShell, you can find them in many languages and places. The thing that differentiates them from traditional arrays and lists is that they’re based on keys and values. If you’re familiar with dictionary data types, the hashtable is one of them. Each item in a hashtable has a unique key which corresponds to a value. This means you can’t have the same item more than once, at least not with the exact same key.
### Creating Hashtables

If we think back to [when we explored arrays][25] we may remember that we could create arrays with a simple `@()` syntax. Hashtables have a very similar syntax for the most simple way of creating them.

The difference to creating arrays is that you use braces, curly brackets or whichever name you prefer, instead of parentheses to create hashtables. That’s a shorthand way of creating one, but as with many data types there are a few more ways.

```powershell
$Hashtable = @{}
$Hashtable = New-Object hashtable
$Hashtable = [hashtable]::new()
```

I prefer the first way, I think it’s the simplest and most readable when it comes to declaring values directly.

```powershell
# Setting values during creation
$Hashtable = @{
  Name = 'Emanuel Palm'
  Blog = 'PipeHow'
}

# Creating a hashtable inline is also possible
$Hashtable = @{ Name = 'Emanuel'; Blog = '| How' }
```

Notice the semicolon to separate the items without a line break.
### Setting Values

As we can see, we’re able to quickly set values when creating the hashtable, but what if we want to add or modify items after it’s created?

```powershell
# Property-style
$Hashtable.Blog = '| How'

# As a dictionary
$Hashtable['Blog'] = '| How'

# Using the Add method
$Hashtable.Add('Blog', '| How')

# The hidden setter method
$Hashtable.set_Item('Blog', '| How')
```

I wouldn’t use the last one anywhere because of readability, but lean towards the second one as it removes any confusion about what type of object we’re working with.

Something good to know is that it’s not only a choice of style or preference between the three, behind them lurks a large performance difference.

```powershell
# Adding 10000 items property-style
Measure-Command {
  $HashProp = @{}
  1..10000 | ForEach-Object { $HashProp.$_ = $_ }
}

# Adding 10000 items using the Add method
Measure-Command {
  $HashMethod = @{}
  1..10000 | ForEach-Object { $HashMethod.Add($_, $_) }
}

# Adding 10000 items dictionary-style
Measure-Command {
  $HashDict = @{}
  1..10000 | ForEach-Object { $HashDict[$_] = $_ }
}
```

If you run the three examples in your console you will notice that the first one takes way longer to run. For me the last two take about 50 milliseconds in PowerShell 7, while the first one that uses the property-style of setting the value runs for **almost 8 seconds**!

If you happen to handle a lot of data it’s always good to keep performance differences in mind, something we also discussed during our earlier parts of the [PowerShell Collections series][26].
### Accessing Values

To get the values from a hashtable we can use a similar syntax as when setting values.

```powershell
# Property-style
$Hashtable.Name

# As a dictionary
$Hashtable['Name']

# Using the Item property
$Hashtable.Item('Name')
```

We can also access several values at once if we want!

```powershell
PipeHow:\Blog> $Hashtable['Name','Blog']
Emanuel
| How
```
### Removing Values

Just as we may want to add values after creation, sometimes we also want to remove items from the hashtable.

```powershell
# Using the Remove method by providing the key
$Hashtable.Remove('Name')
```

To remove the value we always need to provide the key.
### Finding Keys or Values

If we’re not sure if the key exists, we can use methods provided by the hashtable type. We can also use one of the methods to see if a specific value exists.

```powershell
$Hashtable.Contains('Name')
$Hashtable.ContainsKey('Name')
$Hashtable.ContainsValue('Emanuel')
```

All of them return either true or false, and something to note is that `Contains` works in the same way as `ContainsKey` with the difference being only the name.
### Combining Hashtables

We can combine several hashtables easily by adding them together.

```powershell
$A = @{ Name = 'Emanuel' }
$B = @{ Blog = '| How' }
$C = $A + $B
```
### Copying Hashtables

The hashtable is a reference type, which is something we need to be aware of when trying to copy one.

```powershell
PipeHow:\Blog> $A = @{ 'Name' = 'Emanuel' } # Create hashtable
PipeHow:\Blog> $B = $A # "Copy" hashtable
PipeHow:\Blog> $B['Blog'] = '| How' # Add to copy
PipeHow:\Blog> $A # Print original

Name  Value
----  -----
Blog  | How
Name  Emanuel
```

The behavior above differs from copying for example numbers or other types that we may be used to, where `$A` would only still contain my name and not the blog item. The new hashtable we copied to in our second line is actually only a reference to the original one, and changing either of them will change both. To copy a hashtable we can use the `Clone` method.

```powershell
PipeHow:\Blog> $A = @{ 'Name' = 'Emanuel' }
PipeHow:\Blog> $B = $A.Clone()
PipeHow:\Blog> $B['Blog'] = '| How'
PipeHow:\Blog> $A

Name  Value
----  -----
Name  Emanuel
```

This isn’t unusual when working with lists or dictionaries in .NET, so keep it in mind if you decide to explore other collection types that aren’t as common in PowerShell.

Another way of copying a hashtable in PowerShell is to combine it with a new empty hashtable, though I would say it’s up for debate whether or not it improves readability. As for performance it doesn’t seem to be any discernable difference at least.

```powershell
PipeHow:\Blog> $A = @{ 'Name' = 'Emanuel' }
PipeHow:\Blog> $B = $A + @{}
PipeHow:\Blog> $B['Blog'] = '| How'
PipeHow:\Blog> $A

Name  Value
----  -----
Name  Emanuel
```
## Parameter Splatting

If you’re not already using hashtables for [splatting][27], you really should! It improves readability and lets you structure your parameter data as a reusable set.

Normally we provide each parameter on the same line as the command we’re running. Creating and potentially overwriting a file in the temp folder might look like the following.

```powershell
New-Item -Path 'C:\Temp' -Name 'MyFile.txt' -ItemType File -Value 'Hello world' -Force
```

If we pretend that we actually need all those parameters we immediately see that the line is getting a little long. When we’re in the position where we need to scroll horizontally to see the full code we should consider our options to remove that need. Splatting is one of those options.

By creating a hashtable and providing it to the command using the `@` symbol in front of the name of the hashtable instead of our normal variable `$` sign, all the items in the hashtable will be added to the command as parameters. Keys will become parameter names and the values will be the values provided.

```powershell
$Params = @{
  Path = 'C:\Temp'
  Name = 'MyFile.txt'
  ItemType = File
  Value = 'Hello world'
  Force = $true
}
New-Item @Params
```
### Common Parameters

Something I often do when I have a set of parameters that are common between several commands I’m running is that I create a hashtable for splatting which contains all the parameters that are common between the commands, and then provide the differing ones as usual.

```powershell
$CommonParams = @{
  Path = 'C:\Temp'
  ItemType = 'File'
}
New-Item @CommonParams -Name 'File1.txt' -Value 'First file'
New-Item @CommonParams -Name 'File2.txt' -Value 'Second file'
```
### Splatting Conditionally

Another pattern I like to use is to create a basic hashtable for splatting with values that are always needed and then populate with more values based on conditions. If we take the case of an API request it could take the form of an initial hashtable with only API secrets, URL or headers, and added options as the code approaches the actual request, depending on what values should be provided.

To build upon our previous example we could check if the file already exists, and instead of overwriting the file we change the file location and make sure to create a directory if it doesn’t exist by providing the `Force` parameter.

```powershell
$Params = @{
  Path = 'C:\Temp'
  ItemType = 'File'
  Name = 'MyFile.txt'
  Value = 'Hello world!'
}

if (Test-Path 'C:\Temp\MyFile.txt') {
  $Params['Path'] = 'C:\Temp\MyNewFolder'
  $Params['Force'] = $true
}

New-Item @Params
```

This will create a new file called `MyFile.txt` if it doesn’t exist. If it does, we change the path to a subdirectory and enforce the creation, making sure to overwrite any file in there and create the subdirectory if it doesn’t exist already.

Run it twice and see what happens!
## Case Sensitivity

Depending on how the hashtable is created, its case sensitivity is set differently. If we create our hashtable using the bracket syntax `@{}` we will get a case-insensitive hashtable where `Name` and `name` are the same. If we want to be able to have both items separately we can create a hashtable using one of the other methods we went through earlier, by using what is called the default constructor of the `hashtable` class.

This simply means that we’re not providing any arguments to the hashtable creation itself.

```powershell
PipeHow:\Blog> $Hashtable = New-Object hashtable
PipeHow:\Blog> $Hashtable['Name'] = 'Emanuel'
PipeHow:\Blog> $Hashtable['name'] # value is null
PipeHow:\Blog> $Hashtable['Name']
Emanuel
```

If we compare it to the bracket syntax we will see the difference clearly.

```powershell
PipeHow:\Blog> $Hashtable = @{ Name = 'Emanuel' }
PipeHow:\Blog> $Hashtable['name']
Emanuel
```

This is because the implementation of the shorthand way of creating a hashtable in PowerShell does not use the default hashtable constructor, it says “hey, you should be case-insensitive” and provides the constructor with the values to set that option.
## Loops

When looping through a hashtable, we can’t do it as we normally would with an array.

```powershell
PipeHow:\Blog> foreach ($Item in $Hashtable) { "The item is $Item" }
The item is System.Collections.Hashtable
```

As we can see, hashtables are sent in their entirety through the loop, not item by item, and the same goes for the pipeline. Since hashtables don’t have a simple string representation, it simply outputs the type in our example above.

If we get the enumerator of the hashtable instead, we can get a copy of each item to work with.

```powershell
PipeHow:\Blog> foreach ($Item in $Hashtable.GetEnumerator()) {
>>     "The value of key $($_.Key) is $($_.Value)"
>> }
The value of key Blog is | How
The value of key Name is Emanuel
```

We can’t actually modify the items while looping through them using the enumerator, though. If we need to do that we can use a pattern where we loop through the keys and use them to access and set the values.

Note below that we don’t directly loop through the keys, but wrap them in an array statement using `@()` first (an expression with `$()` also works), otherwise we will get an error saying that we can’t modify the collection while enumerating. Another way to get around this is to use the `Clone` method and use the keys from that copy.

```powershell
PipeHow:\Blog> foreach ($Key in @($Hashtable.Keys)) {
>>     $Hashtable[$Key] = Get-Random
>> }
PipeHow:\Blog> $Hashtable

Name  Value
----  -----
Blog  1619459132
Name  837222534
```
## Ordered Items

Normally the order of the items in a hashtable is not under our control, they are shuffled around as PowerShell wishes.

```powershell
PipeHow:\Blog> $Hashtable = @{} # not ordered
PipeHow:\Blog> $Hashtable['FirstName'] = 'Emanuel'
PipeHow:\Blog> $Hashtable['LastName'] = 'Palm'
PipeHow:\Blog> $Hashtable['Blog'] = '| How'
PipeHow:\Blog> $Hashtable['Post'] = 'Hashtables'
PipeHow:\Blog> $Hashtable['Year'] = 2020
PipeHow:\Blog> $Hashtable

Name       Value
----       -----
Year       2020
Post       Hashtables
FirstName  Emanuel
LastName   Palm
Blog       | How
```

If we need them to stay in order, we can use the `[ordered]` type accelerator when creating the hashtable, which internally changes the type of the hashtable to an `OrderedDictionary` and keeps our items in order.

```powershell
PipeHow:\Blog> $Hashtable = [ordered]@{}
PipeHow:\Blog> $Hashtable['FirstName'] = 'Emanuel'
PipeHow:\Blog> $Hashtable['LastName'] = 'Palm'
PipeHow:\Blog> $Hashtable['Blog'] = '| How'
PipeHow:\Blog> $Hashtable['Post'] = 'Hashtables'
PipeHow:\Blog> $Hashtable['Year'] = 2020
PipeHow:\Blog> $Hashtable

Name       Value
----       -----
FirstName  Emanuel
LastName   Palm
Blog       | How
Post       Hashtables
Year       2020
```
## Complex Keys

The key of a hashtable can be anything. This means that you can set a value with a key that isn’t simply text or a number.

There may be cases where you need the key to be more complex. The key could be another hashtable itself, if we need it to be.

```powershell
PipeHow:\Blog> $BlogHash = @{
>>     @{ 'Blog' = 'PipeHow' } = 'Emanuel Palm'
>> }
PipeHow:\Blog> $BlogHash

Name    Value
----    -----
{Blog}  Emanuel Palm
```

You’re likely adding an unnecessary layer of complexity to your code when adding complex objects as keys though, so I wouldn’t use it as my first option.
## Commands with Hashtables

Many commands use hashtables in one way or another, so let’s take a look at a few that can be good to know about.
### Group-Object

If you’re not familiar with this fantastic command you can read [my post about Group-Object][28] to learn more about how it works. It’s used to structure data by grouping it on a specific property or expression.

One of the parameters for the command is `AsHashTable` which formats the output as a hashtable where each key is the property or expression you grouped by and the value is a list of all the objects that matched the grouping.

```powershell
PipeHow:\Blog> $Hash = Get-Service | Group-Object Status -AsHashTable
PipeHow:\Blog> $Hash

Name     Value
----     -----
Running  {...}
Stopped  {...}
```

There are a few options that work together with this.

If we want a case sensitive hashtable we can use the `CaseSensitive` switch parameter.

If we want to avoid getting complex objects as our keys, we can also provide the `AsString` parameter. The property “Status” that we grouped our services by is for example actually of the enum type `ServiceControllerStatus`, which may lead to confusion when trying to later compare it to a string.

If we wanted to get the running services from our previous grouping we would have to do it like below, unless we make sure it’s a string using the mentioned parameter.

```powershell
$Hash[[System.ServiceProcess.ServiceControllerStatus]::Running]
```
### Select-Object

The command `Select-Object` lets us use hashtables as a way to create custom properties.

By creating a hashtable according to the following format and providing it as one of the properties to select, we can create a calculated, custom property on the output object.

```powershell
@{
  # There are different options for naming
  Name/n/Label/l = 'PropertyName'
  Expression/e = { <# logic here #> }
}
```

The property name is defined with either `Name` or `Label`, or their first letter versions.

The expression for calculating the value is defined as a scriptblock with the key `Expression` (or `e`), where we can use `$_` to reference the object.

We can either do it in-line, or define the hashtable as a variable to provide as below.

```powershell
$Params = @{
  'Path' = 'C:\Temp'
  'Filter' = 'File*'
}
$CreatedWeekDay = @{
  'n' = 'CreatedWeekday'
  'e' = { $_.CreationTime.DayOfWeek.ToString() }
}
Get-ChildItem @Params | Select-Object Name, Directory, $CreatedWeekDay
```

This code will result in a list of custom objects showing the files we created previously.

```powershell
Name      Directory CreatedWeekday
----      --------- --------------
File1.txt C:\Temp   Tuesday
File2.txt C:\Temp   Tuesday
```
### ConvertTo-Json

When working with APIs in PowerShell we frequently need to convert data to JSON. A very easy way to do this is by putting it in a hashtable and piping it to `ConvertTo-Json`.

```powershell
$JsonHashtable = @{
  'Name' = 'Emanuel'
  'Blog' = '| How'
} | ConvertTo-Json
```

This is a quick way to format your data for an API, but can also be handy for verbose logging among many other things.

```powershell
{
"Name": "Emanuel",
"Blog": "| How"
}
```

If you have a nested hashtable with lots of values you will need to set the `Depth` parameter to the nesting level of your object to make sure not to lose any data in the conversion, and if you want it compressed on one line you can use the `Compress` parameter.
### ConvertFrom-Json

When converting data from JSON we can actually ask the command to give us back a hashtable instead of a custom object with properties. If we need to work with the keys and values it provides us the very convenient parameter `AsHashtable`.

```powershell
$Hashtable = '{"Name":"Emanuel","Blog":"| How"}'
$Hashtable | ConvertFrom-Json -AsHashtable
```

This results in a hashtable looking like the one we started with.
## Casting to Objects

As we can see, the hashtable is extremely flexible when converting to data between formats. We can also utilize the same flexibility by casting the hashtable to other types.
### PSCustomObject

My absolute favorite way to use the hashtable is to cast it to a `[pscustomobject]`. This makes all items become properties on a new object, the keys becoming the property names and the values their value.

```powershell
PipeHow:\Blog> $Hashtable = @{ Name = 'Emanuel'; Blog = '| How' }
PipeHow:\Blog> $Hashtable

Name  Value
----  -----
Name  Emanuel
Blog  | How

PipeHow:\Blog> $CustomObject = [PSCustomObject]$Hashtable
PipeHow:\Blog> $CustomObject

Name    Blog
----    ----
Emanuel | How
```

Notice how the keys and values have become properties on the object. Running `Get-Member` on our `$CustomObject` will show the difference clearly.

```powershell
TypeName: System.Management.Automation.PSCustomObject

Name        MemberType   Definition
----        ----------   ----------
Equals      Method       bool Equals(System.Object obj)
GetHashCode Method       int GetHashCode()
GetType     Method       type GetType()
ToString    Method       string ToString()
Blog        NoteProperty string Blog=| How
Name        NoteProperty string Name=Emanuel
```

This is really useful for creating quick objects with your own properties for output, reporting or passing on as input to another part of the code.
### Other Types

Last but not least I’d like to simply tie back to my first point, that hashtables lie at the foundation of PowerShell and are more flexible than we generally give them credit for.

We can actually cast to other object types as well, as long as we have the correct data and property structure. An example where I used this is with the [AzureAD][29] module, where I wanted to grant access to Graph and the Windows Virtual Desktop API for an Azure Function App, using PowerShell.

For this I needed to provide the command to create my application with a specific definition of required accesses. With hashtables I could define them in a structure that made sense and allowed me to flexibly declare which accesses the app should have in a verbose way.

Don’t worry about the code unless you want to, but take it as an example of how we can use hashtables to create a list of another specific data structure according to our needs, in this case a list of access definitions.

```powershell
$RequiredAccess = [Microsoft.Open.AzureAD.Model.RequiredResourceAccess[]](
  @{
      # Graph App Id
      ResourceAppId  = '00000003-0000-0000-c000-000000000000'

      ResourceAccess = [Microsoft.Open.AzureAD.Model.ResourceAccess[]]@(
          # Directory.Read.All - Application Permission
          @{
              Id   = '7ab1d382-f21e-4acd-a863-ba3e13f7da61'
              Type = 'Role'
          },
          # Group.Read.All - Application Permission
          @{
              Id   = '5b567255-7703-4780-807c-7be8301ae99b'
              Type = 'Role'
          }
      )
  },
  @{
      # Windows Virtual Desktop App Id
      ResourceAppId  = '5a0aa725-4958-4b0c-80a9-34562e23f3b7'

      ResourceAccess = [Microsoft.Open.AzureAD.Model.ResourceAccess[]]@(
          # Windows Virtual Desktop - user_impersonation - Delegated Permission
          @{
              Id   = '0edede9d-bec8-4bf1-802b-aee83e72608a'
              Type = 'Scope'
          }
      )
  }
)
```
## Conclusion

I hope that you found at least one or two snippets of wisdom to take with you on your journey going forward. Hashtables are a challenge to work with until you understand them, then they take your PowerShell skills to the next level!

Take a look at the other posts in the [PowerShell Collections series][30] and see if you find something more that sparks your interest about the various data types to store things in. Which collection type do you use the most, and why?

[1]: https://pipe.how/new-hashtable/#keys-and-values
[2]: https://pipe.how/new-hashtable/#creating-hashtables
[3]: https://pipe.how/new-hashtable/#setting-values
[4]: https://pipe.how/new-hashtable/#accessing-values
[5]: https://pipe.how/new-hashtable/#removing-values
[6]: https://pipe.how/new-hashtable/#finding-keys-or-values
[7]: https://pipe.how/new-hashtable/#combining-hashtables
[8]: https://pipe.how/new-hashtable/#copying-hashtables
[9]: https://pipe.how/new-hashtable/#parameter-splatting
[10]: https://pipe.how/new-hashtable/#common-parameters
[11]: https://pipe.how/new-hashtable/#splatting-conditionally
[12]: https://pipe.how/new-hashtable/#case-sensitivity
[13]: https://pipe.how/new-hashtable/#loops
[14]: https://pipe.how/new-hashtable/#ordered-items
[15]: https://pipe.how/new-hashtable/#complex-keys
[16]: https://pipe.how/new-hashtable/#commands-with-hashtables
[17]: https://pipe.how/new-hashtable/#group-object
[18]: https://pipe.how/new-hashtable/#select-object
[19]: https://pipe.how/new-hashtable/#convertto-json
[20]: https://pipe.how/new-hashtable/#convertfrom-json
[21]: https://pipe.how/new-hashtable/#casting-to-objects
[22]: https://pipe.how/new-hashtable/#pscustomobject
[23]: https://pipe.how/new-hashtable/#other-types
[24]: https://pipe.how/new-hashtable/#conclusion
[25]: https://pipe.how/new-array/
[26]: https://pipe.how/powershell-collections/
[27]: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting
[28]: https://pipe.how/group-object/
[29]: https://docs.microsoft.com/en-us/powershell/module/azuread
[30]: https://pipe.how/powershell-collections/