chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html

> Creating Runspaces

# Creating Runspaces - PowerShell
## Creating Runspaces

-   Artikel
-   18.12.2023

## In diesem Artikel

1.  [Runspace tasks](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#runspace-tasks)
2.  [See Also](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also)

A runspace is the operating environment for the commands that are invoked by a host application. This environment includes the commands and data that are currently present, and any language restrictions that currently apply.

Host applications can use the default runspace that is provided by Windows PowerShell, which includes all available core commands, or create a custom runspace that includes only a subset of the available commands. To create a customized runspace, you create a [System.Management.Automation.Runspaces.Initialsessionstate](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/dotnet/api/System.Management.Automation.Runspaces.InitialSessionState) object and assign it to your runspace.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#runspace-tasks)

## Runspace tasks

1.  [Creating an InitialSessionState](https://learn.microsoft.com/de-de/powershell/scripting/developer/hosting/creating-an-initialsessionstate?view=powershell-7.5)
    
2.  [Creating a constrained runspace](https://learn.microsoft.com/de-de/powershell/scripting/developer/hosting/creating-a-constrained-runspace?view=powershell-7.5)
    
3.  [Creating multiple runspaces](https://learn.microsoft.com/de-de/powershell/scripting/developer/hosting/creating-multiple-runspaces?view=powershell-7.5)
    

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also)

## See Also

Zusammenarbeit auf GitHub

Die Quelle für diesen Inhalt finden Sie auf GitHub, wo Sie auch Issues und Pull Requests erstellen und überprüfen können. Weitere Informationen finden Sie in unserem [Leitfaden für Mitwirkende](https://learn.microsoft.com/powershell/scripting/community/contributing/powershell-style-guide).
