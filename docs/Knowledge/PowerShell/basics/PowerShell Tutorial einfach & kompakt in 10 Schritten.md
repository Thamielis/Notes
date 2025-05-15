Überblick
---------

Dieses PowerShell Tutorial richtet sich an:

*   **Einsteiger** oder auch IT-Profis die von der PowerShell gehört haben aber **keine klare Vorstellung haben** was PowerShell eigentlich ist.
*   EDVler die ein **privates oder berufliches Interesse** haben, sich mit der PowerShell zu beschäftigen zu wollen.
*   **IT-Mitarbeiter** die mit der Aufgabenautomatisierung und Konfigurationsverwaltung von IT-System beauftragt wurden und einen Überblick suchen.
*   Schüler und Studenten die erste Erfahrungen mit dem Thema **Programmieren** machen wollen.

 ![[images/PowerShell-5-Icon.png]]

PowerShell 5.0 Icon

Dieses PowerShell Tutorial bietet einen **einsteigerfreundlichen** Überblick und Zusammenfassung der PowerShell. Sie erfahren in kompakten Schritten was nötigt ist, um PowerShell sicher betreiben zu können und welche Tools sinnvoll sind. In diesem PowerShell Tutorial bekommen Sie erklärt wie PowerShell und Tools installiert werden und wie Sie diese benutzten.

Dieser PowerShell Tutorial zeigt Ihnen Einfach und Verständlich für was und für wenn PowerShell sinnvoll ist und **klärt wichtige Bergriffe**, um im PowerShell-Jungle überleben zu können.

 ![[images/PowerShell-Console-PwSh7-Beispiel-1.jpg]]

Was ist PowerShell - PowerShell 7 Konsole

Für Ihre ersten Schritte bekommen Einsteiger das Verständnis an die Hand, um autark kleinere Aufgaben zu lösen. Dieses PowerShell Tutorial zeigt wie Sie die Hilfe verwenden, Cmdlets finden, benutzen und die Pipeline einsetzen.

