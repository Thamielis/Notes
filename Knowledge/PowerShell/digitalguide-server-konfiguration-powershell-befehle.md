# Source: https://www.ionos.at/digitalguide/server/konfiguration/powershell-befehle/

## URL: https://www.ionos.at/digitalguide/server/konfiguration/powershell-befehle/

    PowerShell-Befehle: 40 wichtige Cmdlets im Überblick - IONOS AT                                       

Preisgünstiges Cloud ComputingSparen Sie 50 % Ihrer Computing-Kosten

IONOS ist als neuer Preis-Leistungs-Führer im Cloud Computing durch Cloud Mercato im Juli 2024 ausgezeichnet worden.

Jetzt starten

![20240725_DE-FR-SEO_DG_Exit-Intent-Pop-Up_CloudPriceCamp-Desktop_750x750-v1.png](https://www.ionos.at/digitalguide/fileadmin/_processed_/4/c/csm_20240725_DE-FR-SEO_DG_Exit-Intent-Pop-Up_CloudPriceCamp-Desktop_750x750-v1_f087a2e88f.webp)

![20240725_DE-FR-SEO_DG_Exit-Intent-Pop-Up_CloudPriceCamp-Mobile_900x750-v1.png](https://www.ionos.at/digitalguide/fileadmin/_processed_/2/e/csm_20240725_DE-FR-SEO_DG_Exit-Intent-Pop-Up_CloudPriceCamp-Mobile_900x750-v1_f021ae0c33.webp)

PowerShell-Befehle: Die 40 wichtigsten Commands auf einen Blick
===============================================================

*   IONOS Redaktion11.10.2023
*   *   [Auf Facebook teilen](https://www.facebook.com/sharer/sharer.php?u=https://www.ionos.at/digitalguide/server/konfiguration/powershell-befehle/ "Auf Facebook teilen")
    *   [Auf Twitter teilen](https://twitter.com/intent/tweet?source=https://www.ionos.at/digitalguide/server/konfiguration/powershell-befehle/&text=PowerShell-Befehle&hashtags=DigitalGuide&url=https://www.ionos.at/digitalguide/server/konfiguration/powershell-befehle/ "Auf Twitter teilen")
    *   [Auf LinkedIn teilen](https://www.linkedin.com/shareArticle?mini=true&url=https://www.ionos.at/digitalguide/server/konfiguration/powershell-befehle/ "Auf LinkedIn teilen")

*   [Tutorials](https://www.ionos.at/digitalguide/tags/tutorials/)

![PowerShell-Befehle: Die 40 wichtigsten Commands auf einen Blick](data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMSAxIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogICAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idHJhbnNwYXJlbnQiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPgo8L3N2Zz4K "PowerShell-Befehle: Die 40 wichtigsten Commands auf einen Blick")BEST-BACKGROUNDSShutterstock

Mit den passenden PowerShell-Befehlen nutzen Sie Module deutlich zielgerichteter. Die unterschiedlichen Cmdlets sind logisch aufgebaut und können optional um Parameter erweitert werden. Wir zeigen Ihnen die 40 wichtigsten PowerShell-Commands, damit Sie in Ihrem System oder Netzwerk optimal arbeiten können.

Was sind PowerShell-Commands?
-----------------------------

Die [PowerShell](https://www.ionos.at/digitalguide/server/knowhow/windows-powershell/ "Windows PowerShell"), die seit Windows 7 vorinstalliert ist, erlaubt es Ihnen, PowerShell-Befehle einzugeben, die dann von Windows ausgeführt werden. Neben den [cmd-Befehlen](https://www.ionos.at/digitalguide/server/knowhow/windows-cmd-befehle/ "Windows-CMD-Befehle") der Kommandozeile gibt es zahlreiche weitere Commands oder Cmdlets, die nur von der PowerShell selbst verstanden werden können. Diese Cmdlets **bestehen aus einem Verb und einem Substantiv**, welche durch einen Bindestrich getrennt sind. Außerdem können **optionale Parameter** die PowerShell-Commands spezifizieren. Diese Parameter werden durch ein Leerzeichen abgetrennt. Die PowerShell wird längst nicht mehr nur von Administratoren oder Administratorinnen genutzt, sondern leistet gerade auch im Bereich der Entwicklung wertvolle Dienste. Es gibt Hunderte vorinstallierter PowerShell-Befehle. Wir stellen Ihnen die wichtigsten vor.

Die wichtigsten PowerShell-Befehle
----------------------------------

PowerShell-Befehle erlauben Ihnen die Ausführung teils sehr umfangreicher Administrationsaufgaben mit nur wenigen Eingaben. Zu den Befehlen, die Sie vermutlich am häufigsten benötigen werden, gehören die folgenden Basisbefehle. Diese liefern eine erste Übersicht über die gesamte Struktur eines Netzwerks, listen andere PowerShell-Commands auf, helfen bei notwendigen Sicherheitskonfigurationen oder erstellen nützliche Analysen. Zu den wichtigsten PowerShell-Befehlen gehören insbesondere diese:

### 1\. Get-Module -All

Möchten Sie sich einen ersten Überblick über alle importierten PowerShell-Module verschaffen, nutzen Sie dafür den Command **Get-Module -All**.

    Get-Module -All

Copy

shell

### 2\. Get-Command

Es gibt zahlreiche vordefinierte PowerShell-Befehle. Brauchen Sie eine Übersicht über die PowerShell-Commands, die Ihnen aktuell zur Verfügung stehen, nutzen Sie dafür den Befehl **Get-Command**. Dieser listet sämtliche möglichen Aktionen übersichtlich auf und liefert eine kurze Erklärung zum jeweiligen Cmdlet. Dies gilt auch, wenn Sie zusätzliche Module installiert haben.

    Get-Command

Copy

shell

### 3\. Get-Help

Die oben beschriebene Auflistung durch Get-Command gibt Ihnen zwar einen ersten Überblick, benötigen Sie allerdings weiterführende Informationen über einen Befehl und seine Möglichkeiten, verwenden Sie den Cmdlet **Get-Help**. Dieser Befehl greift auf die Hilfedateien auf Ihrem PC zurück und liefert Ihnen dann alle verfügbaren Informationen. Um diese Hilfe zu aktivieren, kombinieren Sie Get-Help mit dem Befehl, dessen Syntax Sie einsehen möchten.

    Get-Help [[-Name] <String>] [-Path <String>] [-Category <String[]>] [-Component <String[]>] [-Functionality <String[]>] [-Role <String[]>] [-Examples] [<CommonParameters>]

Copy

shell

### 4\. Get-Process

In vielen Fällen ist es hilfreich, wenn Sie schnellstmöglich eine Übersicht über alle aktiven Anwendungen, Programme und Prozesse bekommen, die aktuell auf Ihrem System ausgeführt werden. Eine Übersicht erhalten Sie mit dem Command **Get-Process**. Spezifizieren Sie ihn mit einer bestimmten Anwendung, so erhalten Sie weiterführende Informationen zu dieser.

    Get-Process

Copy

shell

### 5\. Get-Service

Der Befehl **Get-Service** funktioniert ähnlich wie der Cmdlet Get-Process. Der Unterschied ist, dass Get-Service Ihnen Informationen zu allen aktiven Diensten ausspielt. Möchten Sie nur Informationen zu einem bestimmten Dienst oder einer bestimmten Art unterschiedlicher Dienste erhalten, so präzisieren Sie Ihre Anfrage einfach.

    Get-Service

Copy

shell

### 6\. Stop-Process

Sie können auch unterschiedliche PowerShell-Befehle nutzen, um Prozesse über die Shell zu stoppen. Eine Option dafür ist der Befehl **Stop-Process**. Den entsprechenden Prozess hinterlegen Sie per Name, ID oder mit anderen Attributen. Das sieht beispielhaft so aus:

    Stop-Process -Name "prozessname"

Copy

shell

    Stop-Process -Id 3582 -Confirm -PassThru

Copy

shell

Mit -Confirm wird eine Bestätigung des Befehls gefordert. Der Command -PassThru fordert eine Bestätigung des angehaltenen Prozesses an. Diese erfolgt nicht automatisch.

### 7\. ConvertTo-HTML

Um Probleme oder mögliche Komplikationen schnellstmöglich identifizieren zu können, ist eine übersichtliche Darstellung sehr hilfreich. Mit dem Befehl **ConvertTo-HTML** wird die Ausgabe der jeweiligen PowerShell-Commands in eine HTML-Datei übertragen. Dadurch werden sämtliche Informationen in einem gut lesbaren Spaltenformat angezeigt. Der Befehl sieht zum Beispiel so aus:

    Get-Command | ConvertTo-Html > c:\temp\AllCommands.html

Copy

shell

### 8\. ConvertTo-Xml

Ähnlich können Sie auch vorgehen, wenn Sie eine XML-basierte Darstellung eines bestimmten Objekts benötigen. Dies gelingt mit dem Befehl **ConvertTo-Xml**. Im folgenden Beispiel konvertieren Sie das aktuelle Datum in das Format XML:

    Get-Date | ConvertTo-Xml

Copy

shell

### 9\. Where-Object

Mit dem Befehl **Where-Object** können Sie das Ergebnis eines Cmdlets filtern. Führen Sie einen Command aus, erhalten Sie häufig viele Objekte, die Sie jedoch nicht vollständig benötigen. Where-Object leitet den Output über eine Pipe weiter und spielt Ihnen damit nur die gesuchten Informationen aus. Wenn Sie zum Beispiel lediglich Dienste einsehen möchten, die in diesem Jahr erstellt oder aktualisiert wurden, funktioniert dies folgendermaßen:

    Get-Service | Where-Object { $_.LastWriteTime -gt "01.01.2023" }

Copy

shell

### 10\. Get-History

Möchten Sie sämtliche PowerShell-Befehle, die Sie während einer Sitzung eingegeben haben, auflisten, ist **Get-History** der passende Cmdlet. So listen Sie alle PowerShell-Commands auf:

    Get-History

Copy

shell

Mit dieser Spezifikation rufen Sie nur die letzten zehn PowerShell-Befehle auf:

    Get-History -Count 10

Copy

shell

### 11\. Clear-History

Natürlich haben Sie auch die Möglichkeit, die Auflistung der genutzten PowerShell-Commands zu löschen. Möchten Sie alle Einträge entfernen, nutzen Sie den Cmdlet **Clear-History**:

    Clear-History

Copy

shell

Wollen Sie nur bestimmte PowerShell-Befehle löschen, fügen Sie einfach die entsprechenden Parameter hinzu. Die folgende Eingabe entfernt sämtliche PowerShell-Commands, die „Help“ enthalten oder mit „Syntax“ enden.

    Clear-History -Command *Help*, *Syntax

Copy

shell

### 12\. Add-History

Es ist auch möglich, PowerShell-Befehle zu einer Sitzung hinzuzufügen. So können Sie diese beim nächsten Mal wieder direkt aufrufen. Der passende Cmdlet lautet **Add-History**.

    Add-History

Copy

shell

### 13\. Out-File

Möchten Sie die Ausgabe Ihrer PowerShell-Befehle auf Ihrem Rechner speichern, verwenden Sie den Cmdlet **Out-File**. Dieser hinterlegt die PowerShell-Commands in einer Rohtextdatei unter dem angegebenen Pfad.

    Get-Process | Out-File -FilePath .\Process.txt

Copy

shell

### 14\. Copy-Item

Auch in der PowerShell haben Sie die Option, Elemente zu kopieren und die Kopie an einem anderen Speicherort zu hinterlegen. Dafür nutzen Sie den Befehl **Copy-Item** und geben außerdem das Verzeichnis an, in dem die Kopie gespeichert werden soll. Dies funktioniert folgendermaßen:

    Copy-Item "C:\Ordner1\Datei.txt" -Destination "C:\Ordner2"

Copy

shell

### 15\. Get-ChildItem

Mit dem Befehl **Get-ChildItem** rufen Sie Elemente an einem oder mehreren Speicherorten ab. Gibt es untergeordnete Elemente, so werden auch diese angezeigt. Ihnen werden mit diesem Befehl standardmäßig die Attribute, der Zeitpunkt der letzten Änderung, die Größe der Datei sowie der Name des Elements aufgelistet. Ist ein Speicherort leer, entfällt die Ausgabe.

    Get-ChildItem -Path C:\Beispiel

Copy

shell

Die Attribute werden unter der Zeile „Mode“ ausgewiesen. Folgende Eigenschaften sind dabei gängig:

*   a (Archiv)
*   d (Verzeichnis)
*   h (ausgeblendet)
*   l (Link)
*   r (schreibgeschützt)
*   s (System)

### 16\. Set-AuthenticodeSignature

Um Ihre Dateien zu schützen, können Sie sie mit dem Befehl **Set-AuthenticodeSignature** mit einer Authenticode-Signatur ausstatten. Dies funktioniert allerdings ausschließlich für Dateien, die das Subject Interface Package (SIP) unterstützen.

    $cert=Get-ChildItem -Path Cert:\CurrentUser\My -CodeSigningCert
    Set-AuthenticodeSignature -FilePath PsTestInternet2.ps1 -Certificate $cert

Copy

shell

### 17\. Invoke-Item

Möchten Sie die Standardaktion für eine bestimmte Datei ausführen, ist **Invoke-Item** der einfachste Weg. Der Command sorgt zum Beispiel dafür, dass eine ausführbare Datei direkt ausgeführt oder eine Dokumentdatei in der zugeordneten Anwendung geöffnet wird. In diesem Beispiel wird die Datei standardmäßig in Microsoft Word aufgerufen:

    Invoke-Item "C:\Test\Beispiel.doc"

Copy

shell

### 18\. Start-Job

Auch wenn Sie einen Hintergrundauftrag auf Ihrem lokalen Rechner initiieren möchten, gibt es dafür den passenden Befehl. Mit **Start-Job** führen Sie einen spezifischen Command im Hintergrund aus, der nicht mit der aktuellen Sitzung interagiert.

    Start-Job -ScriptBlock { Get-Process -Name pwsh }

Copy

shell

Dedicated Server

Dedizierte Server mit modernsten Prozessoren

*   100 % Enterprise-Hardware
*   Minutengenaue Abrechnung
*   Nur bei uns: Cloud-Funktionen

Server entdecken

Aktionen durchführen mit diesen PowerShell-Commands
---------------------------------------------------

Während die bisherigen PowerShell-Befehle vor allem der Übersicht dienten, können Sie mit den passenden Cmdlets auch viele Aktionen durchführen und so Ihr System produktiv nutzen. Die folgenden PowerShell-Commands erleichtern Ihnen die Arbeit.

### 19\. Clear-Content

Wenn Sie den Inhalt eines Elements löschen möchten, das Element selbst allerdings intakt bleiben soll, ist der Befehl **Clear-Content** die richtige Wahl. Ein Beispiel für den Einsatz wäre ein Dokument, dessen Text Sie entfernen, während die eigentliche Datei unberührt bleibt. Dieser Vorgang sieht so aus:

    Clear-Content C:\Temp\Beispiel.txt

Copy

shell

### 20\. ForEach-Object

Der Befehl **ForEach-Object** erlaubt es Ihnen, einen Vorgang für alle Elemente in einer Auflistung von Eingabeobjekten auszuführen. In diesem Beispiel dividieren wir drei ganze Zahlen in einem Array durch 10:

    10000, 1000, 100 | ForEach-Object -Process {$_/10}
    1000
    100
    10

Copy

shell

### 21\. Compare-Object

Damit Sie unterschiedliche Sätze von Objekten nicht manuell abgleichen müssen, können Sie den Cmdlet **Compare-Object** nutzen. Der Befehl fertigt dann einen Bericht an, wo die Unterschiede zwischen den Sätzen liegen. Der erste Satz wird dabei als Verweisobjekt verwendet und der zweite Satz als Differenzobjekt. Welche Faktoren verglichen werden sollen, können Sie bestimmen. Verzichten Sie auf diese Information, werden lediglich die Zeichenfolgenergebnisse miteinander verglichen. Dabei unterteilt die Ausgabe in Eigenschaften, die lediglich im Verweisobjekt vorkommen (<==), und Eigenschaften, die nur im Differenzobjekt erscheinen (==>). In diesem Beispiel enthält Dokument1.txt die Werte Berlin, London und Paris. Dokument2.txt enthält Berlin, Wien und Amsterdam.

    Compare-Object -ReferenceObject (Get-Content -Path C:\Test\Dokument1.txt) -DifferenceObject (Get-Content -Path C:\Test\Dokument2.txt)
    InputObject	SideIndicator
    ---------------	-----------------
    Wien		==>
    Amsterdam	==>
    London		<==
    Paris		<==

Copy

shell

Inhalte, die in beiden Dokumenten vorkommen (in diesem Fall „Berlin“), werden standardmäßig nicht angezeigt.

### 22\. New-Object

Zu den besonders nützlichen PowerShell-Befehlen gehört auch **New-Object**. Mit diesem Cmdlet erstellen Sie eine Instanz eines .NET Frameworks oder eines Component Object Models (COM). Wenn Sie beispielsweise ein System.Version.Objekt mit 1.2.3.4 als Zeichenfolge für den Konstruktor kreieren möchten, funktioniert der Command wie folgt:

    New-Object -TypeName System.Version -ArgumentList "1.2.3.4"

Copy

shell

### 23\. Select-Object

Mit dem Befehl **Select-Object** wählen Sie ein Objekt oder eine Gruppe von Objekten aus, welche über die von Ihnen definierten Eigenschaften verfügen. Die Parameter, die Sie dafür festlegen können, sind diese:

*   First
*   Last
*   Unique
*   Skip
*   Index

Im folgenden Beispiel nutzen wir die PowerShell-Commands Get-Process und Sort-Object, um die drei Prozesse anzuzeigen, die zum Zeitpunkt der Eingabe den höchsten Arbeitsspeicherverbrauch aufweisen.

    Get-Process | Sort-Object -Property WS | Select-Object -Last 3

Copy

shell

### 24\. Set-Alias

[Windows-Shortcuts](https://www.ionos.at/digitalguide/server/konfiguration/windows-shortcuts/ "Windows-Shortcuts") sind eine gute Möglichkeit, um Aktionen noch schneller auszuführen. Grundsätzlich bietet auch PowerShell diese Option. Im System können Sie mit dem Cmdlet **Set-Alias** eine Abkürzung für unterschiedliche PowerShell-Befehle definieren. Im folgenden Beispiel erstellen wir für die aktuelle Sitzung den Alias „ci“ für den Command Get-ChildItem.

    PS> Set-Alias -Name ci -Value Get-ChildItem
    PS> Get-Alias -Name ci

Copy

shell

### 25\. Set-Location

Möchten Sie den Arbeitsspeicherort wechseln, nutzen Sie dafür den Befehl **Set-Location**. Mögliche neue Speicherorte sind Verzeichnisse, Unterverzeichnisse, Registrierungsspeicherorte oder Anbieterpfade. Im folgenden Beispiel bestimmen wir das Laufwerk C: zum aktuellen Speicherort:

    PS C:\Windows\> Set-Location HKLM:\
    PS HKLM:\> Set-Location C:
    PS C:\Windows\>

Copy

shell

### 26\. Set-Service

Mit dem Cmdlet **Set-Service** können Sie mit einem Dienst interagieren und diesen starten, beenden oder anhalten. Auch eine Änderung der Eigenschaften dieses Dienstes ist so möglich. Im folgenden Beispiel ändern wir den Anzeigenamen eines Dienstes von „Neue Workstation“ in „Alte Workstation“.

    Set-Service -Name Neue Workstation -DisplayName "Alte Workstation"

Copy

shell

### 27\. Set-TimeZone

Wenn Sie die Zeitzone Ihres Systems verändern möchten, ist der Command **Set-TimeZone** die richtige Wahl. Wollen Sie die koordinierte Weltzeit als neue Systemzeit einstellen, ist dies der passende Befehl:

    Set-TimeZone -Id "UTC"

Copy

shell

### 28\. Restart-Computer

Sie haben die Möglichkeit, das Betriebssystem auf Ihrem lokalen Rechner oder einem Remote Computer neu zu starten. Die passenden PowerShell-Befehle namens **Restart-Computer** sehen folgendermaßen aus:

Für Ihren lokalen Rechner:

    Restart-Computer

Copy

shell

Für bestimmte andere Computer in Ihrem Netzwerk:

    Restart-Computer -ComputerName Server01, Server03

Copy

shell

### 29\. Restart-Service

Wenn Sie einen Dienst über PowerShell-Befehle beenden und neustarten möchten, ist **Restart-Service** der passende Cmdlet. So starten Sie zum Beispiel alle Dienste neu, die mit „Net“ beginnen:

    PS C:\> Restart-Service -DisplayName "net*"

Copy

shell

### 30\. Clear-RecycleBin

Der Papierkorb sollte regelmäßig geleert werden. Die Leerung ist auch über die PowerShell möglich. Der Befehl lautet **Clear-RecycleBin**.

    Clear-RecycleBin

Copy

shell

### 31\. Get-ComputerInfo

Der Befehl **Get-ComputerInfo** wird verwendet, um System- und Betriebssystemeigenschaften abzurufen.

    Get-ComputerInfo

Copy

shell

### 32\. Move-Item

Es gibt verschiedene PowerShell-Befehle, wenn Sie ein Element von einem an einen anderen Speicherort verschieben möchten. Die gängigste Möglichkeit ist allerdings **Move-Item**. In diesem Beispiel verlegen wir die Datei alt.txt vom Laufwerk C: in das Verzeichnis D:\\Temp und benennen sie zusätzlich um in neu.txt.

    Move-Item -Path C:\alt.txt -Destination D:\Temp\neu.txt

Copy

shell

Monitoring und Debugging mit den passenden PowerShell-Befehlen
--------------------------------------------------------------

Besonders nützlich sind außerdem jene PowerShell-Commands, mit denen Sie Ihr System überwachen und überprüfen können. Dies ist gerade dann von Vorteil, wenn Sie ein neues Netzwerk und dessen Performance unter realistischen Bedingungen testen möchten. Folgende PowerShell-Befehle dürften sich hierbei als nützlich erweisen.

### 33\. Debug-Process

Debugging ist ein wichtiger Prozess, um sicherzustellen, dass alle Einstellungen und Prozesse fehlerfrei laufen. Dafür müssen Sie zunächst die passenden Debugger downloaden und konfigurieren. Ist dies geschehen, wenden Sie sie mit dem Befehl **Debug-Process** an. Im folgenden Beispiel nutzen wir einen Debugger für den Explorer:

    PS C:\> Debug-Process -Name "Explorer"

Copy

shell

Möchten Sie mehrere Prozesse gleichzeitig debuggen, so unterteilen Sie diese einfach per Kommata.

### 34\. Enable-PSBreakpoint

Wenn Sie bestimmte Haltepunkte (sogenannte Breakpoints) aktivieren möchten, nutzen Sie den Befehl **Enable-PSBreakpoint**. Dieser setzt den Wert des Cmdlets aus technischer Sicht auf „true“. Mit diesen PowerShell-Befehlen aktiveren Sie alle Haltepunkte der aktuellen Sitzung:

    Get-PSBreakpoint | Enable-PSBreakpoint

Copy

shell

Diesen Command nutzen Sie, um Haltepunkte mit Hilfe ihrer ID zu aktivieren:

    Enable-PSBreakpoint -ID 0, 3, 4

Copy

shell

### 35\. Disable-PSBreakpoint

Möchten Sie PowerShell Haltepunkte wieder deaktivieren, gibt es auch für diesen Zweck den passenden Cmdlet namens **Disable-PSBreakpoint**. Technisch gesehen, wird dafür der Wert des Befehls Enable-PSBreakpoint auf „false“ gesetzt. Um einen Haltepunkt mit der ID 0 zu deaktivieren, geben Sie Folgendes ein:

    Disable-PSBreakpoint -Id 0

Copy

shell

### 36\. Get-Counter

Verwenden Sie Windows-Geräte, können Sie über die PowerShell deren Leistungsdaten abrufen. Der passende Befehl dafür ist **Get-Counter**. Sie können den Befehl sowohl für Ihren lokalen Rechner als auch für Remote Computer anwenden. Im folgenden Beispiel rufen wir die Daten des lokalen Computers ab:

    Get-Counter -ListSet *

Copy

shell

### 37\. Start-Sleep

Gerade bei einer Überbelastung des Systems kann es sehr wichtig sein, dass Sie ein Skript oder eine Sitzung auch pausieren kann. Die PowerShell bietet dafür den Command **Start-Sleep**. Dabei geben Sie den Zeitraum an, in dem die Aktivitäten unterbunden werden sollen. Im folgenden Beispiel stoppt die Ausführung für zwei Sekunden.

    Start-Sleep -Seconds 2

Copy

shell

### 38\. Test-Path

Mit Hilfe des Befehls **Test-Path** überprüfen Sie, ob alle Elemente eines bestimmten Pfads vorhanden sind. Die möglichen Ergebnisse lauten „True“ oder „False“.

    Test-Path -Path "C:\Documents and Settings\Nutzer"
    False

Copy

shell

### 39\. Test-Connection

Auch die Verbindungen innerhalb Ihres Netzwerks können Sie mit der PowerShell testen. Diese sendet über den Befehl **Test-Connection** ein ICMP-Echoanforderungspaket an festgelegte Empfänger und fordert über dieses Internet Control Message Protocol eine Antwort an. In unserem Beispiel senden wir dem Server02 eine Anfrage über das [IPv6-Protokoll](https://www.ionos.at/digitalguide/server/knowhow/welche-vorteile-bietet-ipv6/ "Welche Vorteile bietet IPv6?").

    Test-Connection -TargetName Server02 -IPv6

Copy

shell

### 40\. Get-WinEvent

Benötigen Sie Einsicht in eines oder mehrere Ereignisprotokolle, stehen Ihnen unterschiedliche PowerShell-Befehle zur Verfügung. Der praktischste Cmdlet ist **Get-WinEvent**. Für sämtliche Protokolle von Ihrem lokalen Computer geben Sie folgenden Command ein:

    Get-WinEvent -ListLog *

Copy

shell

War dieser Artikel hilfreich?

vote upvote down

Warum nicht?

*   Veraltet
*   Fehlerhaft
*   Unverständlich

Verwandte Tags

*   [Tutorials](https://www.ionos.at/digitalguide/tags/tutorials/)

### Inhaltsverzeichnis

### Passende Produkte

![cloud-server.svg](https://www.ionos.at/digitalguide/fileadmin/DigitalGuide/Product_Icons/cloud-server.svg)

Cloud Server

Zu den Tarifen

[

![20240726_DE-SEO_DG_IAS-Sidebar_CloudPriceCamp-Mobile-600x500-v1.png](https://www.ionos.at/digitalguide/fileadmin/_processed_/9/5/csm_20240726_DE-SEO_DG_IAS-Sidebar_CloudPriceCamp-Mobile-600x500-v1_bb94378847.webp)

![20240726_DE-SEO_DG_IAS-Sidebar_CloudPriceCamp-Mobile-600x500-v1.png](https://www.ionos.at/digitalguide/fileadmin/_processed_/9/5/csm_20240726_DE-SEO_DG_IAS-Sidebar_CloudPriceCamp-Mobile-600x500-v1_bb94378847.webp)

](https://cloud.ionos.de/compute)

Beliebte Artikel

[Was ist eine E-Mail Domain und wie wird diese eingerichtet?](https://www.ionos.at/digitalguide/e-mail/e-mail-technik/gute-gruende-fuer-die-eigene-e-mail-domain/ "Was ist eine E-Mail Domain und wie wird diese eingerichtet?")

Setzen Sie auf professionelle E-Mail-Kommunikation! Wir zeigen Ihnen die Vorteile einer…

Mehr lesen

[Wie kauft man eine Domain? Eine Anleitung](https://www.ionos.at/digitalguide/domains/domaintipps/wie-kauft-man-eine-domain/ "Wie kauft man eine Domain? Eine Anleitung")

Wie registriert und sichert man sich eine Domain mit gewünschter Top- und…

Mehr lesen

[Welche Domaintypen gibt es?](https://www.ionos.at/digitalguide/domains/domainendungen/domaintypen/ "Welche Domaintypen gibt es?")

Welche Domainendungen gibt es? Und worin liegt der Unterschied zwischen Top-Level-Domain…

Mehr lesen

[Prompt Engineering erklärt](https://www.ionos.at/digitalguide/websites/webseiten-erstellen/prompt-engineering/ "Prompt Engineering erklärt")

Was ist Prompt Engineering, wie lassen sich damit die Ergebnisse von ChatGPT und Co.…

Mehr lesen

[7 Website-Typen im Überblick: Welche Website brauchen Sie?](https://www.ionos.at/digitalguide/websites/webseiten-erstellen/website-typen/ "7 Website-Typen im Überblick: Welche Website brauchen Sie?")

Den richtigen Website-Typen zu wählen, ist entscheidend für den Erfolg jedes…

Mehr lesen

### Ähnliche Artikel

![Git Commands: Die wichtigsten Git-Befehle](https://www.ionos.at/digitalguide/fileadmin/_processed_/c/0/csm_testsystem-t_cb3591c530.webp "Git Commands: Die wichtigsten Git-Befehle")Maksim KabakouShutterstock

### [Git Commands: Die wichtigsten Git-Befehle](https://www.ionos.at/digitalguide/websites/web-entwicklung/git-commands/ "Git Commands: Die wichtigsten Git-Befehle")

Mit Git behalten Sie den Überblick über Ihre Projekte und arbeiten deutlich besser in Teams zusammen. Das Versionskontrollsystem ist vor allem dann hilfreich, wenn Sie die passenden Git Commands verwenden. Wir erklären Ihnen, was Git-Befehle sind und wie Sie diese für…

*   Git

Mehr lesen

![Minecraft Server Commands: Die wichtigsten Befehle auf einen Blick](https://www.ionos.at/digitalguide/fileadmin/_processed_/9/f/csm_minecraft-docker-server-t_3067ee8db0.webp "Minecraft Server Commands: Die wichtigsten Befehle auf einen Blick")

### [Minecraft Server Commands: Die wichtigsten Befehle auf einen Blick](https://www.ionos.at/digitalguide/server/knowhow/minecraft-server-commands/ "Minecraft Server Commands: Die wichtigsten Befehle auf einen Blick")

Minecraft Server Commands sind ein wichtiges Werkzeug, wenn Sie Ihren Server verwalten und das Spiel anpassen möchten. So haben Sie nicht nur die Möglichkeit, auf Verstöße zu reagieren, sondern können auch Items und Spawnpunkte bearbeiten. Wir erklären, wie Sie weitere Operatoren…

*   Tutorials
*   Gameserver

Mehr lesen

![MongoDB Commands: Die wichtigsten Befehle auf einen Blick](https://www.ionos.at/digitalguide/fileadmin/_processed_/c/0/csm_testsystem-t_cb3591c530.webp "MongoDB Commands: Die wichtigsten Befehle auf einen Blick")Maksim KabakouShutterstock

### [MongoDB Commands: Die wichtigsten Befehle auf einen Blick](https://www.ionos.at/digitalguide/websites/web-entwicklung/mongodb-commands/ "MongoDB Commands: Die wichtigsten Befehle auf einen Blick")

Durch MongoDB Commands ist die Arbeit mit dem Datenbankmanagementsystem MongoDB einfach und intuitiv. In diesem Artikel haben wir die wichtigsten Befehle übersichtlich aufgelistet und erklären Ihnen leicht verständlich, wofür die einzelnen Funktionen benötigt werden. So haben Sie…

*   Cloud
*   Datenbank
*   Tutorials
*   MongoDB

Mehr lesen

![netstat-Commands für Windows, Linux und Mac im Überblick](https://www.ionos.at/digitalguide/fileadmin/_processed_/1/f/csm_netzwerk-t_53012681e9.webp "netstat-Commands für Windows, Linux und Mac im Überblick")hywardsShutterstock

### [netstat-Commands für Windows, Linux und Mac im Überblick](https://www.ionos.at/digitalguide/server/tools/netstat-commands/ "netstat-Commands für Windows, Linux und Mac im Überblick")

Das Netzwerk-Tool netstat nutzen Sie sowohl in Windows als auch in macOS und Linux über das jeweilige Kommandozeilenprogramm. Je nachdem, mit welchem System Sie arbeiten, benötigen Sie lediglich die passenden netstat-Commands, um den Status aktiver und inaktiver Verbindungen zu…

*   Tutorials

Mehr lesen

![PowerShell Script: Erstellen und Ausführen von automatisierten Aufgaben](https://www.ionos.at/digitalguide/fileadmin/_processed_/8/4/csm_behavior-driven-development-t_dcbe6f9a8d.webp "PowerShell Script: Erstellen und Ausführen von automatisierten Aufgaben")NDAB Creativityshutterstock

### [PowerShell Script: Erstellen und Ausführen von automatisierten Aufgaben](https://www.ionos.at/digitalguide/server/konfiguration/powershell-script-erstellen/ "PowerShell Script: Erstellen und Ausführen von automatisierten Aufgaben")

Windows PowerShell bietet eine objektorientierte Verwaltung, was bedeutet, dass Daten als Objekte behandelt werden. Dies ermöglicht die detaillierte Kontrolle und Analyse von Systemressourcen. Wir zeigen Ihnen Schritt für Schritt, wie Sie ein PowerShell Script erstellen können,…

*   Tutorials

Mehr lesen

![PowerShell über SSH verbinden](https://www.ionos.at/digitalguide/fileadmin/_processed_/4/d/csm_dns-ttl-verstehen-und-anwenden_eee794d840.webp "PowerShell über SSH verbinden")REDPIXEL.PLshutterstock

### [PowerShell über SSH verbinden](https://www.ionos.at/digitalguide/server/konfiguration/powershell-ssh/ "PowerShell über SSH verbinden")

PowerShell SSH kann Windows- und Linux-Remote-Systeme von einer zentralen Stelle aus verwalten. Dies ist besonders nützlich in gemischten Umgebungen, in denen verschiedene Betriebssysteme eingesetzt werden. Sie können mit SSH Befehle ausführen, Dateien übertragen oder…

*   Tutorials

Mehr lesen

Page top

### Cookie-Einstellungen

Wir setzen Cookies ein, um unsere Webseiten optimal für Sie zu gestalten, unsere Produkte für Sie zu verbessern sowie Ihnen zusammen mit Drittanbietern interessengerechte Werbung anzuzeigen. In den Einstellungen können Sie auswählen, welche Cookies Sie zulassen wollen, sowie Ihre Auswahl jederzeit ändern. Weitere Infos finden Sie in unserer [Richtlinie zur Verwendung von Cookies](https://www.ionos.at/cookies) und in unseren [Datenschutzhinweisen](https://www.ionos.at/terms-gtc/terms-privacy). Technisch notwendige Cookies werden auch bei der Auswahl von ablehnen gesetzt.

Mit einem Klick auf "Akzeptieren" stimmen Sie der Verarbeitung und der Übermittlung Ihrer Daten an Drittländer zu.

[Impressum](https://www.ionos.de/impressum)

Akzeptieren

Ablehnen

Einstellungen
---


# Crawl Statistics

- **Source:** https://www.ionos.at/digitalguide/server/konfiguration/powershell-befehle/
- **Depth:** 1
- **Pages processed:** 1
- **Crawl method:** browser
- **Duration:** 31.09 seconds
- **Crawl completed:** 21.3.2025, 17:18:48

