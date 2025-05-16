https://www.leeholmes.com/bgshell-background-shell/

> Precision Computing - Software Design and Development

# BgShell - Background Shell
### BgShell - Background Shell

Fri, Mar 28, 2008 3-minute read

![](https://www.leeholmes.com/images/blog_content/bgshell.gif)

\[Download: [BgShell.zip](https://www.leeholmes.com/projects/BgShell/BgShell.zip)\]

BgShell is a proof of concept PowerShell host that explores the idea of “PowerShell Everywhere.”

What if PowerShell was always at your fingertips – making quick calculations easier than launching Windows Calculator? Or, making a “quick ipconfig” with PowerShell just a keystroke away? BgShell offers PowerShell Everywhere, and instant gratification. Simply press Control-Alt-B, and the BgShell interface appears immediately. Press Control-Alt-B again to hide the shell. Closing the window only hides the shell, keeping it instantly available for your next command.

The concept of “PowerShell Everywhere” goes further than that, though. What if you could bind PowerShell script blocks to arbitrary keystrokes? BgShell supports that, too. If you use any keyboard Macro programs, BgShell can likely replace them – and with a more powerful engine and scripting language, at that.

BgShell lets you define these in a host-specific profile. If you tend to write the same thing over and over, just define a hotkey for it:

```powershell
## Boy, I type this a lot. 
$keyMapping['Control,Alt,Q'] = @{ 
    Action = { 
        SendString 'PowerShell Rocks!' 
    } 
}
```

Or, rather than batting the mouse cursor out of the way when it obscures your typing, just press a hotkey:

```powershell
## Move the annoying mouse pointer out of your way 
$keyMapping['Control,Alt,Z'] = @{ 
    Action = { 
        [Windows.Forms.Cursor]::Position = (New-Object System.Drawing.Point 0,0) 
    } 
}
```

Or even bring some of your old Unix habits to the Win32 console:

```powershell
$keyMapping['Control,L'] = @{ 
    KeypressHandled = { 
        IsClassActive 'ConsoleWindowClass' 
    }; 
## Console clear 
    Action = { 
        SendKeys '{ESC}cls{ENTER}' 
    } 
}
```

At the same time, you’ve been building new habits in PowerShell. Why not cater to them?

```powershell
$keyMapping['Control,F'] = @{ 
    KeypressHandled = { 
        IsClassActive 'ConsoleWindowClass' 
    }; 
    ## Console foreach-object 
    Action = { 
        SendString '| foreach { $_. }'; 
        SendKeys '{LEFT}{LEFT}' 
    } 
}
```

Keystroke automation of other programs opens up entire new realms of interactive management potential:

```powershell
## Control,Alt,C -- Convert selected text in an Outlook Message ## into a code sample $keyMapping['Control,Alt,C'] = @{ KeypressHandled = { IsClassActive '_WwG' }; Action = { Start-Sleep -m 100 SendKeys "%o" Start-Sleep -m 500 SendString "ff" Start-Sleep -m 500 SendString "Courier New" SendKeys "{ENTER}" Start-Sleep -m 500 SendKeys "%o" Start-Sleep -m 500 SendString "fs" Start-Sleep -m 500 SendString "9" SendKeys "{ENTER}" Start-Sleep -m 500 } }
```

Of course, your brain starts to hurt with so many hotkeys. In that case, maybe a memorable phrase is better?

```powershell
## Get the current date $stringMapping[ "**date" ] = { SendString (Get-Date) }
```

How about saving yourself from the tedium of template code?

```powershell
## Get some input from the user function Get-Input { param ($message = "Input : ", $title = "Inputbox") $vbs = New-Object -com MSScriptControl.ScriptControl $vbs.language = 'vbscript' $vbs.addcode("function getInput() getInput = inputbox(`"$message`",`"$title`") end function") $result = $vbs.Eval('getInput') $result } ## Generate a C# property $stringMapping[ "**prop " ] = { $template = @" /// <summary> /// Summary of what this property does /// </summary> public __TYPE__ __NAME__ { get { return __NAMELOWER__; } set { __NAMELOWER__ = value; } } private __TYPE__ __NAMELOWER__; "@ $type,$name = (Get-Input -Message "Property type and name, such as 'String Foo': ") -split " " $template = $template.Replace("__TYPE__", $type) $template = $template.Replace("__NAME__", $name) $template = $template.Replace("__NAMELOWER__", ($name.Substring(0,1).ToLower() + $name.Substring(1))) $autoIt.ClipPut($template) }
```

The sky really is the limit.

For more examples, see the example profile. Place it in the same directory as your regular PowerShell profile. BgShell surfaces this profile location through the standard $profile variable.

Note

*Vista introduces security enhancements that prevent low-privilege applications from being notified of keystrokes in (or sending keystrokes to) high-privilege applications. BgShell is marked to run as administrator so that it can respond in elevated windows.*
