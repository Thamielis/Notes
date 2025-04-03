---
created: 2022-03-24T17:54:37 (UTC +01:00)
tags: [Desired State Configuration,DSC,PowerShell,Resources,Get-DscResource,PSGallery,Github]
source: https://www.windowspro.de/wolfgang-sommergut/desired-state-configuration-dsc-grundlagen-funktionsweise
author: Wolfgang Sommergut
---

# Desired State Configuration (DSC): Grundlagen und Funktionsweise | WindowsPro

> ## Excerpt
> Desired State Configuration (DSC) ist eine PowerShell-Erweiterung, mit der sich die Einstellungen von Windows und Anwendungen dynamisch konfigurieren lassen.

---
![Desired State Configuration (DSC)](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/thumbs/dsc-teaser.png)PowerShell 4.0 führte eine deklarative Erweiterung zur Konfiguration von Systemeinstellungen ein. Damit lassen sich nicht nur Windows und Linux, sondern auch Anwendungen wie SQL Server oder SharePoint anpassen. DSC kann GPOs und andere Deployment-Tools ersetzen.

Für verschiedene Deployment-Szenarien hat es sich eingebürgert, dass Admins ein so genanntes _Golden Image_ erstellen, das bereits alle Rollen und Features für bestimmte Aufgaben enthält. Beispiele wären etwa der Einsatz von Windows Server als Web-Server oder Hyper-V-Host. Ein solcherart angepasstes Systemabbild wird dann auf die Zielrechner verteilt.

## Dynamische Anpassung des OS

Darauf kann man beim Einsatz von DSC verzichten, weil  sie in der Lage ist, die notwendige Funktionalität während der Laufzeit hinzuzufügen. Als Ausgangspunkt reicht ihr somit eine Standardinstallation des OS von einer unmodifizierten ISO oder WIM.

Neben dem dynamischen Aktivieren oder Entfernen von Komponenten konfiguriert DSC alle möglichen Einstellungen. Diese Aufgabe kommt traditionell den Gruppenrichtlinien zu, die GPOs in regelmäßigen Intervallen auf Änderungen prüfen und sie auf ein laufendes System anwenden.

Das DSC-Gegenstück zu den Client Side Extensions der Gruppenrichtlinien ist der so genannte Local Configuration Manager, der eine Konfiguration auf dem Zielrechner implementiert und überwacht. Im Unterschied zu den Group Policies lässt er sich über Push- und Pull-Mechanismen füttern.

## Konfiguration über das Web verteilen

Für wenige Rechner reicht es aus, wenn man eine Konfiguration auf die Ziel-PCs kopiert und dort mit dem Cmdlet _Start-DscConfiguration_ anwendet.

[![DSC-Konfigurationen lassen sich über Push oder Pull auf die Zielsysteme anwenden.](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/thumbs/powershell-dsc-pull-push.png)](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/powershell-dsc-pull-push.png "DSC-Konfigurationen lassen sich über Push oder Pull auf die Zielsysteme anwenden.")

DSC-Konfigurationen lassen sich über Push oder Pull auf die Zielsysteme anwenden.

Für größere Umgebungen richtet man dagegen einen Pull-Server ein, von dem die betreffenden Systeme ihre Konfiguration regelmäßig abrufen. Dafür benötigt man auf der einen Seite einen spezifisch angepassten Web-Server, während man auf dem Client die DSC auf den Pull-Server ausrichten muss.

## Bedeutungsverlust für AD DS und GPOs

Im Unterschied zu den Gruppenrichtlinien hängt die Desired State Configuration nicht von Domänendiensten des Active Directory ab. Sie greifen somit auch auf Workgroup-Rechnern oder Nicht-Microsoft-Systemen wie Linux und lassen sich über die Cloud an jeden beliebigen Standort verteilen.