> Für ein schnelles produktives durchstarten am Arbeitsplatz empfehle ich Ihnen Seminare. Egal ob Einsteiger oder Profi fündig werden Sie unter [PowerShell Seminare](https://attilakrick.com/powershell/powershell-seminare/).  
> **Gerne unterstütze ich Sie** in Ihrem PowerShell-Vorhaben.

Was ist PowerShell
------------------

PowerShell ist ein Microsoft-Framework zur plattformübergreifenden **Aufgabenautomatisierung und Konfigurationsverwaltung** und bestehend aus einem **Kommandozeileninterpreter und einer Skriptsprache**.

Die PowerShell verbindet die aus Unix-Shells bekannte Philosophie von Pipes und Filtern mit dem Paradigma der objektorientierten Programmierung. Im Gegensatz zu den meisten Shells, bei denen Text eingegeben und zurückgegeben wird, basiert PowerShell auf .NET und **akzeptiert .NET-Objekte und gibt diese zurück**.

Die PowerShell richtet sich sowohl an Einsteiger als auch an Profis. Diese können wie bisher **einfache Befehle** an einer Kommandozeile ausführen und miteinander über Pipeline `|` verknüpfen oder aber auch **komplexe Skript-Programme** mit der eigens dafür entwickelten `PowerShell Scripting Language` schreiben.

> HINWEIS - PowerShell wird offiziell mit PS, PWSH und inoffiziell POSH abgekürzt.

**Warum sollten Sie PowerShell benutzen?**  
Mit der PowerShell kann man einfache Befehle wie die aktuelle Uhrzeit oder den Inhalt eines Ordners anzeigen lassen, als auch sehr komplexe Automatisierungs- und Systemverwaltungslösungen ausführen. Auch die Kombination mehrere Befehle mittels der Pipeline sind möglich. Alternativ lassen sich sogar selbst erstellte Befehle oder von Dritthersteller in die Konsole einbinden. Da die PowerShell auf das gigantische Backend von .NET zugreift, ist die Grenz nur die eigene Fantasie.

*   PowerShell ermöglicht den vollständigen **Zugriff auf .NET**
*   PowerShell liefert von Haus aus einfache Möglichkeiten um Server- und Workstation-Systeme zu **verwalten**
*   Es richtet sich an Personen die **keinen Background** in Informatik, Software-Entwicklung oder Astrophysik haben
*   Die Benutzung unterliegt einer **einfachen einheitlichen Syntax**
*   PowerShell ist **sicherer** als so manch andere Skriptsprache
*   PowerShell ist **modular** und daher einfach erweiterbar
*   PowerShell steht für **Windows**, **Linux** und **MacOS** zur Verfügung
*   Das benötige Software-**Voraussetzung ist minimal**
*   PowerShell-Code muss **nicht kompiliert** werden
*   PowerShell Skripte sind **leicht zu lesen** und daher **wartbar**
*   Die PowerShell erlaubt Zugriff auf **WMI/CIM**\-Klassen und **COM**\-Objekte

Wo wird PowerShell eingesetzt
-----------------------------

**An wenn richtet sich PowerShell?**  
Die PowerShell ist für alle IT-Mitarbeiter interessant die mit der Aufgabenautomatisierung und Konfigurationsverwaltung von IT-System beauftragt sind. Auch eignet sich die PowerShell für Schüler und Studenten, die die ersten Erfahrungen mit dem Thema Programmieren machen möchten. Typische Zielgruppen sind:

*   Systemingenieure
*   Administratoren
*   Service-Techniker
*   Helpdesk-Mitarbeiter
*   Skript-Ersteller
*   Programmierer
*   IT-Profis
*   Computer Enthusiasten
*   Schüler & Studenten

**Wo wird die Shell genutzt?**  
Auf Grund der Tatsache das die Shell modular ist, ist der Einsatzbereich unerschöpflich. Viele Hersteller bieten für ihre Systeme Anbindung oder Erweiterung (`PowerShell Module`) an. Im Folgenden eine kleine Liste an möglichen Erweiterungen:

*   Microsoft Windows Client, Server, Nano Server, IoT
*   Linux, MacOS
*   Netzwerke (DNS, DHCP, Firewall, Proxy, File-Server, Storage, Print-Server)
*   Active Directory Service (ADS)
*   Microsoft Exchange
*   Microsoft SharePoint
*   Microsoft SQL-Server
*   Azure Cloud
*   Intranet (IIS, Web Services)
*   Microsoft Deployment
*   Microsoft System Center
*   Microsoft Office 365
*   Microsoft Excel, Access, Word, PowerPoint, Outlook
*   IBM WebSphere, Citrix (XenApp, XenDesktop), Quest, VMware, ...
*   [Weitere Module in der PowerShell Gallery finden](https://www.powershellgallery.com/)

 ![[images/PowerShell-Gallery-Beispiel-1.jpg]]

PowerShell Gallery mit über 7.000 PowerShell Erweiterungen

Darüber hinaus gibt es über 7.000 Erweiterungen in der [PS Gallery](https://www.powershellgallery.com/), die Sie einsehen und herunterladen können.

Ist PowerShell gefährlich
-------------------------

Aufgrund stetig steigender Akzeptanz und den plattformübergreifenden Einsatz nutzen Hacker vermehrt die PowerShell als Automatisierungs-Werkzeug. Diese Tatsache als Argumentationsgrundlage zu benutzen, um die Shell systemweit zu verbieten und zu deaktivieren ist der falsche Ansatz, mal davon abgesehen das **ein Deaktivieren zu 100% nicht möglich** ist. Daher sorgt ein generelles Blockieren nur für scheinbare Sicherheit. [Den besten Schutz versprechen letztlich die Schutzmechanismen von PowerShell selbst](https://attilakrick.com/powershell/powershell-sicherheit/). Neben Mitteln, die den Missbrauch unterbinden, stehen auch solche zur Verfügung, um verdächtigen und unerwünschten Aktivitäten zu protokollieren und diese auf die Spur zu kommen.

 ![[images/PowerShell-Bildsymbol-Sicherheit.jpg]]

PowerShell Sicherheit

Einen interessanten Artikel der diverse Shells und Skriptsprachen bzgl. Sicherheitsmechanismen vergleicht finden Einsteiger unter dem Titel: "[A Comparison of Shell and Scripting Language Security](https://devblogs.microsoft.com/powershell/a-comparison-of-shell-and-scripting-language-security/)".

> TIPP - [Wenn Sie mit sensiblen Daten umgehen, sollten Sie diese verschlüsseln](https://attilakrick.com/powershell/verschluesseln-mit-powershell/), um sie vor Unbefugten zu schützen.

Aus was besteht PowerShell
--------------------------

Der Kern setzt sich aus Runtime, Host, Scripting Language, Cmdlet, Aliase und Provider zusammen. Kenn und lernen Einsteiger die Begrifflichkeiten zu verstehen. Daher lohnt sich auch ein Blick in das Kapitel [Terminologie in der PowerShell](https://attilakrick.com/powershell/powershell-tutorial/#terminologie-top-10-elemente).

**1\. PowerShell Runtime**  
Die Runtime ist der Kommandozeilen-Interpreter, der die Eingaben verarbeitet und somit das Herz der Shell. Die PowerShell Runtime ist eine Sammlung von .NET-Klassen, die in der Assembly/Datei `System.Management.Automation.dll` gespeichert sind.

**2\. PowerShell Host**  
Der Host ist die **Benutzerschnittstelle** zur PowerShell Runtime. In Windows steht standardmäßig die Windows PowerShell (`powershell.exe`) mit der aktuellen Version 5.1 zur Verfügung. Der Nachfolger PowerShell 7 (`pwsh.exe`) steht allen Betriebssystemen (Windows, Linux, MacOS) zur Verfügung. Neben PowerShell-Befehlen verarbeitet der Host klassisch auch DOS-Befehle wie sie in der Eingabeaufforderung üblich sind. Darüber hinaus gibt es auf dem Markt weitere Hosts, wie Idera PowerShell Plus oder auch von der Hacker-Szene selbst kompilierte Hosts, um Anwendungsrichtlinien oder Virenscanner zu umgehen

**3\. PowerShell Scripting Language**  
PowerShell Scripting Language ist die Sprache, um Skripte für die PowerShell Runtime zu schreiben. Solche ausführbaren Dateien besitzen die Dateierweiterung .PS1 (PowerShell Script Version 1.0) und .PSM1 (PowerShell Module Version 1.0).

> WICHTIG: Die Ausführungsrichtlinien gilt es zu berücksichtigen. Die **.PS1- und .PSM1-Dateien gehören zu den ausführbaren Dateien** und **unterliegen den Ausführungsrichtlinien** (Execution Policies). Diese Richtlinien steuern ob ausführbare Dateien ausgeführt werden und zu welchen Bedingungen. Wie Ihre Shell aktuell eingestellt ist, ermittelt der Befehl `Get-ExecutionPolicy -List`. Sollten diese Ausführungsrichtlinien auf einem Client auf `Default` oder bei Client und Server auf `Restricted` stehen, können PS1- und .PSM1-Dateien nicht ausgeführt werden. Mit erhöhten Berechtigungen können Sie diese Ausführungsrichtlinien mit folgenden Befehlen dauerhaft ändern:

```
# Die Ausführungsrichtlinien auf RemoteSigned für den aktuellen Benutzer
Set-ExecutionPolicy -ExecutionPolicy 'RemoteSigned' -Scope 'CurrentUser'

# Die Ausführungsrichtlinien auf RemoteSigned für den Computer
Set-ExecutionPolicy -ExecutionPolicy 'RemoteSigned' -Scope 'LocalMachine'

# Die Ausführungsrichtlinien auf RemoteSigned für den aktuellen Host
Set-ExecutionPolicy -ExecutionPolicy 'RemoteSigned' -Scope 'Process'
```

Weitere lesenwerte Details über Ausführungsrichtlinien enthält die folgende About-Seite.

```
Get-Help -Name 'about_execution_policies' -ShowWindow
```

> Wenn Sie anfange eigene Skripte zu schreiben, achten Sie auf einen sinnvollen Aufbau der in meinem Artikel: "[Wie sieht der ideale Aufbau einer PowerShell-Script-Datei aus](https://attilakrick.com/powershell/powershell-script-aufbau/)" beschrieben wird.

**4\. Cmdlet und Alias**  
**Cmdlets** (gesprochen Command-Lets) werden die **Befehlchen** in PowerShell genannt. Cmdlets sind keine Stand-Alone-.EXE-Dateien und können ohne die PowerShell nicht ausgeführt werden. Cmdlets erhalten ihre **Eingabe/Steuerung über Parameter** als Text oder Objekt und werden so an die eigenen Bedürfnisse angepasst. Optional können Cmdlets auch Ausgaben in Form von Objekten erzeugen.

 ![[images/PowerShell-Cmdlet-Overview.jpg]]

In der Kombination von Cmdlets wird die Nutzbarkeit und Lesbarkeit von Skripten und Befehlen durch **strikte Namenskonventionen** gewährleistet. Der Cmdlet-Name folgt der Konvention Tätigkeit-Tätigkeitsbereich (Verb-Substantiv), zum Beispiel `Get-Help`, `Set-Location` oder `Stop-Process`. Daher wird ein Cmdlet genau an eine Aufgabe ausgerichtet, z.B. ermittelt `Get-Process` die aktuellen Prozesse und ein zweites Cmdlet `Stop-Process` ist nur für das Stoppen von Prozessen verantwortlich.

Die Objekt-Ausgabe eines Cmdlets, kann über die Pipeline `|` an ein zweites Cmdlet übergeben werden. Zum Beispiel könnte mit `Get-Process | Out-File -FilePath C:\Temp\LfdProzesse.txt` die aktuellen Prozesse in eine Datei geschrieben werden.

**Aliase** wurden für die gebräuchlisten Cmdlets erstellt aber auch eigene können hinterlegt werden. Aliase **erleichtern den Umstieg**, da es zum Beispiel für das Cmdlet `Get-ChildItem` die Aliase `dir` und `ls` gibt. Aliase haben auch die Aufgabe den **Tastaturanschlagsaufwand** auf erträgliches Maß im Host zu reduzieren. Um nicht jedesmal `Test-NetConnection` schreiben zu müssen, gibt es für dieses Cmdlet den Alias `tnc`. Da Aliase wie Variable gesetzt, geändert oder gelöscht werden können, sollten Sie die Benutzung von **Aliasse in Skripten meiden**.

 ![[images/PowerShell-Aliases-Overview.jpg]]

**5\. PowerShell Provider**  
Über PowerShell Provider (PSProvider) und Drives (PSDrive) kann mit **Default-Cmdlets auf diverse Technologien dynamisch zugegriffen werden**. Zu den Standard PSProvider gehören unter anderem die Registrierungsdatenbank, Windows Umgebungsvariablen, Dateisystem und der Zertifikatsspeicher. Darüber hinaus können weitere PSProvider über Module installiert und geladen werden, wie z.B. [ActiveDirectory](https://docs.microsoft.com/en-us/powershell/module/addsadministration/?view=win10-ps), [Microsoft Exchange](https://docs.microsoft.com/de-de/powershell/exchange/?view=exchange-ps) oder der [Microsoft SQL-Server](https://docs.microsoft.com/de-de/sql/powershell/sql-server-powershell?view=sql-server-ver15).

Um mittels Cmdlet auf diese Technologien zugreifen zu können, werden Laufwerke benötigt, die über Path-Syntax angesprochen werden können. Die folgenden Beispiele listen den Inhalt des jeweiligen Laufwerks auf: `Get-ChildItem -Path C:\`, `Get-ChildItem -Path HKCU:\` oder `Get-ChildItem -Path Cert:\`

**6\. PowerShell Module**  
Ein Modul **erweitern die PowerShell** um Cmdlets, PSProviders, PSDrives, Functions, Variables und ausführbare Skripte. Um einen Nutzen aus einem Module ziehen zu können müssen zweit Voraussetzungen erfüllt sein.

 ![[images/PowerShell-Modules-Overview.jpg]]

1.  Ein Module muss **einmalig installiert** werden, z.B. aus der Microsoft PowerShell Gallery im Internet.
2.  Vor der Benutzung der zusätzlichen Funktionalität muss das Module **importiert** (d.h. geladen) werden.

Zum Thema Module lesen Sie auch die folgende About-Seite.

```
Get-Help -Name 'About_Modules' -ShowWindow
```

Die Installation
----------------

Im aktuellen Windows Client- und Server-Betriebssystem ist die **Windows PowerShell bereit integriert** (Aktuell Version 5.1). Der offizielle Nachfolger PowerShell 7 muss jedoch für Windows, Linux oder MacOS manuell installiert werde. Beide Versionen parallel zu betreiben ist unproblematisch und zwingend notwendig, wenn keine Windows-Feature administriert werden sollen.

**Installationsanleitung** für PowerShell 7 unter Windows:

1.  Auf **GitHub** finden Sie die [PowerShell 7 Release Historie](https://github.com/PowerShell/powershell/releases). An oberster Stelle klicken Sie auf den Titel der aktuellen PowerShell 7 Version (z.B. [v7.0.2 Release of Powershell](https://github.com/PowerShell/PowerShell/releases/tag/v7.0.2) - Stand Juni 2020).
2.  Downloaden Sie die aktuelle [PowerShell 7 Version von GitHub](https://github.com/PowerShell/PowerShell/releases/). (z.B. PowerShell 7.0.2 für Windows 64 Bit wäre folgender Download: download/v7.0.2/PowerShell-7.0.2-win-x64.msi).
3.  Starten Sie die Installation mit erhöhten Berechtigungen über die .MSI-Datei und folgen dem Assistenten bis zur Fertigstellung.
4.  Nach der Installation finden Sie PowerShell 7 im Startmenü von Windows.

**Weitere hilfreiche Tools die installiert werden sollten!**  
Hierbei handelt es sich um Werkzeuge, die das Arbeiten mit bzw. in der Shell erleichtern. Um PowerShell Scripte zu schreiben, benötigen Sie **Visual Studio Code** und als komfortable Benutzerschnittstelle empfehle ich das neue **Windows Terminal**.

**Microsoft Visual Studio Code (VSCode):**  
Die Windows PowerShell ISE wird seitens Microsofts nicht weiterentwickelt und ist auch nicht mehr Bestandteil der PowerShell 7. Der offiziell Nachfolger laut hiermit Microsoft Visual Studio Code (VSCode).

 ![[images/VisualStudioCode-PowerShell-Beispiel-1.jpg]]

> Anmerkung - [**VS Codium**](https://github.com/VSCodium/vscodium) ist identisch im Look & Feel nur **ohne** Microsoft Branding, Telemetry und Licensing.

VSCode gibt es für dieverse Betriebssysteme und kann als [VSCode Installer](https://code.visualstudio.com/#alt-downloads) heruntergeladen und installiert werden. Nach der Installation öffnet sich VSCode automatisch. Um jedoch für PowerShell einsatzbereit zu sein, **benötigen Sie noch ein paar Extensions**. Diese Extensions können Sie in VSCode über das 4-Würfel-Extension-Symbole am linken Rand suchen (ID), finden und direkt installieren \[INSTALL\].

Benötigte Visual Studio Code-Extensions:

| ID | _TITEL_ - BESCHREIBUNG |
| --- | --- |
| ms-vscode.powershell | _PowerShell_ - Integration / Interaktion mit VSCode. |
| aaron-bond.better-comments | _Better Comments_ - Skript-Kommentar farblicher hervorheben. |
| yzhang.markdown-all-in-one | _Markdown All in One_ - Markdown (.md) Unterstützung in VSCode. |

Nun ist VSCode einsatzbereit. Über den Menüpunkt `File / New File` legen Sie ihre erste Skript-Datei an. Achten Sie beim Speichern auf die Angabe der Dateiendung `.PS1`.

**Windows Terminal:**  
Windows Terminal ist ein Befehlszeilen-Frontend: Es kann mehrere Terminal-Apps in einem Fenster mit mehreren Registerkarten ausführen. Es bietet sofort einsatzbereite Unterstützung für **Windows-Eingabeaufforderungen, PowerShell 7 Windows PowerShell**, PowerShell Core, Windows-Subsystem für Linux (WSL) und Azure Cloud Shell Connector.

 ![[images/WindowsTerminal-Beispiel-2.png]]

Die wichtigsten Funktionen des Windows-Terminals umfassen mehrere Registerkarten, Bereiche, Unicode- und UTF-8-Zeichenunterstützung, GPU-beschleunigtes Textrendering-Modul sowie benutzerdefinierte Designs, Formatvorlagen und Konfigurationen. Weitere Details finden Einsteiger auf [GitHub](https://github.com/microsoft/terminal).

> Quelle: Das Windows Terminal können Sie über den [Microsoft Store](https://www.microsoft.com/de-de/p/windows-terminal/9n0dx20hk701) oder über [GitHub](https://github.com/Microsoft/Terminal) (.MsiXBundle-Datei) installieren.

Windows Terminal wird nach der Installation über das Windows Startmenü aufgerufen oder über `WIN`+`R` und `wt`.

Wie wird Powhell benutzt
------------------------

Generell gilt das **eine Befehlszeile mit Enter (Zeilenumbruch) abgeschlossen** wird. Optional können Sie mehrere Befehle in EINER Zeile schreiben dies müssen Sie jedoch mit einem Semikolon trennen.

**Verhalten in einem PowerShell Host:**  
Wenn Einsteiger schnell etwas nach dem Prinzip "fire and forget" erledigen wollen, rufen Sie einen der folgenden Hosts auf:

*   Windows Startmenü: PowerShell 7 (x64)
*   Windows Startmenü: Windows PowerShell
*   Windows Startmenü: Windows PowerShell (x86)
*   Windows Startmenü: Windows Terminal

Im Host können Sie nun Cmdlets eingeben und die Ausführung mit ENTER anstoßen. Probieren Sie einmal folgendes aus:

oder

```
Get-Process | Format-List
```

oder

```
Get-Process | Out-GridView
```

**Tastaturbefehle zum PowerShell Host** (Console-Hotkeys):

| BESCHREIBUNG | HOTKEY |
| --- | --- |
| Cmdlet- & Parameter-Name vervollständigen | TAB |
| Aktuelle Ausführung abbrechen | STRG + C |
| blättert im Befehls-Cache | PFEIL-OBEN / PFEIL-UNTEN |
| kopiert die Markierung in die Zwischenablage | MARKIEREN + ENTER |
| Kopieren (>= PS 5.0) | STRG + C |
| fügt dir Zwischenablage ein | RECHTS-KLICK |
| Einfügen (>= PS 5.0) | STRG + V |
| Vorschlagsliste & Autovervollständigung für Cmdlets Parameter und Argumente anzeigen | STRG + SPACE |

**Tastaturbefehle zum Windows Terminal** (WT-Hotkeys):

| BESCHREIBUNG | HOTKEY |
| --- | --- |
| Suchen | CTRL + SHIFT + F |
| Neuer vertikaler Bereich | ALT + SHIFT + + |
| Neuer horizontaler Bereich | ALT + SHIFT + - |
| Bereich wechseln | ALT + PFEILTASTEN |
| Bereichs-Größe anpassen | ALT + SHIFT + PFEILTASTEN |
| Bereich schließen | CTRL + SHIFT + W |
| identisch mit PowerShell Host | ... |

**Verhalten in Visual Studio Code:**  
Möchten Sie jedoch ein **Skript schreiben** oder etwas auf einem Schmirzettel skizzieren dann starten Sie Visual Studio Code aus dem Windows Startmenü und beginnen eine neue `.PS1`\-Datei über den Menüpunkt `File / New File`. Hier haben Sie übersichtlich unendlich viel Platz. Kopieren Sie einmal folgende Zeilen in Ihr .PS1-Dokument:

```
Get-Process | Select-Object -First 3
Get-ChildItem -Path C:\Windows -Hidden
Get-Service | Where-Object -Property Status -EQ -Value Running | Format-Wide -Column 8
```

Und speichern dann das Dokument mit `CTRL+S` ab. Oder noch besser Sie schalten über den Menüpunkt `File / Auto Save` das **automatische speichern** dauerhaft ein.

Setzen Sie Ihren **Courser in die erste Zeile und drücken `F8`**. Hiermit wird diese Zeile nun ausgeführt und Sie sehen das Ergebnis im unteren Terminal-Bereich von VSCode. Wenn Sie jetzt den Courser in die zweite Zeile verschieben und wieder `F8` drücken so wird diese ausgeführt und so weiter.

Wenn Sie jedoch die **gesamt Skript-Datei ausführen** wollen, dann drücken Sie `F5`, d.h. alle 3 Zeilen werden der Reihe nach ausgeführt und die Ausgabe unten im Terminal-Bereich angezeigt. **Hinweis:** Vermutlich ist jetzt die Enttäuschung groß, da in der Ausgabe Text in roter Schrift angezeigt wird. Hierbei handelt es sich um einen Fehler (Exception). Schuld an diesem Verhalten sind die Ausführungsrichtlinien. Aus Sicherheitsgründen lässt die PowerShell das Ausführen von .PS1-Dateien nicht zu, um unbedarfte Benutzer zu schützen.

Mit erhöhten Berechtigungen können Sie die Ausführungsrichtlinien wie folgt dauerhaft ändern:

```
# Die Ausführungsrichtlinien auf RemoteSigned für den aktuellen Benutzer, den Computer und den aktuellen Host
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser, LocalMachine, Process
```

Um an dieser Stelle nicht zu weit abzuschweifen sollten Einsteiger zeitnah folgende Informationen [About Execution Policies](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7) bzgl. den Ausführungsrichtlinien lesen.

Nach der Änderung der Ausführungsrichtlinien können Sie Ihr .PS1-Script mit `F5` ausführen.

Wollen Sie das gerade eben erstellt .PS1-Skript in einem der o.a. Hosts ausführen, so führen Sie die Datei mit `&`\-Operator aus:

```
& 'C:\MeinPfad\MeineErstesSkript.ps1'
```

**Tastaturbefehle zu Visual Studio Code** (Hotkeys):

| BESCHREIBUNG | HOTKEY |
| --- | --- |
| Aktuelle Zeile oder Selektion ausführen | F8 |
| Online-Hilfe zum akt. Cmdlet | CTRL + F1 |
| Visual Studio Code Kommandozeile | F1 |
| PS1-Datei ausführen / DEBUGGER starten | F5 |
| Autovervollständigung öffnen | CTRL + SPACE |

**Programm-Ablauf-Code** kann in einer Skript-Datei erfasst werden. Diese Skript-Dateien besitzen die Dateierweiterung .PS1 (PowerShell Script Version 1.0). Eine .PS1-Datei ist eine einfach **Text-Datei** die als `UTF-8 with BOM` gespeichert wurde und kann so von jedem Text-Editor gelesen und bearbeitet werden.

.PS1-Dateien unterliegen den **Ausführungsrichtlinien**. Informationen darüber finden Einsteiger unter [About Execution Policies](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7). Sollten diese auf einem Client auf `Default` oder auch bei einem Server auf `Restricted` stehen können **.PS1-Dateien nicht ausgeführt** werden.

Mit erhöhten Berechtigungen können Sie diese Ausführungsrichtlinien mit folgenden Befehlen dauerhaft ändern:

```
Set-ExecutionPolicy -ExecutionPolicy 'RemoteSigned' -Scope 'CurrentUser', 'LocalMachine', 'Process'
```

Der enthaltene Programm-Ablauf-Code einer .PS1-Datei wird zeilenweise ausgeführt und kann folgende Elemente enthalten:

*   Cmdlet
*   Cmdlets die mittels der Pipeline `|` verbunden wurden
*   Eigene Funktionen
*   Variablen die mit einem `$` begonnen werden
*   Kommentarzeilen die mit `#` begonnen werden
*   Kommentarblöcke die mit `<#` eingeleitet und mit \`#> ausgeleitet werden
*   Schleifen und Verzweigungen
*   Signatur

Beispiel einer .PS1-Skript-Datei:

```
<# Dieser Text ist Bestandteil eines: Kommentarblocks #>

# Und ich bin eine Kommentarzeile
$UnterordnerVonWindows = Get-ChildItem -Path C:\Windows -Directory

"C:\Windows hat $($UnterordnerVonWindows.Count) Unterordner"

function Gib-TageBisNeuJahr()
{
    $Jetzt = Get-Date
    $NeuJahr = Get-Date -Year ($Jetzt.Year + 1) -Month 1 -Day 1
    return New-TimeSpan -End $NeuJahr | Select-Object -ExpandProperty Days
}

Gib-TageBisNeuJahr
```

Wollen Sie eine .PS1-Skript-Datei in einem **PowerShell Hosts ausführen**, so führen Sie die Datei mit `&`\-Operator aus:

```
& 'C:\MeinPfad\MeineErstesSkript.ps1'
```

Pipeline Objekte
----------------

Die PowerShell ist ein objektorientierte Kommandozeileninterpreter. Daher sollte man sich schnell **mit diesem objektorientierten Ansatz anfreunden**. Cmdlets wurden für den Umgang mit Objekten entworfen. Objekte können Eigenschaften (**Properties**), Methoden (**Methods**) und Ereignisse (**Events**) besitzen. Ein Objekt setzt sich aus strukturierten Informationen zusammen und ist mehr als nur die Zeichenfolge, die auf dem Bildschirm angezeigt wird Die zuerst nicht sichtbaren Informationen können bei Bedarf genutzt werde.

 ![[images/PowerShell-Pipelining-FlipChart-Vorschau.png]]

Das Cmdlet `Get-Member` zeigt den Typ, die Eigenschaften und Methoden und Ereignisse von Objekten an. Die aktive und häufige Benutzung von `Get-Member` für Analysezwecke ist ratsam, da Sie so Antworten auf die Fragen bekommen: "**Was habe ich für ein Objekt?**" und "**Was kann ich mit dem Objekt anfangen?**".

```
# Welche Objekte bekomme ich von Get-ChildItem und was kann ich mit diesen anfangen?"
Get-ChildItem C:\Windows -File | Get-Member
```

> TIPP: Da `Get-Member` für Analysezwecke temporär benutzt wird verwenden Sie einfach den Alias `gm`.

Eine Cmdlet-**Objekt-Ausgabe** wird in der Pipeline abgelegt und im Weiteren von der PowerShell analysiert, um Rückschlüsse ziehen zu können wie diese an das darauffolgende Cmdlet **gebunden werden muss**. Dieses Model ist anfangs komplex, jedoch ergeben sich dadurch in der Praxis auch Vorteile beim Filtern und Verarbeiten von Informationen, wie folgende zwei Beispiele verdeutlichen sollen.

Das **Erste Beispiel**

1.  **listet** mit `Get-ChildItem` Dateien `-File` in `C:\Windows` auf,
2.  **filtert** mit `Where-Object` Dateien die größer oder gleich `10KB` sind,
3.  **gruppiert** mit `Group-Object` diese nach der Eigenschaft `Extension` und
4.  **sortiert** mit `Sort-Object` das gruppierte Ergebnis absteigend `-Descending` nach der Anzahl der Gruppenelemente:

```
Get-ChildItem -Path 'C:\Windows' -File | Where-Object -Property 'Length' -GE -Value 10KB | Group-Object -Property 'Extension' | Sort-Object -Property 'Count' -Descending
```

> TIPP: Sie können sich **Zwischenergebnisse anzeigen** lassen, in dem Sie nur einen Teil von Beginn bis vor jeder Pipeline markieren und dann diese Auswahl mit `F8` ausführen.

Das **zweite Beispiel**

1.  _listet_ mit `Get-Process` aktuelle Prozesse auf,
2.  _filtert_ mit `Where-Object` Prozess raus die nicht von `Microsoft*` stammen,
3.  _sortiert_ mit `Sort-Object` absteigend nach der Eigenschaft `WorkingSet64` (RAM-Belegung),
4.  _selektiert_ mit `Select-Object` nur noch die Top 10 Prozess-Verbrauch `-First 10` sowie die Eigenschaft `ProcessName` und WorkingSet64 in Megabyte,
5.  _konvertieren_ mit `ConvertTo-Csv` in das CSV-Format und
6.  _schreibt_ mit `Out-File` das Ergebnis in eine Datei `"$env:TEMP\TopRamUsageProcesses.csv"`:

```
Get-Process | Where-Object -Property Company -Like -Value 'Microsoft*' | Sort-Object -Property WorkingSet64 -Descending -PipelineVariable process | Select-Object -First 10 -Property ProcessName, @{ Name='RamUsageMB'; Expression={ [int]($process.WorkingSet64/1MB) } } | ConvertTo-Csv -Delimiter ';' | Out-File -FilePath "$env:TEMP\TopRamUsageProcesses.csv"

# Zeigt die erstellte Datei an:
Start-Process -FilePath "$env:TEMP\TopRamUsageProcesses.csv"
```

Cmdlets und Hilfe suchen und finden
-----------------------------------

Wie erhalte ich allgemeine **Hilfe-Informationen zu PowerShell-Konzepten**?  
Die Shell selbst bietet umfassende und **ausführliche Hilfeartikel**, in denen die Konzepte von PowerShell anhand **lesbarer Beispiele** erläutert werden. Um die Hilfe nutzen zu können, müssen Sie diese zuerst aus dem Internet **installieren**. Hierzu führen Sie folgenden Code mit erhöhten Berechtigungen aus:

```
# Installiert, soweit vorhanden Hilfeartikel für alle Module auf den Rechner:
Update-Help -Module '*' -UICulture 'en-US' -Force
```

Einige Fehlermeldungen könnten im Anschluss auftauchen, da nicht alle Module downloadbare Hilfetext in Englisch haben. **Daher können wir diese Fehler ignorieren.**

Zuerst sollten wir uns einen **Überblick der vorhandenen Hilfeartikel** anzeigen lassen:

```
# Überblick aller About-Artikel:
Get-Help -Category 'HelpFile'
```

In der letzten Spalte werden eininge Artikel kurz beschrieben und in der ersten Spalte `Name` können Sie vom Artikelnamen ableiten um was es in diesem About-Artikel geht. **Angezeigt wird der Inhalt wie folgt**:

```
# Zeigt den Inhalt von about_Remote im Host an:
Get-Help -Name 'about_Remote'

# Zeigt den Inhalt von about_Pwsh in einem Fenster (-ShowWindow) an:
Get-Help -Name 'about_Pwsh' -ShowWindow

# Darüber hinaus können Einsteiger auch jeden Artikel Online lesen, tauschen Sie dazu einfach am Ende des Urls den about-Namen aus:
Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_remote'
Start-Process -FilePath 'https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_Pwsh'
```

Hier eine Überblick von Artikel die man als Anfänger **gelesen haben sollte**:

| ABOUT-NAME | BESCHREIBUNG |
| --- | --- |
| about\_Execution\_Policies | Ausführungsrichtlinien von .PS1- und .PSM1-Dateien |
| about\_Run\_With\_PowerShell | Scripte ausführen |
| about\_Modules | PowerShell um neue Funktionen erweitern |
| about\_Command\_Syntax | Cmdlet Syntax-Beschreibung |
| about\_Parsing | Wie verarbeitet Kommandozeileninterpreter die Eingabe |
| about\_Pipelines | Pipeline Benutzung |
| about\_Special\_Characters | Diverse Zeichen mit Sonderbedeutung |
| about\_Wildcards | Platzhalter-Zeichen |
| about\_Locations | Alles über den absoluten und relativen Bezugpunkt von PSDrives |
| about\_Path\_Syntax | Syntax-Regel bzgl. Pfad-Angaben |
| about\_Operators | Einstiegseite über Operatoren |
| about\_Objects | Wissenwertes über Objekte |
| about\_Arrays | Wissenwertes über Arrays |
| about\_Script\_Blocks | Wissenwertes über ScriptBlock's |
| about\_Variables | Variablen |
| about\_Automatic\_Variables | Automatische/Dynamische Variablen |
| about\_Environment\_Variables | Windows Umgebungsvariablen |
| about\_Remote | Einstiegseite für die Remote-Verwendung |
| about\_Scheduled\_Jobs | Zeigesteuerte Aufgaben erstellen |

Wie kann ich ein brauchbares **Cmdlet finden**?

Am Anfang jeder Lösung steht die **Suche nach dem passenden Cmdlet**, um eine kleine Teilaufgaben zu erledigen die einem Schritt weiter Richtung Wunschergebnis bringt. Zum Beispiel befinden sich in meiner PowerShell z.Zt. 100 Module mit insgesamt ca. 3.000 Cmdlets. Natürlich kenn ich nicht alle Cmdlets persönlich - Man muss nur das eine welche finden das das aktuelle Problemchen löst. Wenn Sie das Problem genau kenn, gibt es mehrere Möglichkeiten, die zielführend sind.

 ![[images/PowerShell-Cmdlet-finden-Code.png]]

```
# ? Ein Cmdlet über dessen Namen finden (AUFGABE: Die Verbindung zu einem Remote-Host testen):
Get-Command -Name '*-*connection*'

# ? Ein Cmdlet über die Tätigkeit (Verb) finden (AUFGABE: Etwas beenden/stoppen):
Get-Command -Verb 'Stop'

# ? Ein Cmdlet über den Tätigkeitsbereich (Noun) finden (AUFGABE: Etwas mit Diensten machen):
Get-Command -Noun 'Service'

# ? Ein Cmdlet über den Parameter-Namen finden (AUFGABE: Alle Cmdlets die eine Tätigkeit auf einem Remote-Host ausführen):
Get-Command -Name '*' -ParameterName 'ComputerName'

# ? Sämtliche Cmdlets über den Module-Name finden (AUFGABE: Alle Cmdlets die das Windows-Update-System steuern):
Get-Command -Name '*' -Module 'WindowsUpdate'
# ? Welche Module gibt es den aktuell auf meinem System:
Get-Module -ListAvailable

# ? Ein nicht installiertes Cmdlet über die PS Gallery finden (AUFGABE: Welches Modul muss ich installieren um Invoke-SqlCmd benutzen zu können): Find-Command -Name 'Invoke-SqlCmd' # ? Ein Cmdlet über ein Windows-Fenster (GUI) finden: Show-Command # ? Ein Cmdlet per Google finden (AUFGABE: Wie kann ich einen neuen AD-User anlegen): Start-Process -FilePath 'https://www.google.com/search?q=powershell+new+ad+user'
```

> TIPP: Da `Get-Command` oft temporär verwendet wird, ist die Benutzung des Alias `gcm` effizienter und erlaubt. Lesen Sie auch: "[Wie kann ich ein mir unbekanntes PowerShell Cmdlet finden](https://attilakrick.com/powershell/cmdlet-finden/)".

Wie bekomme ich **Hilfe zu einem unbekannten Cmdlet**?

Wenn das vermeintlich benötigte Cmdlet gefunden wurde, sollte man sich vergewissern ob das Helferlein, das tut was man vermutet. Auch ist jetzt wichtig zu verstehen **wie das Cmdlet benutzt wird**. Für jedes Cmdlet gibt es einen eigenen Hilfeartikel. Diese Hilfe kann wie folgt angezeigt werden:

```
# Zeigt die vollständige Hilfe von Get-Command im PS Host an: Get-Help -Name 'Get-Command' -Full # Zeigt die vollständige Hilfe von Get-Command im Fenster an: Get-Help -Name 'Get-Command' -ShowWindow # Zeigt die vollständige Hilfe von Get-Command im Browser an: Get-Help -Name 'Get-Command' -Online
```

Der Aufbau eines Cmdlet-Hilfeartikels ist standardisiert und besteht aus den folgenden Bereichen:

| BEREICH | BESCHREIBUNG |
| --- | --- |
| Synopsis | Kurzbeschreibung der Tätigkeit des Cmdlets |
| Description | Ausführliche Beschreibung der Tätigkeit des Cmdlets |
| Syntax | Die Art der Bedienung des Cmdlets |
| Examples | Diverse erklärende Beispiele mit diesem Cmdlet |
| Parameters | Die Beschreibung jedes einzelnen Parameters |
| Inputs | Welche Objekte-Typen dieses Cmdlet in der Eingabe akzeptiert (Links der Pipe: ? | Cmdlet ) |
| Outputs | Welche Objekte-Typen dieses Cmdlet ausgibt (Rechts der Pipe: Cmdlet | ? ) |
| Notes | Weitere Hilfreiche Notizen |
| RelatedLinks | Verwante Themen |

Für das erste Verstehen eines neues Cmdlets sollten Einsteiger sich auf die Bereiche **Synopsis, Examples und Syntax fokussieren**. Für die Syntax gibt es die folgende About-Seite.

```
Get-Help -Name 'about_Command_Syntax' -ShowWindow
```

Mit PS Daten managen
--------------------

Der meist verwendeten Tätigkeitsablauf ist die **Datenbeschaffung / Erzeugung** und die Aufbereitung dieser für den weiteren Verwendungszweck. Hierzu gehören Aufgaben wie **filtern, selektieren, sortieren, konvertieren und ausgeben** der Daten. Diesen Pipeline-Workflow könnten man in Reihe wie folgt beschreiben:

1.  Benötigte Daten beschaffen z.B. `Get-Service`.
2.  Pipeline-Objekt analysieren, um Rückschlüsse für das nächste Cmdlet ziehen zu können `Get-Member`.
3.  Die angefallenen Daten filtern `Where-Object`.
4.  Die gefilterten Daten auf die benötigten Informationen selektieren `Select-Object`.
5.  Die selektierten Informationen sortieren `Sort-Object`.
6.  Die sortierten Informationen gruppieren `Group-Object`.
7.  Die gruppierten Informationen konvertieren z.B. nach CSV mit `ConvertTo-Csv`.
8.  Die CSV-Werte z.B. in eine Datei ausgeben `Out-File`.

Anmerkung zum Pipeline-Workflow:

*   Jeder Schritt ist nicht nötig und kann übersprungen werden.
*   Die Reihenfolge kann auch variieren
*   Der 2. Schritt kann in der Regel nach jedem weiteren Schritt wiederholt werden da die Cmdlet-Ausgabe sich ändern könnte.
*   Der 4. Schritt kann bei bedarf im weiteren Verlauf wiederholt werden.

Im folgenden Beispiel möchte ich im Detail auf die einzelnen Schritte einmal eingehen.

**AUFGABENSTELLUNG:** Es sollen alle SvcHost-Dienste aufgelistet werden. Diese Liste soll übersichtlich nach Dienst-Starttyp und sowie den aktuellen Dienst-Status in Excel angezeigt werden.

> zu 1. Mit Cmdlets Daten erfassen bzw. beschaffen

In der Regel besitzen Cmdlets die Informationen abrufen können die Tätigkeit `Get`. Einen Überblick dieser Cmdlets erhalten Sie mit `Get-Command -Verb Get`.

```
# Alle Dienste ermitteln
Get-Service
```

> zu 2. Daten-Objekte in der Pipeline analysieren

Dieser Schritt kann optional nach jedem weiteren Schritt wiederholt werden da sich die Cmdlet-Ausgabe ändern könnte. Mit `Get-Member` erhalten Sie wichtige Informationen über das Pipeline-Objekt. Dazu gehören der TypeName des Objektes sowie dessen Member wie Properties, Methods und Events. Da dieser Analyseschritt nur temporär ist können Sie der einfachheithalber den Alias `gm` verwenden.

```
# Um welches Objekt handelt es sich und was kann es?
Get-Service | Get-Member

# Oft ist es auch hilfreich sich die enthaltenen Werte der Objekt-Eigenschaften anzeigen zu lassen:
Get-Service | Select-Object -Property '*' -First 1
```

> zu 3. Daten-Objekte in der Pipeline filtern

Nach dem wir nun wissen welche Objekte wir zurückbekommen, wie benötigte Eigenschaften heißen und wie Daten in diesen Eigenschaften gespeichert wurden können wir mit `Where-Object` die Pipeline-Objekte filtern.

```
Get-Service | Where-Object -Property 'BinaryPathName' -Like -Value 'C:\Windows\System32\SvcHost.exe*'
```

`Where-Object` ist ein sehr mächtiges Filter-Cmdlet. Schauen Sie sich dazu auch einmal die Bereich Parameters, Examples und RelatedLinks des dazugehörigen Hilfeartikels bzgl. dem Parameter **`-FilterScript`** an.

Vielleicht sollten Sie an dieser Stelle den 2. Schritt `Get-Member` nochmals auszuführen, da sich die Rückgabe und somit die Pipeline-Objekte geändert haben könnten.

> zu 4. Daten-Objekte in der Pipeline selektieren

Jetzt können wir die Objekte auf die nur noch benötigten Eigenschaften hin filtern.

```
Get-Service | Where-Object -Property 'BinaryPathName' -Like -Value 'C:\Windows\System32\SvcHost.exe*' | Select-Object -Property 'Name', 'StartType', 'Status'
```

Denken Sie daran evtl. an dieser Stelle den 2. Schritt `Get-Member` nochmals auszuführen, da sich die Rückgabe und somit die Pipeline-Objekte geändert haben könnten.

> zu 5. und 6. Daten-Objekte in der Pipeline gruppieren und sortieren

Die so aufbereiteten Daten können nun gruppiert oder/und sortiert werden, um die Lesbarkeit der Zielführung zu unterstützen.

```
# Gruppieren:
Get-Service | Where-Object -Property 'BinaryPathName' -Like -Value 'C:\Windows\System32\SvcHost.exe*' | Select-Object -Property 'Name', 'StartType', 'Status' | Group-Object -Property 'StartType'

# oder Sortieren:
Get-Service | Where-Object -Property 'BinaryPathName' -Like -Value 'C:\Windows\System32\SvcHost.exe*' | Select-Object -Property 'Name', 'StartType', 'Status' | Sort-Object -Property 'StartType', 'Status'
```

Auch hier könnten Sie den 2. Schritt `Get-Member` nochmals auszuführen, da sich auch hier die Rückgabe und somit die Pipeline-Objekte geändert haben könnten.

> zu 7. Daten-Objekte in der Pipeline konvertieren

Pipeline-Objekte können in dieverse Formate konvertiert werden. Hierzu gibt es jeweils eigene Cmdlets. Einen Überblick erhalten Einsteiger mit `Get-Command -Verb 'ConvertTo', 'Export', 'Format' -Module 'Microsoft.PowerShell.Utility'`.

Das aktuelle Endergebnis kann nun in Excel angezeigt werden, wenn wir die Pipeline-Objekte in das CSV-Format konvertieren.

```
# Als Wert-Trennzeichen wird das ; (-Delimiter ';') verwendet:
Get-Service | Where-Object -Property 'BinaryPathName' -Like -Value 'C:\Windows\System32\SvcHost.exe*' | Select-Object -Property 'Name', 'StartType', 'Status' | Sort-Object -Property 'StartType', 'Status' | ConvertTo-Csv -Delimiter ';'
```

Da sich auch hier die Rückgabe und somit die Pipeline-Objekte geändert haben könnten, prüfen Sie dies evtl. wieder mit `Get-Member`.

> zu 8. Daten-Objekte in der Pipeline ausgeben

Die Shell liefert viele diverse Cmdlets die die Pipeline-Objekte auf ein anderes Medium ausgeben:

```
Get-Command -Verb Out, Export -Module 'Microsoft.PowerShell.Utility'
Get-Command -Noun Content -Module 'Microsoft.PowerShell.Management'
```

Die nun so aufbereiteten CSV-Daten können z.B. mit `Set-Content` ins Dateisystem geschrieben werden.

```
# Die CSV-Daten in die Datei C:\Temp\Services.csv schreiben:
Get-Service | Where-Object -Property 'BinaryPathName' -Like -Value 'C:\Windows\System32\SvcHost.exe*' | Select-Object -Property 'Name', 'StartType', 'Status' | Sort-Object -Property 'StartType', 'Status' | ConvertTo-Csv -Delimiter ';' | Set-Content -Path 'C:\Temp\Services.csv'

# Die Datei C:\Temp\Services.csv anzeigen:
Start-Process -FilePath 'C:\Temp\Services.csv'
```

Terminologie & TOP 10 Elemente
------------------------------

Die folgende Terminologie sowie die TOP 10 Elemente können Sie sich als PDF-Datei downloaden, um sie später griffbereit als Überblick und zum Nachschlagen zur Seite zu haben.

> PDF-DOWNLOAD - [PowerShell Terminologie und TOP 10 Listen](https://attilakrick.com/media/PowerShell-Terminologie-und-TOP10-Listen-Handout.pdf)

Terminologie Cmdlet und Alias:

```
┏BZ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
Get-ChildItem -Path 'C:\Windows' -File  |   Select-Object 'Name', 'Length'
┗C━━━━━━━━━━┛ ┗PAP━━━━━━━━━━━━━┛ ┗SP━┛ ┗PL┛ ┗C━━━━━━━━━━┛ ┗PAP━━━━━━━━━━━┛
┗T┛ ┗N━━━━━━┛ ┗P━━┛ ┗A━━━━━━━━━┛            ┗T┛    ┗N━━━┛ ┗A━━━━━━━━━━━━━┛

gci
ls
dir
...
┗L┛
```

Terminologie PS Provider & PS Drive:

```
Get-ChildItem -Path 'C:\'        # FileSystem (Dateisystem)
Get-ChildItem -Path 'Env:\'      # Environment (Windows Umgebungsvariable)
Get-ChildItem -Path 'HKCU:\'     # HKEY_CURRENT_USER Registry (Windows Registrierungsdatenbank)
Get-ChildItem -Path 'HKLM:\'     # HKEY_LOCAL_MACHINE Registry (Windows Registrierungsdatenbank)
Get-ChildItem -Path 'Cert:\'     # Certificate (Windows Zertifikatsspeicher)
Get-ChildItem -Path 'Variable:\' # PS Variable
                    ┗PD━━━━━━━━┛   ┗PP━━━━━━━━━━━━━━━━━━━━━━━┛
```

Terminologie Operator:

```
┏W━━━━━━━━━━━━━━┓ ┏O━━┓ ┏W━━━━━━━━━┓
"Hallo Würzburg!" -like "*Würzburg?"
                        ┗*┛      ┗?┛
```

Terminologie Variable:

```
$Planet  =  "Pluto"
┗V━━━━┛ ┗O┛ ┗W━━━━┛
```

Terminologie objektorientierte Programmierung:

```
$MyNotePad = [System.Diagnostics.Process]::Start('notepad')
┗OB━━━━━━┛   ┗TN━━━━━━━━━━━━━━━━━━━━━━━━┛  ┗ME━━━━━━━━━━━━┛
          ┗O┛                           ┗O━┛

$MyNotePad.StartTime
┗OB━━━━━━┛ ┗MP━━━━━┛
         ┗O┛

$MyNotePad.WaitForExit(2500)
┗OB━━━━━━┛ ┗MM━━━━━━━━━━━━━┛
         ┗O┛          ┗MMA━┛
```

Erklärung der Kürzel:

| KRZL | ABKÜRZUNG | BESCHREIBUNG |
| --- | --- | --- |
| \*, ? | Wildcards | Platzhalterzeichen |
| A | Argument | Objekt, das einem Parameter zugeordnet wird; P kann optional sein; => PAP |
| BZ | Befehlszeile | Cmdlet-Verkettungen mittels PL |
| C | Cmdlet | Command-Let; Befehl der eine kleine Teilaufgabe ausführt |
| L | Alias | Definiertes Kürzel für ein Cmdlet. Siehe ``` ``Get-Alias` ``` |
| ME | MemberName | Member ist der Überbegriff für Methode, Property, Event, etc. |
| MP | Property | Eigenschaft kann gelesen (get) und/oder geschieben (set) werden; s. ME |
| MM | Methode | Eine Methode kann mit Argumenten ausgeführt werden; s. ME |
| MMA | Methode-Argument | Argumente die einer Methode übergeben werden können; s. MM |
| N | Noun | Nomen, Cmdlet-Tätigkeitsbereich |
| O | Operator | Ein O da kein Cmdlet vorangestellt ist; O müss nicht mit - beginnen; => P |
| OB | Object | Mit einem OB kann interagiert werden. |
| P | Parameter | Ein P da ein Cmdlet vorangestellt ist; => PAP |
| PD | PS Drive | Ein Laufwerk in dem Default-cmdlets anwendung finde, z.B.: `` `Get-ChildItem` `` |
| PAP | Parameter-Argument-Paar | Zu einem P gehört immer ein A; Ausnahme SP |
| PL | Pipeline | Cmdlet-Ausgabe-Objekt (li. vom PL) wird zum Cmdlet-Eingabe-Objekt (re. von PL) |
| PD | PS Provider | Eine Schnittstelle zwischen div. DB ähnliche Strukturen und PS; s. PD |
| SP | Switch-Parameter | SP wird gesetzt, um etwas einzuschalten; SP enthalten keine A. |
| T | Verb | Cmdlet-Tätigkeit |
| TN | TypeName | Type ist der Überbegriff für Class, Enum, etc. |
| W | Value | Wert, Text, oder Objekt |

*   Die TOP Cmdlets:

| CMDLET | BESCHREIBUNG / BEISPIEL |
| --- | --- |
| `Find-Command` | Cmdlets in der PS Gallery finden: `Find-Command Get-EuroExchange` |
| `Find-Module` | Module in der PS Gallery finden: `Find-Module AKPT` |
| `ForEach-Object` | Bearbeiten von Pipeline-Objekten: `1..10 | foreach {"192.168.0.$_"}` |
| `Get-Command` | Installierte Cmdlets, Functions, Aliase und Applications finden (Alias `gcm`): `Get-Command -Noun Object ; Get-Command -Module ScheduledTasks` |
| `Get-Help` | Anzeige von Hilfe für Cmdlet, about\_: `Get-Help about_if ; Get-Help Get-Member -ShowWindow` |
| `Get-Member` | Objekt-Analyse (Alias `gm`): `Get-Process | Get-Member` |
| `Get-Module` | Installierte bzw. geladene Module listen: `Get-Module -List ; Get-Module` |
| `Group-Object` | Pipeline-Objekte gruppieren: `Get-ChildItem C:\windows -File | Group-Object Extension` |
| `Measure-Object` | Anzahl, Summe, Min, Max und Durchschnitt von Pipeline-Objekte-Eigenschaften ermitteln.: `Get-ChildItem C:\windows -File | measure -Sum -Min -Max -Avg` |
| `Out-GridView` | Pipeline-Objekte in einer GUI ausgeben: `Get-Process | Out-GridView` |
| `Select-Object` | _Taschenmesser_ für Pipeline-Objekte: `Get-Process Name, WorkingSet64 -Skip 2 -First 5` |
| `Show-Command` | Cmdlets über eine GUI finden und bedienen: `Show-Command ; Show-Command Get-Command` |
| `Sort-Object` | Pipeline-Objekte sortieren.: `Get-Process | Sort-Object WorkingSet64 -Desc` |
| `Where-Object` | Filtern von Pipeline-Objekten: `Get-Process | where Company -like "Microsoft*"` |

*   Die TOP Operatoren und Sonderzeíchen:

| OPERATOR / SONDERZEICHEN | BESCHREIBUNG: BEISPIEL |
| --- | --- |
| \= += -= ... | Zuweisung: `` `$a = @() ; $a += 'Hallo Welt!'` `` |
| \+ - \* / % ... | Arithmetik: `` `10 + 4` `` |
| \-lt -le -eq -ne -ge -gt | Vergleich: `` `5 -gt 4` `` |
| \-like -notLike | Wildcard-Muster-Vergleich (`*`, `?`, ...): `` `'Report_21.log' -like 'Report_*.log` `` |
| \-match -notmatch | Regex-Muster-Vergleich: `` `'Report_21.log' -match '^Report_[0-9]{2,2}\.log$'` `` |
| \-in -notin -contains -notContains | Element(e) in/enthält Array: `` `10 -in 12,10,12` `` |
| . & | .PS1-Ausführung: `` `& '\\srv00\Projekt X\MachWas.ps1'` `` |
| $objekt.MemberName | `.` trennt Objekt vom Member: `` `$PSVersionTable.PSVersion` `` |
| \[Type\]::MemberName | `::` trennt Type und statischen Member: `` `[DateTime]::Now` `` |
| \-and -or ... | Logik: `` `1 -gt 0 -or 9 -lt 10` `` |
| \-split | Text in Array-Elemente aufteilen: `` `'a-b-c' -split '-'` `` |
| \-join | Array-Elemente zu einem String verbinden: `` `10,11,12 -join ';'` `` |
| \-f | Formatierung: `` `'Hallo {1}! {0:dd.MMM.yy}' -f (Get-Date), 'Würzburg'` `` |
| n..m | Zahlenbereich von >= n und <= m erzeugen: `` `10..20 ; 9..2` `` |
| \[n\]m -as | ObjektA umwandeln in Type X: `` `[datetime]'2020-03-13' ; '2020-03-13' -as [datetime]` `` |
| \-is | Ist ein Objekt A vom Typ X: `` `'Würzburg!' -is [string]` `` |

*   Die TOP Typen:

| TYPE | \[ALIAS /\] BESCHREIBUNG / BEISPIEL |
| --- | --- |
| `[ADSI]` | Active Directory Services Interface: `[ADSI]'LDAP://cn=lustig, ou=ak, dc=abc, dc=local'` |
| `[Array]` | `@()` / Auflistung von Objekten: `$ar = @(10, 12, 13) ; $ar[1]` |
| `[Boolean]` | `[bool]` / Boolean: `$true ; $false` |
| `[Byte]` | Ganzzahl, $\[0, 255\]$: `255` |
| `[CultureInfo]` | Kulturelle besonderheiten bzgl. Datum, Zeit und Zahlen: `[CultureInfo]'de-DE' ; [CultureInfo]$PsUiCulture` |
| `[DateTime]` | Datum und Uhrzeit: `[DateTime]'2020-03-15' ; [DateTime]::Today` |
| `[Decimal]` | Dezimalzahl ; $\[-79.228.162.514.264.337.593.543.950.335, 2^{96}\]$: `[Decimal]::Round(0.987665,2)` |
| `[GUID]` | Globally Unique Identifier: `[Guid]::NewGuid() ; [Guid]'daed6ca3-8d91-4dc4-81b5-9cc122645b87'` |
| `[HashTable]` | Wörterbuch das aus Name-Wert-Paaren besteht.: `@{Label='LengthKB' ; Expression={ $_.Length / 1KB }}` |
| `[Int32]` | `[int]` / 32 Bit-Ganzahlen; $\[-2.147.483.648, +2.147.483.647\]$: `12 ; -4096` |
| `[Int64]` | `[long]` / 64 Bit-Ganzahlen; $\[-9.223.372.036.854.775.808, +9.223.372.036.854.775.807\]$: `4567 ; -5437485` |
| `[IPAddress]` | IPv4 oder IPv6 Adresse: `[IPAddress]'192.168.178.20'` |
| `[MailAddress]` | E-Mail-Adresse: `[MailAddress]'Attila Krick<info@attilakrick.com>'` |
| `[PhysicalAddress]` | MAC-Adresse: `[PhysicalAddress]'B8-31-B5-3D-17-EC'` |
| `[PSCustomObject]` | Individuell erstellbares Objekt: `[PSCustomObject]@{ Author = 'Attila Krick' }` |
| `[ScriptBlock]` | PS-Codeblock um Zeitpunkt der Erstellung von der Ausführung entkoppeln: `$cb = { Get-Process }` |
| `[SecureString]` | Ein String, der verschlüsselt im RAM liegt: `$pwd = Read-Host -Prompt 'Passwort?' -AsSecureString` |
| `[String]` | Text: `'Hallo' ; "Hello"` ; `@'``Text 1``Text 2``'@` |
| `[URI]` | Uniform Resource Identifier: `[URI]'https://attilakrick.com'` |
| `[void]` | unterdrückt die Ausgaben, schneller als Out-Null: `[Void](1..1000)` |
| `[Xml]` | XML: `[xml]'<vom>2020-03-12</vom>'` |

*   Die TOP automatischen Variablen:

| AUTO VARIABLE | BESCHREIBUNG |
| --- | --- |
| `$_` | Das Pipeline-Objekt in einem {}-Block inder Pipeline-Verarbeitung |
| `$?` | Status des letzten Befehls |
| `$env:...` | Umgebungsvariablen; s. Autovervollständigung |
| `$Error` | enthält die letzten 256 aufgetretenen Fehler |
| `$ErrorActionPreference` | gibt die Aktion an, die ausgeführt wird, wenn eine Fehlermeldung übermittelt wird |
| `$ErrorView` | legt den Ansichtsmodus fest, der beim Anzeigen von Fehlern verwendet werden soll |
| `$false` | Boolean False |
| `$HOME` | Ordner mit dem Profil des aktuellen Benutzers |
| `$Host` | Ein Verweis auf den Host des aktuellen Runspace |
| `$null` | Verweise auf die Nullvariable geben immer den Nullwert zurück. Zuweisungen haben keine Auswirkung. |
| `$PSHome` | Übergeordneter Ordner der Hostanwendung des aktuellen Runspace |
| `$PSCulture` | Kultur der aktuellen Sitzung |
| `$PSEdition` | Editions-Informationen für die aktuelle Sitzung |
| `$PSVersionTable` | Versionsinformationen für die aktuelle Sitzung |
| `$PROFILE` | enthält den Pfad der aktuellen Profil-Datei |
| `$true` | Boolean True |
| `$WarningPreference` | gibt die Aktion an, die ausgeführt wird, wenn eine Warnmeldung übermittelt wird |

*   Die TOP Datei-Erweiterungen :

| EXTENSION | BEDEUTUNG | Beschreibung |
| --- | --- | --- |
| .PS1 | PowerShell Script Version 1.0 | Ausführbare Skriptdatei die den Ausführungsrichtlinien unterliegen. |
| .PS1XML | PowerShell Format- and Typedefinition | beschreibt Typen und deren Standard-Ausgage-Aussehen |
| .PSC1 | PowerShell Console Version 1.0 | Exportierte PowerShell Host Konfigurationseinstellungen |
| .PSD1 | PowerShell Definition Version 1.0 | Modul-Manifest-Datei mit Eckdaten eines Modules |
| .PSM1 | PowerShell Module Version 1.0 | Modul-Skriptdatei, die beim Laden eines Modules ausgeführt wird, soweit es die Ausführungsrichtlinien es zulassen. |
| .PSRC | PowerShell Role Capability | Rollenfunktions-Datei die für die Sicherheit der Shell benötigt wir (JEA) |
| .PSSC | PowerShell Session Configuration | Sitzungskonfigurations-Datei die für die Sicherheit der Shell benötigt wir (JEA) |

Alle Datei-Typen sind textbasiert und sollten UTF8BOM kodiert sein.

Spannende Ressourcen
--------------------

### PS Wissen

Meinen [YouTube-Kanal](https://www.youtube.com/channel/UCAfLAc29xLXC5gau-66xdvQ) zum Thema.

Prüfen Sie Ihr Verständnis über PowerShell in einem Wissenstest. Jeder Wissenstest besteht aus 6 zufälligen Fragen. Der Test ist kostenlos, kann anonym erfolgen und die Auswertung erfolgt unmittelbar im Anschluss. Zu gewinnen gibt es Stolz und Ehre. [Übersicht der PowerShell Wissenstests](https://attilakrick.com/powershell/powershell-wissenstest/)

Monatliche Herausforderungen und [Rätsel meistern auf Iron Scripter](https://ironscripter.us/).

[**PowerShell 7 - die Neuerungen. Was erwartet den Umsteiger**](https://attilakrick.com/powershell/neuerungen-powershell-7/)  
Windows PowerShell (für Windows) und PowerShell Core (für Windows, MacOS und Linux) wurden in PowerShell 7 zusammengeführt und bilden deren Nachfolger. Die neue Version basiert auf und ist kompatibel mit .NET Core. Sie ist abwärtskompatibel und kann auch parallel zur Windows PowerShell genutzt werden. Die 7er Version ist auch für .NET-Entwickler attraktiv, da man in einer einzigen Skriptsprache plattformübergreifend .NET-Anwendungen schreiben kann. Welche Änderungen im Detail enthalten sind, zeige ich Ihnen anhand praktischer Beispiele.  ![[images/PowerShell-7-Theme.png]]

### PS-Modul `AKPT`

Das PS-Modul `AKPT` enthält nützliche Cmdlets, Wissen zum Nachschlagen, viele praktische Beispiele und meine Schulungsunterlagen für Einsteiger und Profis.

> Quelle: [AKPT Module in der PS-Gallery](https://www.powershellgallery.com/packages/AKPT/5.21.0.0)

```
# AKPT in der PS-Gallery
Find-Module -Name 'AKPT' -AllowPrerelease

# AKPT aus der PS-Gallery installieren
Install-Module -Name 'AKPT' -Scope 'CurrentUser' -AllowClobber -SkipPublisherCheck -Force
```

### Tool - Web GUI Designer

Ein praktisches Benutzer-Interface mit einem GUI-Designer. Dieser grafische Editor ist eine Web-Anwendung und kann im Browser benutzt werden. Mit dem Designer können Sie Windows Fenster zeichnen. Das so entstandene Script kann kopiert werden, um anschließend die Logik zu implementieren. Schade ist leider, dass der Designer nicht auf WPF basiert, sondern nur auf der älteren WinForms-Technologie. Aber es ist Land in Sicht - eine WPF-Variante ist im ALpha-Stadium.

 ![[images/POSHGUI-WinForm-Designer.png]]

> Quelle: [POSHGUI WinForm Designer](https://poshgui.com/)

### Seminare, Workshops und Coaching

Sie haben die PowerShell bereits produktiv im Einsatz und wollen eigene Cmdlets schreiben? Sie wollen Ihre Scripte automatisch testen oder eigene Module im Unternehmen verteilen? Komplexe Vorgänge verstehen und sich zu eigen machen? Wenn Sie Ihre Kenntnisse auf das nächste Level heben möchten, dann schauen Sie sich die Agenda [PS für Fortgeschrittene und Profis](https://attilakrick.com/powershell/powershell-seminare/#powershell-f%C3%BCr-fortgeschrittene) an.

Sie wollen PowerShell produktiv als Administrator-Werkzeug verwenden? Administrative Aufgaben an Nicht-Administratoren delegieren? Die es als Werkzeug für Penetrations-Tests einsetzen? Dann empfehle ich Ihnen folgendes Seminar: [PS Sicherheit, Hacking und Penetration-Test](https://attilakrick.com/powershell/powershell-seminare/#powershell-sicherheit,-hacking-und-penetration-test).  ![[images/PowerShell-Sicherheit-die-Keywords.png]]

> Egal ob für Sie selbst, Ihre Abteilung oder unterschiedliche Standorte: Sie können die Seminarinhalte frei konfigurieren und um ihre Wunsch-Themen ergänzen.

***

### Nice to have: PS-Skriptsprachen voll im Trend

Die Shell liegt voll im Trend! Das Diagramm zeigt die weltweite Entwicklung der Suchanfragen für PowerShell, Visual Basic Script und CMD seit 2004. Wer den aktuellen Stand sehen möchte oder die Parameter verändern will, folgt einfach dem Link zu [Google Trends](https://trends.google.de/trends/explore?cat=5&date=all&q=PowerShell,VBScript,cmd.exe).

 ![[images/PowerShell-Google-Trends.png]]

Bitte bewerten Sie diesen Artikel
---------------------------------

\[site\_reviews\_form category="121" assign\_to="26" id="kc7stc4o" hide="title,content,name,email,terms"\]

***