---
title: PowerShell Cmdlet finden
subtitle: 9 Möglichkeiten der Suche
category: PowerShell
subcategory: Basics
---

# PowerShell Cmdlet finden - 9 Möglichkeiten der Suche

<!-- vscode-markdown-toc -->
* 1. [Überblick](#berblick)
* 2. [Cmdlet über Namen finden](#CmdletberNamenfinden)
* 3. [Cmdlet über Tätigkeit finden](#CmdletberTtigkeitfinden)
* 4. [Cmdlet über Tätigkeitsbereich finden](#CmdletberTtigkeitsbereichfinden)
* 5. [Cmdlet über Tätigkeit und Tätigkeitsbereich finden](#CmdletberTtigkeitundTtigkeitsbereichfinden)
* 6. [Cmdlet über Parameter-Name oder Parameter-Typ finden](#CmdletberParameter-NameoderParameter-Typfinden)
* 7. [Cmdlets über Modul-Name suchen](#CmdletsberModul-Namesuchen)
* 8. [Cmdlet über PowerShell Gallery finden](#CmdletberPowerShellGalleryfinden)
* 9. [Cmdlet über `Show-Command` finden](#CmdletberShow-Commandfinden)
* 10. [Cmdlet über Google-Suche finden](#CmdletberGoogle-Suchefinden)
* 11. [Weiterer Mehrwert zum Suchen und Finden](#WeitererMehrwertzumSuchenundFinden)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

##  1. <a name='berblick'></a>Überblick

In PowerShell gibt es kleine Befehls-Schnippsel (Commandlet oder Cmdlet) die unsere tägliche Arbeit erleichtern. Nehme ich einmal die Cmdlets der Azure-Module hinzu, können wir aus einem Portfolio von mehr als 9.000 Cmdlets schöpfen. Spätestens bei dieser Menge wird klar, dass ein lineares Abgrasen, um ein Command zu finden keinen Sinn macht. **PowerShell bietet jedoch genügend Möglichkeiten** ein benötigtes Commandlet einfach zu suchen und zu finden. Wie diese Möglichkeiten ausschauen behandeln dieses Tutorial.

Erfahrene DOS-Scripter verfallen schnell in die alte Denke und verschließen sich so vor der Eleganz der Shell. Was ich am folgenden Beispiel demonstrieren möchte.

**Ist der Zielhost erreichbar?** Am Unterschied zwischen `ping.exe` (DOS-Welt) und `Test-NetConnection` (PowerShell-Welt) **den Mehrwert von Objekten schätzen lernen**.

```powershell
# LÖSUNG - DOS-Welt via ping.exe
$result = ping.exe 127.0.0.1 | Select-String -Pattern 'Verloren = 0' | Measure-Object | Select-Object -ExpandProperty Count
# VS. LÖSUNG - PowerShell-Welt via Test-NetConnection
$result = tnc 127.0.0.1 | Select - ExpandProperty 'PingSucceeded'

if ($result) {
    "Zielhost erreichbar, führe weitere Schritt aus..." |  Write-Warning
}
```

Die `ping.exe` ist schnell aufgerufen. Wer aber mit diesem Ergebnis weiterarbeiten möchte oder mit seinem Echo-Paket an der Firewall zerschellt wird feststellen das die DOS-Box und deren Befehle schon lange keine Alleskönner mehr sind. In der Shell lassen sich die eben aufgezeigten Probleme ganz leicht lösen.

```powershell
Test-NetConnection -ComputerName 192.161.80.136 -CommonTCPPort SMB | Select-Object -ExpandProperty TcpTestSucceeded
```

Erstens erhalten wir von `Test-NetConnection` ein einfach auswertbares Objekt (z.B. `.TcpTestSucceeded` vom Typ \[Boolean\]) und zweitens können wir auch andere Protokolle (HTTP, RDP, SMP, WinRM) heranziehen, um die Connectivity zu prüfen.

Natürlich ist der Befehl etwas länger, aber immer noch kein Grund mit `ping.exe` zu arbeiten. Es geht auch so:

Da `tnc` ein Alias für `Test-NetConnection` und der Parametername `-ComputerName` optional ist. Also nur Vorteile gegenüber der Altlast `ping.exe`, wenn da nicht der unauffindbare Name Test-NetConnection wäre. Erst recht, wenn ich ein mir unbekanntes Commandlet suche und finden möchte.

> HINWEIS - Wenn Sie sich mit der Objekt Analyse und der Pipeline Verarbeitung vertraut machen möchten, empfehle ich Ihnen meine Artikel: [PowerShell Objekte in 3 Schritten erfolgreich analysieren](https://attilakrick.com/powershell/powershell-objekt-analyse/), [PowerShell Pipeline Sinn & Nutzen erklärt](https://attilakrick.com/powershell/funktionsweise-powershell-pipeline/) und [PowerShell Einstieg für Anfänger und Profis](https://attilakrick.com/powershell/powershell-tutorial/).

 ![](images/PowerShell-Cmdlet-finden-Code.png)

##  2. <a name='CmdletberNamenfinden'></a>Cmdlet über Namen finden

```powershell
Get-Command -Name '*-*connection*' -CommandType 'Cmdlet', 'Function'
```

> TIPP - Ein CmdCommandletlet über die direkte Eingabe und Intellisense vorschlagen lassen z.B. beginnen Sie zu tippen: `conn` und Intellisense schlägt Cmdlets vor die 'conn' enthalten. `CTRL`+`SPACE` öffnet Intellisense, auch in der Shell-Konsole.

##  3. <a name='CmdletberTtigkeitfinden'></a>Cmdlet über Tätigkeit finden

Aber welche Tätigkeiten (Verb, Noun) gibt es eigentlich? Die folgenden:

```powershell
Get-Verb | Sort-Object -Property 'Verb' | Format-Wide -AutoSize
```

##  4. <a name='CmdletberTtigkeitsbereichfinden'></a>Cmdlet über Tätigkeitsbereich finden

```powershell
Get-Command -Noun 'Computer'
Get-Command -Noun 'Process'
Get-Command -Noun 'Service'
Get-Command -Noun 'NetConnection'
```

##  5. <a name='CmdletberTtigkeitundTtigkeitsbereichfinden'></a>Cmdlet über Tätigkeit und Tätigkeitsbereich finden

```powershell
Get-Command -Verb 'Get' -Noun '*connection'
```

##  6. <a name='CmdletberParameter-NameoderParameter-Typfinden'></a>Cmdlet über Parameter-Name oder Parameter-Typ finden

> ACHTUNG - Die Suche nach Commands über den Parameter-Typ funktioniert nur für die aktuell importierten Module.

```powershell
Get-Command -Name '*' -ParameterName 'ComputerName'

# ! Betrifft nur importierte Module
Get-Command -Name '*' -ParameterType [SecureString]
```

##  7. <a name='CmdletsberModul-Namesuchen'></a>Cmdlets über Modul-Name suchen

```powershell
# z. Bsp. Welche Commandlets sind im Modul NetTCPIP enthalten
Get-Command -Name * -Module 'NetTCPIP'

# ? Welche Module sind überhaupt installiert
Get-Module -ListAvailable | Out-GridView
```

> TIPP - Mein persönlicher Favorit. Zuerst suche ich den Modul-Namen, um mir anschließend die darin enthalten Command anzeigen zu lassen. So verschaffe ich mir ein Überblick über Module und den Commands.

##  8. <a name='CmdletberPowerShellGalleryfinden'></a>Cmdlet über PowerShell Gallery finden

Sie finden z.B. in einem Kollegen-Skript das Commandlet `Invoke-SqlCmd` das auf Ihrem PC nicht gefunden wird. Also welches Modul müsste aus der [PowerShell Gallery](https://www.powershellgallery.com/) installiert werden, um dieses Commandlet ausführen zu können.

![](images/PowerShell-Gallery-Beispiel-1.jpg)

```powershell
Find-Command -Name 'Invoke-SqlCmd'
```

##  9. <a name='CmdletberShow-Commandfinden'></a>Cmdlet über `Show-Command` finden

##  10. <a name='CmdletberGoogle-Suchefinden'></a>Cmdlet über Google-Suche finden

```powershell
Start-Process -FilePath 'https://www.google.de/search?q=powershell+ping'
```

##  11. <a name='WeitererMehrwertzumSuchenundFinden'></a>Weiterer Mehrwert zum Suchen und Finden

Da `Get-Command` oft temporär verwendet wird, ist die Benutzung des Alias `gcm` effizienter und erlaubt.

**Suche einschränken auf importierte Module** - Sie können Ihre Suche auf die geladenen Module (`Get-Module`) einschränken.

```powershell
Get-Command -Name '*' -ListImported
```

**Mehrdeutige Cmdlets auflisten** - Commandlet-Namen müssen nicht eindeutig sein. Das führt aber beim Benutzen zu Problem. Über folgenden Code lokalisieren Dubletten.

```powershell
$ambivalentCmdlets = Get-Command -Name '*' -All | Group-Object -Property 'Name' | Where-Object -Property 'Count' -GE -Value 2
$ambivalentCmdlets[0].Group
```

Benötigen Sie jedoch die Dubletten, erst recht im gleichen Script. So könne Sie diese über den Modul Namen ansprechen.

```powershell
SqlServer\Invoke-SqlCmd
Microsoft.PowerShell.Management\Test-Connection
```