Die Weichenstellung von Microsoft in Richtung DSC kann man am Beispiel Nano Server erkennen. Diese superschlanke Installationsvariante unterstützt keine Gruppenrichtlinien mehr. Wer dort die [exportierten lokalen Richtlinien eines Rechners nicht manuell auf einen anderen übertragen](https://blogs.msdn.microsoft.com/powershell/2016/05/20/new-group-policy-cmdlets-for-nano-server/) möchte, sollte zu den DSC greifen.

## Konfiguration erstellen

Mit DSC erhielt PowerShell das neue Keyword _configuration_. Im Prinzip handelt es sich dabei um eine spezielle [function](https://www.windowspro.de/script/funktionen-powershell-parameter-datentypen-rueckgabewerte), die wie gewohnt durch Ausführen des Scripts geladen wird. Wenn man sie anschließend aufruft, dann schreibt sie die im Script enthaltene Konfiguration in eine so genannte MOF-Datei. Diese wird dann auf die Zielsysteme übertragen.

[![In der PowerShell_ISE kann man gleich mit einem vorgefertigten Skelett für eine Konfiguration starten.](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/thumbs/powershell-dsc-ise-skeleton.png)](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/powershell-dsc-ise-skeleton.png "In der PowerShell_ISE kann man gleich mit einem vorgefertigten Skelett für eine Konfiguration starten.")

In der PowerShell\_ISE kann man gleich mit einem vorgefertigten Skelett für eine Konfiguration starten.

Innerhalb des _configuration_\-Abschnitts legt man die gewünschten Einstellungen durch Einträge in der Form von _Name = Wert_ fest. Damit man überhaupt weiß, welche Einstellungen und Werte man beispielsweise für das Einrichten lokaler Benutzerkonten oder das Schreiben von Registry-Einträgen verwenden kann, stellt DSC diese Informationen über so genannte _Resources_ zur Verfügung.

Wenn man so möchte, handelt es sich bei den Resources um das Gegenstück zu den ADMX-Dateien der Gruppenrichtlinien. Sie liegen aber nicht als XML-Dateien vor, sondern als PowerShell-Module. Deshalb lassen sich die Namen der Einstellungen in der PowerShell\_ISE auch über IntelliSense automatisch vervollständigen.

[![Get-DscResource gibt eine Liste aller in Windows enthaltenen Ressourcen aus.](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/thumbs/powershell-dsc-get-dscresource.png)](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/powershell-dsc-get-dscresource.png "Get-DscResource gibt eine Liste aller in Windows enthaltenen Ressourcen aus.")

Get-DscResource gibt eine Liste aller in Windows enthaltenen Ressourcen aus.

Zum Lieferumfang von Windows gehören [nur ein paar Ressourcen](https://msdn.microsoft.com/en-us/powershell/dsc/builtinresource), die man durch den Aufruf von _Get-DscResource_ anzeigen kann. Möchte man den Inhalt einer bestimmten Ressource ausgeben, um die verfügbaren Einstellungen, ihren Datentyp und mögliche Werte zu ermitteln, gibt man im Fall von _User_

Get-DscResource -Name "User" | Select-Object -ExpandProperty Properties

ein.

[![Get-DscResource zeigt hier die Einstellungen für die Ressource User an. Ensure darf die Werte Absent oder Present annehmen.](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/thumbs/powershell-dsc-get-dscresource-user.png)](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/powershell-dsc-get-dscresource-user.png "Get-DscResource zeigt hier die Einstellungen für die Ressource User an. Ensure darf die Werte Absent oder Present annehmen.")

Get-DscResource zeigt hier die Einstellungen für die Ressource User an. Ensure darf die Werte Absent oder Present annehmen.

Die meisten Ressourcen stehen online zur Verfügung und lassen sich über die [OneGet-Funktionen](https://www.windowspro.de/wolfgang-sommergut/programme-installieren-entfernen-powershell-package-management) auflisten, herunterladen und installieren. Wenn man mit

Find-Module -Tag DSCResourceKit

das erste Mal nach Einträgen im Resource Kit sucht, dann muss man auf Nachfrage von PowerShell einen eigenen Provider für diesen Zweck installieren. Ein weiteres Repository findet man [auf Github](https://github.com/PowerShell/DscResources/).

[![Das DSC Resource Kit enthält zahlreiche Module mit Einstellungen für unterschiedliche Komponenten und Anwendungen.](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/thumbs/powershell-dsc-resource-kit.png)](https://www.windowspro.de/sites/windowspro.de/files/imagepicker/3/powershell-dsc-resource-kit.png "Das DSC Resource Kit enthält zahlreiche Module mit Einstellungen für unterschiedliche Komponenten und Anwendungen.")

Das DSC Resource Kit enthält zahlreiche Module mit Einstellungen für unterschiedliche Komponenten und Anwendungen.

Um etwa das Modul für Windows Defender zu installieren, würde man anschließend

Install-Module -Name xDefender

aufrufen und mit

Get-DscResource -Name xMpPreference  | Select-Object -ExpandProperty Properties

die darin enthaltenen Einstellungen anzeigen. Im Unterschied zu den integrierten Modulen muss man die selbst hinzugefügten Ressourcen mittels _Import-DscResource_ explizit hinzufügen.![](https://ssl-vg03.met.vgwort.de/na/d2a49b665fa44516956d9ac76e15ea07)
