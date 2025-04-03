# Top 3 PowerShell modules

URL Source: [https://www.pdq.com/blog/top-powershell-modules/](https://www.pdq.com/blog/top-powershell-modules/)
Published Time: 2023-10-19T11:00-05:00

- [Top 3 PowerShell modules](#top-3-powershell-modules)
  - [All About PowerShell](#all-about-powershell)
  - [1. PSReadLine](#1-psreadline)
  - [2. dbatools](#2-dbatools)
  - [3. PowerShellAI](#3-powershellai)
  - [Bonus: Image2Text](#bonus-image2text)

## All About PowerShell

There is no better tool for a system administrator than PowerShell. It cuts down time spent on tasks, automates away recurring tasks, and gets you access to data to help you focus on what's most important. Because PowerShell is so valuable, a lot of very smart people are out there creating modules to extend its value to you. Let's take some time to highlight my favorite modules and how we can utilize them.

## 1. PSReadLine

This one is an easy first call for me. I could write an entire article on just this module, and my team would make me trim it down because it's too long. PSReadLine is the ultimate tool to get the most value out of PowerShell. The module adds several features that just make everything easier. You have the history it can pull up to cut down on the time spent typing.

![Image 1: Example of pulling up history with PSReadLine][1]

You can use it to open inline help, which takes you to the help documentation and even to the section of the command you are working on without needing to step out of your session.

![Image 2: Example of inline help with PSReadLine][2]

Then, I pressed **F1** to open the help menu.

![Image 3: Example of inline help with PSReadLine][3]

It can also utilize AI predictors for modules you are currently using, making recommendations specific to larger modules to help you get results more quickly. The best current example of this is the Azure feedback provider, which helps sift through the thousands of commands to get what you need very fast. There is so much to this one; I recommend you check out the [PSReadLine 2.2 GA article by Jason Helmick][4] for a quick look into all it can do.

## 2. dbatools

The dbatools module steps out of general sysadmin and into database administration. This module is massive and provides everything you need to make sure your SQL is its best self. As Jeffrey Snover put it, "If you use SQL, someone on your team should be a dbatools pro."

If you are looking to become an expert on keeping your databases clean, this module is so robust that there's a [dbatools book][5] on how to get the most out of it.

## 3. PowerShellAI

There have been several entries into getting the most out of AI with PowerShell, but Doug Finke's seems to be gaining the most steam. For a super accurate real-world example, let's say I was automating out some task when, all of a sudden, I desperately needed to know who owned the NFL combine bench press record. Well ... bam!

![Image 4: Example of using PowerShellAI to conduct research][6]

Some people may use it to research commands and as an aid to get the most out of those commands, but those who know its true value use it for mundane trivia.

But that's not all it can do. You also can use DALL-E if the need for a random AI image arises. The value here is too great to measure.

```powershell
Get-DalleImage "Velociraptor doing the macarena"
```

![Image 5: AI-generated image of a velociraptor doing the Macarena][7]

## Bonus: Image2Text

There's no better way to highlight this than by combining the DALL-E image from the PowerShellAI module with this module. I saved myself a thousand words here.

```powershell
$Image = Get-DalleImage "Kitten kungfu fighting an alligator"
New-Image2Text -ImagePath $Image -OutputTxtPath C:\temp\kitten.txt
```

![Image 6: AI-generated image of a kitten kung fu fighting an alligator][8]

I have never struggled to write a blog this much. There are thousands of modules, and picking a favorite is not easy. Then I have limited space to do the write-up for each, and it feels inadequate. I do know that if you have ever thought to yourself, "I wish PowerShell could do X," you are not the first to think it, and someone likely has built a module to help you out.

[![Image 8: PatchTuesday orange][12]][13]

[1]: https://images.ctfassets.net/xwxknivhjv1b/5njNCVKxc5cVkofJMdbaAV/36e5b4186276b314ac702b460f872fbf/2023-09-14_11-37-44.jpg
[2]: https://images.ctfassets.net/xwxknivhjv1b/1SgIeixxsAEfRV4w4ViQGW/4981b00a4a35cdc9492d95ffb9bee754/2023-09-14_11-50-19.jpg
[3]: https://images.ctfassets.net/xwxknivhjv1b/1AwZwqwSNfNACLlEWMYHcL/1cdad1623d6e49d4f445989f4ddac6c0/2023-09-14_11-51-28.jpg
[4]: https://devblogs.microsoft.com/powershell/psreadline-2-2-ga/
[5]: https://www.manning.com/books/learn-dbatools-in-a-month-of-lunches
[6]: https://images.ctfassets.net/xwxknivhjv1b/6VKpWm6VMdljh5zM9ky61K/0f9e5761b959113f6b942a70defacfe4/2023-09-14_12-14-38.jpg
[7]: https://images.ctfassets.net/xwxknivhjv1b/7jd97dviSEphQO03FeQkaG/0422f061403ae39f6e4989cd016adc19/PowerShellAI_image.png
[8]: https://images.ctfassets.net/xwxknivhjv1b/5i0RsStppA3BMznUyuThYc/e29b7e9ab00fb101caf31a97b0d12c59/Image2Text.png
[12]: https://images.ctfassets.net/xwxknivhjv1b/3gR9V4860EAxCsNHqQ2FA5/3ae730bf8438e73245b15b428f8031ba/PatchTuesday_orange.png?q=80&w=2000&h=1000&fm=png&fl=png8
[13]: https://www.pdq.com/blog/patch-tuesday-june-2024/
