---
created: 2022-03-04T13:58:29 (UTC +01:00)
tags: []
source: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html
author: sdwheeler
---

# 

> ## Excerpt
> Erläutert die Methoden zum Ausführen von Befehlen auf Remotesystemen mithilfe von PowerShell.

---
## Ausführen von Remotebefehlen

-   Artikel
-   01.03.2022
-   3 Minuten Lesedauer

### Ist diese Seite hilfreich?

Haben Sie weiteres Feedback für uns?

Feedback wird an Microsoft gesendet: Wenn Sie auf die Sendeschaltfläche klicken, wird Ihr Feedback verwendet, um Microsoft-Produkte und -Dienste zu verbessern. [Datenschutzrichtlinie](https://privacy.microsoft.com/en-us/privacystatement)

Vielen Dank.

### In diesem Artikel

1.  [Windows PowerShell-Remoting ohne Konfiguration](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#windows-powershell-remoting-without-configuration)
2.  [Windows PowerShell-Remoting](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#windows-powershell-remoting)
3.  [Weitere Informationen](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also)

Mit einem einzigen PowerShell-Befehl können Sie Befehle auf einem oder Hunderten von Computern ausführen. Windows PowerShell unterstützt das Remotecomputing mithilfe verschiedener Technologien, unter anderem WMI, RPC und WS-Management.

PowerShell unterstützt WMI, WS-Management und SSH-Remoting. In PowerShell 6 wird RPC nicht mehr unterstützt. Ab PowerShell 7 wird RPC nur in Windows unterstützt.

Weitere Informationen zum Remoting in PowerShell finden Sie in den folgenden Artikeln:

-   [SSH-Remoting in PowerShell](https://docs.microsoft.com/de-de/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core?view=powershell-7.2)
-   [WSMan-Remoting in PowerShell](https://docs.microsoft.com/de-de/powershell/scripting/learn/remoting/wsman-remoting-in-powershell-core?view=powershell-7.2)

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#windows-powershell-remoting-without-configuration)Windows PowerShell-Remoting ohne Konfiguration

Viele Windows PowerShell-Cmdlets verfügen über einen „ComputerName“-Parameter, mit dessen Hilfe Sie Daten auf einem oder mehreren Remotecomputern sammeln und Einstellungsänderungen vornehmen können. Diese Cmdlets verwenden unterschiedliche Kommunikationsprotokolle und funktionieren auf allen Windows-Betriebssystemen ohne besondere Konfiguration.

Zu diesem Cmdlets zählen:

-   [Restart-Computer](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/restart-computer)
-   [Test-Connection](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/test-connection)
-   [Clear-EventLog](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/clear-eventlog)
-   [Get-EventLog](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/get-eventlog)
-   [Get-HotFix](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/get-hotfix)
-   [Get-Process](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/get-process)
-   [Get-Service](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/get-service)
-   [Set-Service](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/set-service)
-   [Get-WinEvent](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.diagnostics/get-winevent)
-   [Get-WmiObject](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.management/get-wmiobject)

In der Regel weisen Cmdlets, die Remoting ohne besondere Konfiguration unterstützen, den „ComputerName“-Parameter und nicht den „Session“-Parameter auf. Um diese Cmdlets in Ihrer Sitzung zu finden, geben Sie Folgendes ein:

```powershell
Get-Command | where { $_.parameters.keys -contains "ComputerName" -and $_.parameters.keys -notcontains "Session"}
```

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#windows-powershell-remoting)Windows PowerShell-Remoting

Über das WS-Management-Protokoll können Sie mit Windows PowerShell-Remoting jeden Windows PowerShell-Befehl auf einem oder mehreren Remotecomputern ausführen. Sie können dauerhafte Verbindungen herstellen, interaktive Sitzungen starten und Skripts auf Remotecomputern ausführen.

Um Windows PowerShell-Remoting zu verwenden, muss der Remotecomputer für die Remoteverwaltung konfiguriert sein. Weitere Informationen und Anweisungen hierzu finden Sie unter [Informationen zu Remoteanforderungen](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_remote_requirements).

Nachdem Sie Windows PowerShell-Remoting konfiguriert haben, stehen Ihnen viele Remotingstrategien zur Verfügung. In diesem Artikel werden nur einige davon aufgeführt. Weitere Informationen finden Sie unter [Informationen zu Remote](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_remote).

### [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#start-an-interactive-session)Starten einer interaktiven Sitzung

Um eine interaktive Sitzung mit einem einzelnen Remotecomputer zu starten, verwenden Sie das Cmdlet [Enter-PSSession](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/enter-pssession). Um beispielsweise eine interaktive Sitzung mit dem Remotecomputer „Server01“ zu starten, geben Sie Folgendes ein:

```powershell
Enter-PSSession Server01
```

Die Eingabeaufforderung ändert sich, und es wird der Name des Remotecomputers angezeigt. Alle Befehle, die Sie an der Eingabeaufforderung eingeben, werden auf dem Remotecomputer ausgeführt, und die Ergebnisse werden auf dem lokalen Computer angezeigt.

Um die interaktive Sitzung zu beenden, geben Sie Folgendes ein:

```powershell
Exit-PSSession
```

Weitere Informationen über die Cmdlets „Enter-PSSession“ und „Exit-PSSession“ finden Sie unter:

-   [Enter-PSSession](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/enter-pssession)
-   [Exit-PSSession](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/exit-pssession)

### [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#run-a-remote-command)Ausführen eines Remotebefehls

Zum Ausführen eines Befehls auf einem oder mehreren Computern verwenden Sie das Cmdlet [Invoke-Command](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/invoke-command). Um beispielsweise einen [Get-UICulture](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.utility/get-uiculture)\-Befehl auf den Remotecomputern „Server01“ und „Server02“ auszuführen, geben Sie Folgendes ein:

```powershell
Invoke-Command -ComputerName Server01, Server02 -ScriptBlock {Get-UICulture}
```

Die Ausgabe wird an den Computer zurückgegeben.

```powershell
LCID    Name     DisplayName               PSComputerName
----    ----     -----------               --------------
1033    en-US    English (United States)   server01.corp.fabrikam.com
1033    en-US    English (United States)   server02.corp.fabrikam.com
```

### [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#run-a-script)Ausführen eines Skripts

Zum Ausführen eines Skripts auf einem oder mehreren Remotecomputern verwenden Sie den Parameter „FilePath“ des Cmdlets `Invoke-Command`. Das Skript muss sich auf dem lokalen Computer befinden oder für diesen verfügbar sein. Die Ergebnisse werden an den lokalen Computer zurückgegeben.

Der folgende Befehl führt beispielsweise das Skript „DiskCollect.ps1“ auf den Remotecomputern „Server01“ und „Server02“ aus.

```powershell
Invoke-Command -ComputerName Server01, Server02 -FilePath c:\Scripts\DiskCollect.ps1
```

### [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#establish-a-persistent-connection)Herstellen einer dauerhaften Verbindung

Verwenden Sie das Cmdlet `New-PSSession`, um eine permanente Sitzung auf einem Remotecomputer zu erstellen. Das folgende Beispiel erstellt Remotesitzungen auf „Server01“ und „Server02. Die Sitzungsobjekte werden in der Variablen `$s` gespeichert.

```powershell
$s = New-PSSession -ComputerName Server01, Server02
```

Nachdem die Sitzungen nun hergestellt sind, können Sie jeden beliebigen Befehl in diesen ausführen. Und da die Sitzungen permanent sind, können Sie Daten von einem Befehl sammeln und in einem anderen Befehl verwenden.

Beispielsweise führt der folgende Befehl einen „Get-HotFix“-Befehl in den Sitzungen in der Variablen „$s“ aus und speichert die Ergebnisse dann in der Variablen „$h“. Die Variable „$h“ wird in jeder der Sitzungen in „$s“ erstellt, ist jedoch in der lokalen Sitzung nicht vorhanden.

```powershell
Invoke-Command -Session $s {$h = Get-HotFix}
```

Nun können Sie die Daten in der Variablen `$h` in der gleichen Sitzung mit anderen Befehlen verwenden. Die Ergebnisse werden auf dem lokalen Computer angezeigt. Beispiel:

```powershell
Invoke-Command -Session $s {$h | where {$_.InstalledBy -ne "NT AUTHORITY\SYSTEM"}}
```

### [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#advanced-remoting)Erweitertes Remoting

Dies sind nur die grundlegenden Möglichkeiten, die die Remoteverwaltung von Windows PowerShell bietet. Mithilfe von Cmdlets, die mit Windows PowerShell installiert werden, können Sie Remotesitzungen sowohl von lokaler Seite als auch von Remoteseite aus einrichten und konfigurieren, angepasste und eingeschränkte Sitzungen erstellen, Benutzern über eine Remotesitzung den Import von Befehlen ermöglichen, die tatsächlich implizit in der Remotesitzung ausgeführt werden, die Sicherheit einer Remotesitzung konfigurieren und vieles mehr.

Windows PowerShell umfasst einen WSMan-Anbieter. Der Anbieter erstellt ein `WSMAN:`\-Laufwerk, dass es Ihnen ermöglicht, durch eine Hierarchie von Konfigurationseinstellungen auf dem lokalen Computer und den Remotecomputern zu navigieren.

Weitere Informationen zum WSMan-Anbieter finden Sie unter [WS-Management-Anbieter](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.wsman.management/about/about_wsman_provider) und [Informationen zu WS-Management-Cmdlets](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.wsman.management/about/about_ws-management_cmdlets). Geben Sie alternativ in der Windows PowerShell-Konsole `Get-Help wsman` ein.

Weitere Informationen finden Sie in folgenden Quellen:

-   [FAQs zu PowerShell-Remoting](https://docs.microsoft.com/de-de/powershell/scripting/learn/remoting/powershell-remoting-faq?view=powershell-7.2)
-   [Register-PSSessionConfiguration](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/previous-versions/powershell/module/microsoft.powershell.core/register-pssessionconfiguration)
-   [Import-PSSession](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/previous-versions/powershell/module/microsoft.powershell.utility/import-pssession)

Hilfe zu Remotingfehlern finden Sie unter [about\_Remote\_Troubleshooting](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_Remote_Troubleshooting).

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also)Weitere Informationen

-   [about\_Remote](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_remote_faq)
-   [about\_Remote\_Requirements](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_remote_requirements)
-   [about\_Remote\_Troubleshooting](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_Remote_Troubleshooting)
-   [about\_PSSessions](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_PSSessions)
-   [about\_WS-Management\_Cmdlets](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.wsman.management/about/about_ws-management_cmdlets)
-   [Invoke-Command](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/previous-versions/powershell/module/microsoft.powershell.core/invoke-command)
-   [Import-PSSession](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/previous-versions/powershell/module/microsoft.powershell.utility/import-pssession)
-   [New-PSSession](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/previous-versions/powershell/module/microsoft.powershell.core/new-pssession)
-   [Register-PSSessionConfiguration](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/previous-versions/powershell/module/microsoft.powershell.core/register-pssessionconfiguration)
-   [WSMan-Anbieter](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.wsman.management/about/about_wsman_provider)

## Feedback

Feedback senden und anzeigen für
