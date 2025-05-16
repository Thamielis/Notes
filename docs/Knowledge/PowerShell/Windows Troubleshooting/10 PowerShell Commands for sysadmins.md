# 10 PowerShell commands every sysadmin should know

- [10 PowerShell commands every sysadmin should know](#10-powershell-commands-every-sysadmin-should-know)
  - [1. Get-Help](#1-get-help)
  - [2. Get-Command](#2-get-command)
  - [3. Get-Member](#3-get-member)
  - [4. Out-File](#4-out-file)
  - [5. Export-Csv](#5-export-csv)
  - [6. Get-ChildItem](#6-get-childitem)
  - [7. Out-GridView](#7-out-gridview)
  - [8. Invoke-Item](#8-invoke-item)
  - [9. Foreach](#9-foreach)
  - [10. If statements](#10-if-statements)
  - [On the path to PowerShell stardom](#on-the-path-to-powershell-stardom)

If you're a sysadmin in 2020s, PowerShell is a skill you can no longer afford to ignore. Whether you're automating a complex task, firing off a quick one-liner, or [pranking your coworkers](https://www.pdq.com/blog/technology-jokes-to-crack-up-your-coworkers/), PowerShell should be your go-to scripting language. In fact, two out of two hosts of [The PowerShell Podcast](https://www.pdq.com/resources/the-powershell-podcast/) agree that PowerShell is the best.

Unfortunately, jumping into a new scripting language can be challenging. To help, here are the top 10 PowerShell commands you should become familiar with on your journey to PowerShell mastery.

**Tip:** Commands in PowerShell are actually called cmdlets. While they function similarly, cmdlets are unique in that they are .NET classes and typically deliver objects as output.

## 1. Get-Help

As the name suggests, [`Get-Help`](https://www.pdq.com/powershell/get-help/) is the cmdlet used to interact with PowerShell's integrated help system. It's basically the self-help guide to PowerShell and the very first cmdlet you should familiarize yourself with. In fact, chapter 3 of "[Learn PowerShell in a Month of Lunches](https://www.manning.com/books/learn-powershell-in-a-month-of-lunches)" is dedicated to the `Get-Help` cmdlet, and it goes on for 17 pages!

`Get-Help` provides valuable information about cmdlets, parameters, aliases, etc. It also provides helpful examples to get you started.

Here's the syntax to use `Get-Help`:

![Image 1: Get-Process code example](https://images.ctfassets.net/xwxknivhjv1b/3CzVHm8VJyBdl28wpGjfjl/405a87b399080c9f21a2e086c85fe1df/ps_you_should_know_1.png)

By default, `Get-Help` limits the information returned by the command. Add the `-Full` parameter to view the entire help documentation about a given cmdlet, including descriptions, examples, and additional notes.

`Get-Help <cmdlet_name> -Full`

**Important:** If you are new to PowerShell, you need to update your local help files using the `Update-Help` cmdlet. It's also a good idea to update your PowerShell help files every couple of months to ensure they are current.

## 2. Get-Command

Another important PowerShell cmdlet, especially for newcomers, is [`**Get-Command**`](https://www.pdq.com/powershell/get-command/). `Get-Command`, without additional parameters, returns all cmdlets, functions, and aliases installed on the computer.

![Image 2: Get-Command cmdlet example](https://images.ctfassets.net/xwxknivhjv1b/5RzcVoWnpLfJ7gQuscAFfp/b0e0b98c03ada9a98d1d905e0ff625a7/ps_you_should_know_2.png)

`Get-Command` is a great way to see what commands you can run. However, by default, this command returns over a thousand results, which can be overwhelming. Thankfully, you can narrow down the results by using filters. For example, if I wanted to see what commands deal with certificates, I could filter for that specifically.

`Get-Command -Name *certificate*`

![Image 3: Get-Command example with a filter](https://images.ctfassets.net/xwxknivhjv1b/6SBh5oPIcSWlZah6LPIWfS/0abcc79f1cadfc044c9b5b9c146605bb/ps_you_should_know_3.png)

Most cmdlets use common sense names, so filtering is an intuitive way to track down the cmdlet you're looking for.

## 3. Get-Member

One quality that makes PowerShell so versatile is that almost everything in PowerShell is an object consisting of a name, methods, and properties. We can use the [`Get-Member`](https://www.pdq.com/blog/get-member-in-powershell/) cmdlet to inspect these objects.

`<cmdlet_name> | Get-Member`

![Image 4: Get-Member command example](https://images.ctfassets.net/xwxknivhjv1b/62a7DcxKUO0xSK6AaX7pu4/420835d2e6dfd93250ee6e79244bdea8/ps_you_should_know_4.png)

In this example, I've piped the `Get-Date` cmdlet to the `Get-Member` cmdlet, which returns the object's attributes. I've also added the `-Name *da*` filter to narrow down the results, but you can ignore that for now. Let's break down what's happening in this example.

First, notice the usage of the pipeline operator.

![Image 5: Pipeline operator in PowerShell](https://images.ctfassets.net/xwxknivhjv1b/PXqrsZb1UNLAKdMiTRpYe/52f4d1aa3149c627fae87ae6f8379796/ps_you_should_know_5.png)

The pipeline operator sends the results of the preceding command to the following command. In this example, the results from the `Get-Date` cmdlet are passed to the `Get-Member` cmdlet.

Next, pay attention to the TypeName.

![Image 6: TypeName is the object type being returned](https://images.ctfassets.net/xwxknivhjv1b/1A5cRDHB0Q0OEOaT02yKu6/703808b0484ae0d5ea7c3a72835a385e/ps_you_should_know_6.png)

The TypeName is the type of object that the command returns. In this case, the object type is System.DateTime.

Lastly, notice the MemberTypes returned for the object.

![Image 7: MemberTypes in PowerShell are the methods and properties of an object](https://images.ctfassets.net/xwxknivhjv1b/2TevLdsJTo7rlRWKIgoBes/8c70bf30314d8f9d9e14b3cdbe935ffe/ps_you_should_know_7.png)

MemberTypes is where you'll identify the methods and properties of an object. Methods are actions you can perform against the object, and properties are the object's attributes.

`Get-Member` is an excellent cmdlet, especially for PowerShell beginners, to quickly identify the methods and properties of an object.

## 4. Out-File

Need to save your PowerShell output to a raw text file? [`Out-File`](https://www.pdq.com/powershell/out-file/) is the cmdlet you're looking for.

To use the `Out-File` cmdlet, you can either use the piping operator to pass output to it or the `-InputObject` parameter to specify the objects to be written to the file.

`Get-Process | Out-File C:\Temp\processes.txt`

```powershell
$proc = Get-Process
Out-File C:\Temp\processes.txt -InputObject $proc
```

These commands provide the same results, creating a text file containing the output of the `Get-Process` cmdlet. It's important to note that the information in the text file will be formatted as if sent to the terminal window.

![Image 8: Get-Process results sent to a TXT file](https://images.ctfassets.net/xwxknivhjv1b/4LXGQABg6qZtspHbEQwipQ/36710c36634f894f4d55f2ce1f46bf6a/ps_you_should_know_8.png)

## 5. Export-Csv

If you need to output your data in a more usable format, you'll want to export it to a CSV file using the [`Export-Csv`](https://www.pdq.com/powershell/export-csv/) cmdlet.

`Export-Csv` does what its name implies and exports output to a CSV file. This cmdlet is extremely useful, especially when working with large data sets. However, it's important to point out that `Export-Csv` exports ALL object property values by default, so you'll want to filter the properties to return using the `Select-Object` cmdlet.

`Get-Process | Select-Object -Property ID, ProcessName | Export-Csv C:\CSV\processes.csv`

Here is the resulting CSV file:

![Image 9: CSV exported using the Export-Csv command](https://images.ctfassets.net/xwxknivhjv1b/2gA2qu5KKFErRZD4B7Dpm9/a04ed72301794421449ae47f3441d536/ps_you_should_know_9.png)

## 6. Get-ChildItem

In PowerShell, you'll often need to work with items in containers such as files, certificates, or registries. [`Get-ChildItem`](https://www.pdq.com/powershell/get-childitem/) returns all the items in one or more containers. If you only want to return specific items, you can use filtering to narrow down the results. You can also return items in subdirectories by using the `-Recurse` parameter. To limit the depth of the subdirectory search, use the `-Depth` parameter.

```powershell
Get-ChildItem <folder_name>
```

This example returns all items located in the specified directory.

![Image 10: Get-ChildItem example](https://images.ctfassets.net/xwxknivhjv1b/6eI5BKRiZwZpZLoZ0ZNAm2/2e822cf72b950def30136c7b9ea59bc1/ps_you_should_know_10.png)

This example is a bit more complex and returns all TXT files containing the word "taco" in the specified directory and subdirectories.

```powershell
Get-ChildItem C:\Temp\* -Recurse -Include *taco*.txt
```

![Image 11: Get-ChildItem with a filter results](https://images.ctfassets.net/xwxknivhjv1b/30jNpZgR2c4yQ0B3jrbm2P/6b859a72618558ab527431f189bee69e/ps_you_should_know_11.png)

The results show that this command returned two files, one located in the _C:\\Temp\\Extra_ subdirectory and one in the _C:\\Temp_ directory.

## 7. Out-GridView

Most of the time, PowerShell output returns to the console window. However, if you need to interact with the output, you can use the [`Out-GridView`](https://www.pdq.com/powershell/out-gridview/) cmdlet. `Out-GridView` sends output to a grid view GUI window.

Here's the syntax to use `Out-GridView`:

![Image 12: Out-GridView example](https://images.ctfassets.net/xwxknivhjv1b/7HILA2UAZchSq70Ngzo67k/4715b858130529a7dcbc8cb46b7756a2/ps_you_should_know_14.png)

![Image 13: Out-GridView results](https://images.ctfassets.net/xwxknivhjv1b/4HWyWYMkCzGBthtvMaUgjI/2f2ffa8d94ebe81657b1652be348ac0f/ps_you_should_know_15.png)

In this example, I've piped the `Get-Service` cmdlet to the `Out-GridView` cmdlet. The `Out-GridView` window automatically opened, containing the `Get-Service` command output, allowing me to interact with it.

If we want to take this example even further, we can use the `-PassThru` parameter to send multiple items down the pipeline, essentially letting you pick what output you want to pass on. Let's update this example with the `-PassThru` parameter, and we'll send our selected output to a TXT file.

```powershell
Get-Service | Out-GridView -PassThru | Out-File C:\Files\services.txt
```

When we run this command, the `Out-GridView` window will open as usual. However, because we used the `-PassThru` parameter, we can select the output we want to pipe to the next command.

Hint: Hold the SHIFT key to highlight multiple items, and hold the CTRL key to select individual items. Click **OK** when you've finished selecting items.

![Image 14: Out-GridView example with the -PassThru parameter](https://images.ctfassets.net/xwxknivhjv1b/3BsJJeNZOX7TwwgFEeHhNc/f7a12b77adbded665bf1de3d31e321e3/ps_you_should_know_16.png)

Once we've made our selection and clicked **OK**, the output is sent to a text file. We can open the text file to ensure it contains the items we selected.

## 8. Invoke-Item

The [`**Invoke-Item**`](https://www.pdq.com/powershell/invoke-item/) cmdlet launches items, including files, pictures, executables, etc. It can also launch more than one item at a time. `Invoke-Item` uses the default file association to determine the application to launch with the corresponding file type.

Here is the basic structure of an `Invoke-Item` command:

![Image 15: Invoke-Item example](https://images.ctfassets.net/xwxknivhjv1b/4bEnNJP5LiXECrDQVo7dja/c0f24fba3bc2fcda5ac17608ef672381/ps_you_should_know_18.png)

This example launches the indicated TXT file in Notepad.exe because of the default application assignment on my computer.

![Image 16: Launching a TXT file with the Invoke-Item command](https://images.ctfassets.net/xwxknivhjv1b/1Ru4uCBSaB5B13XkUtkEa2/65e368dcb22c0c666c3b64448929dcd0/ps_you_should_know_19.png)

As mentioned above, `Invoke-Item` can also be used to open several files at once. This command will open all TXT files in the _C:\\Temp_ folder at once.

```powershell
Invoke-Item "C:\Temp\*.txt"
```

## 9. Foreach

[`**Foreach**`](https://www.pdq.com/blog/how-to-use-foreach-in-powershell/) loops iterate through a collection of items, performing actions against them. `Foreach` loops are a little more complex than the other commands we've covered so far. However, `foreach` loops become increasingly crucial as you dive into more advanced PowerShell tasks.

Here is the basic format of a `foreach` command in PowerShell:

```powershell
foreach ($<item> in $<collection>){<statement list>}
```

Here's a simple example of a `foreach` command that will identify files in a specified folder that are 0 KB in size.

```powershell
$files = Get-ChildItem -Path C:\Files

foreach ($file in $files) {
    if ($file.Length -eq 0kb) {
        Write-Host $file
    }
}
```

![Image 17: Foreach loop example](https://images.ctfassets.net/xwxknivhjv1b/1IMb2pX1I56q0v2UWKeHzl/efc8ee9cdd03a0978692225f3710d103/ps_you_should_know_12.png)

In this example, we assign the items located at _C:\\Files\\_ to the `$files` variable. Then, we use the `foreach` command to loop through each item in the variable. Next, we're using an `if` statement to determine if the file is equal to 0 KB. If the file is equal to 0 KB, the file is output to the console. The loop repeats until it has processed each item in the collection assigned to the variable `$files`.

We can check the folder for ourselves to ensure the data returned was accurate.

![Image 18: Verifying the results of the foreach loop script](https://images.ctfassets.net/xwxknivhjv1b/6uSFu0zybs4uxrtjqs2ODn/284a039337d37337bcfa9b96f774f9e8/ps_you_should_know_13.png)

## 10. If statements

Capping off our top 10 list is another slightly more advanced command. Don't worry. You were already exposed to it in the previous example and probably didn't even realize it.

`If` statements are another extremely useful command in PowerShell. `If` statements execute logic based on conditions being met, similar to how people make decisions. For example, if I won the lottery, I would enjoy an early retirement. If not, then I would continue to upload amazing content to the internet. PowerShell can use the same kind of logic.

Here's what the structure of an `if` statement looks like in PowerShell.

```powershell
if ($<condition>){
    <function to perform if the condition is true>
}
```

When a condition is true, the function executes. If the condition returns false, it bypasses the function and proceeds to process the remainder of the script. For example:

```powershell
$var = 42

If ($var -eq 42){
    Write-Host "Congratulations. 42 is the meaning of life, the universe, and everything."
}
```

In this example, since the variable `$var` equals 42, and the condition is met, the `Write-Host` command will execute, and the message will display. If the variable equaled something different, like 24, the condition would return false, and the `Write-Host` command would not execute.

Here's one more example of an `if` statement in use. This time, we'll use the `Get-Date` cmdlet and format it to return the month and day. If the date is equal to 12/25, a message will display saying, "Merry Christmas, ya filthy animal."

```powershell
$date = Get-Date -Format "MM/dd"

if ($date -eq "12/25") {
    Write-Host "Merry Christmas, ya filthy animal."
}
```

## On the path to PowerShell stardom

Like any scripting language, PowerShell can take a bit of getting used to. But Microsoft and the PowerShell team have worked hard to ensure that cmdlets and functionality make sense, especially once you start utilizing PowerShell regularly.

Starting with these easier commands will help you quickly progress into using more advanced commands. Then one day, you'll become a PowerShell master and may even be invited as a guest onto the [The PowerShell Podcast](https://www.pdq.com/resources/the-powershell-podcast/), the most prestigious of all PDQ-hosted PowerShell podcasts.
