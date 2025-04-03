<!-- title: Diagnosing common Windows problems with PowerShell troubleshooting packs -->
# Diagnosing common Windows problems with PowerShell troubleshooting packs

<!-- vscode-markdown-toc -->
- [Diagnosing common Windows problems with PowerShell troubleshooting packs](#diagnosing-common-windows-problems-with-powershell-troubleshooting-packs)
  - [1. Hunting down the root causes](#1-hunting-down-the-root-causes)
  - [2. Troubleshooting packs: Each a little different](#2-troubleshooting-packs-each-a-little-different)

<!-- vscode-markdown-toc-config
    numbering=true
    autoSave=true
    /vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

Although Windows 10 is the most stable and reliable version of Windows that Microsoft has created in quite some time, things can, and occasionally do go wrong. Thankfully, there are a number of different diagnostic and troubleshooting tools built into the operating system. In fact, you can diagnose a wide variety of Windows problems through PowerShell by leveraging the built-in troubleshooting packs.

Troubleshooting packs are essentially collections of diagnostic tests that are all related to a specific area of the system. You can see a list of all of the available troubleshooting packs by opening PowerShell, navigating to C:\\Windows\\Diagnostics\\System, and then entering the Get-ChildItem | Select-Object Name command. As you can see in the figure below, there are currently 17 different troubleshooting packs available, covering everything from audio to printers.

![PowerShell troubleshooting](https://techgenix.com/tgwordpress/wp-content/uploads/2019/06/Troubleshooting-Packs-1.jpg)

To use the troubleshooting packs, you will have to specify the [Get-TroubleshootingPack cmdlet][1], followed by the name of the troubleshooting pack that you want to use. If you want to perform network diagnostics for instance, you would enter the Get-TroubleshootingPack cmdlet, followed by the word Networking.

Before I continue, I wish to point out that the reason why I am able to get away with using a simplified command such as Get-TroubleshootingPack Networking is because I am working from within the C:\\Windows\\Diagnostics\\System folder. If you try to run a troubleshooting pack from another location, you will usually have to provide a full path. The command looks like this:

```powershell
Get-TroubleshootingPack -Path "C:\Windows\Diagnostics\System\Networking"
```

So now that I have explained how to access a troubleshooting pack, let's take a look at what happens when you run a troubleshooting pack. For the following examples, I am going to be using the Windows Update troubleshooting pack, but the process works in basically the same way regardless of which troubleshooting pack you use.

So with that said, when you run the Get-TroubleshootingPack cmdlet and specify the name of an individual troubleshooting pack, the initial results are not exactly helpful. As you can see in the figure below, Windows initially provides some version information, and not much more.

![PowerShell troubleshooting](https://techgenix.com/tgwordpress/wp-content/uploads/2019/06/Troubleshooting-Packs-2.jpg)

Running the troubleshooting pack in this way isn't exactly helpful, but there is quite a bit of useful information contained within the troubleshooting pack. Before I show you how to extract that information though, I want to show you how to find out what the troubleshooting pack does, and how to tell if it will work on your system. The reason why this is important is because some troubleshooting packs are designed for Windows 10, while others might only work on Windows Server.

The system that I am using to generate the screen captures in this article is running a 64-bit edition of Windows 10. Therefore, if I wanted to know what the Windows Update troubleshooting pack does and whether or not it will work on my system, I would use a command like this one:

Get-TroubleshootingPack WindowsUpdate | Select-Object Name, Description, SupportsClient, SupportsAmd64

As you can see in the figure below, the SupportsClient field shows a value of "True," meaning that the pack will run on Windows 10. Similarly, the SupportsAmd64 column is also showing a value of true, meaning that the pack will work on a 64-bit operating system. The values that you can use to test whether or not a troubleshooting pack is supported include:

* SupportsClient  
* SupportsServer  
* SupportsX86  
* SupportsAmd64  
* SupportsIA64

![PowerShell troubleshooting](https://techgenix.com/tgwordpress/wp-content/uploads/2019/06/Troubleshooting-Packs-3-1.jpg)

So now let's take a look at how to use a troubleshooting pack to determine what is wrong with a system. Rather than running the Get-TroubleshootingPack cmdlet directly, it is usually going to be easier to [map the cmdlet to a variable][2]. Therefore, I am going to use a variable named $Diag. Here is the command:

```powershell
$Diag = Get-TroubleshootingPack WindowsUpdate
```

##  1. <a name='Huntingdowntherootcauses'></a>Hunting down the root causes

Once the variable has been created, we can begin to look for the root causes of the problems that we are experiencing. Each troubleshooting pack can test for a variety of conditions. To see a list of the tests, just enter the variable name, followed by a period, and the word RootCauses. The figure below shows the potential root causes of a Windows Update failure.

![PowerShell troubleshooting](https://techgenix.com/tgwordpress/wp-content/uploads/2019/06/Troubleshooting-Packs-4-1.jpg)

So now let's run the troubleshooting pack. To do so, pipe the previously created variable to the Invoke-TroubleshootingPack cmdlet. You can see what this looks like in the next figure.

![PowerShell troubleshooting](https://techgenix.com/tgwordpress/wp-content/uploads/2019/06/Troubleshooting-Packs-5.jpg)

In this case, no problems were found. In all honesty, I would have been surprised if problems were detected, because Windows Update is working fine. Had a problem been detected though, Windows would have provided information on how to correct the problem.

Just for the sake of demonstration, however, let's pretend that we had received a message stating that Windows Update components needed to be repaired. Troubleshooting packs will usually provide you with a recommended resolution, but there is a way to manually get more information if necessary. For example, the Windows Update troubleshooting pack might indicate that Windows Update is failing because there are pending system changes that require the system to be rebooted before additional updates can be installed.

##  2. <a name='Troubleshootingpacks:Eachalittledifferent'></a>Troubleshooting packs: Each a little different

One thing that I have found when working with the various troubleshooting packs within Windows is that each one is a little bit different. Some troubleshooting packs, like the Windows Update pack, simply examine the system and provide you with a result. Other troubleshooting packs, like the Networking pack, actually require a bit of interactivity. In fact the Networking troubleshooting pack prompts you for an instance ID, and then presents you with a menu of nine different types of tests that you can perform. Regardless of how a troubleshooting pack actually behaves, however, the basic command structure remains the same across troubleshooting packs.

[1]: https://docs.microsoft.com/en-us/powershell/module/troubleshootingpack/get-troubleshootingpack?view=win10-ps
[2]: https://techgenix.com/mapping-powershell-commands/
