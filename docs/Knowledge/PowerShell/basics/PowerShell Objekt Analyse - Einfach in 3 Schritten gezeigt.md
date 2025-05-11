---
title: PowerShell Objekt Analyse
subtitle: Einfach in 3 Schritten gezeigt
category: PowerShell
subcategory: Basics
---

# PowerShell Objekt Analyse - Einfach in 3 Schritten gezeigt

<!-- vscode-markdown-toc -->
* 1. [Überblick](#berblick)
* 2. [Get-Member Hintergrundwissen](#Get-MemberHintergrundwissen)
* 3. [Typen und deren statischen Member](#TypenundderenstatischenMember)
* 4. [PowerShell Objekt Analyse für Fortgeschrittene](#PowerShellObjektAnalysefrFortgeschrittene)
  * 4.1. [Der `[Enum]`\-Typ](#DerEnum-Typ)
  * 4.2. [Der `[Class]`\-Typ](#DerClass-Typ)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

##  1. <a name='berblick'></a>Überblick

In der PowerShell-Arbeit dreht sich alles um Cmdlets, Pipelining und Objekte. Bei der [Menge an Cmdlets](https://attilakrick.com/powershell/cmdlet-finden/) entstehen unendlich viel Pipeline-Kombinationen. Welches Cmdlet kann mit welchem Cmdlet kombiniert werden? Kurz gesagt, **jedes Cmdlet arbeitet mit jedem zusammen, wenn Sie wissen wie**! Um das heraus zu finden führen Sie eine **PowerShell Objekt Analyse** durch!

Ein Cmdlet hat eine Erwartungshaltung an das Objekt in der Pipeline oder an das übergebene Objekt-Argument. Die Cmdlet-Hilfe hält dafür Schlüsselwörter wie `ByValue`, `ByPropertyName` und Typenangaben der Parameter bereit. **Eine Interaktion findet statt**, wenn diese Erwartungshaltung erfüllt wird.

Daher findet im Vorfeld eine einfache **3 Schritte PowerShell Objekt Analyse** statt, um die Object-Rückgabe z.B. für das nächste Cmdlet aufzubereiten.

> TIPP - Zwei weitere spannende Artikel die gut zu diesem pasen sind: "[PowerShell Einstieg für Anfänger und Profis](https://attilakrick.com/powershell/powershell-tutorial/)" und "[PowerShell Pipeline Sinn & Nutzen erklärt](https://attilakrick.com/powershell/funktionsweise-powershell-pipeline/)".

Die PowerShell arbeite objektorientiert. Das heißt der Cmdlet-Output ist nicht textbasiert, sondern wir erhalten Objekte. Jedes dieser Objekte dient einem besonderen Zweck und grenzt sich von anderen ab. Eines der PowerShell Objekt Analyse-Ziele ist es, herauszufinden **von welchem Typ ein Objekt ist** (z.B. Process- vs. Service-Objekt).

Über den Objekt-Typ bekommen wir Aufschluss darüber, welche Informationen (Property) das Objekt besitzt. Oder welche Aktionen (Method) mit dem Objekt möglich sind und welche Ereignisse (Event) das Objekt auslöst könnte.

Beim Sammeln und Auswerten von Daten über die PowerShell müssen wir die **Objekt-Eigenschaften korrekt interpretieren**. Diese wiederum stellen Informationen wie Zahlen-, Datums-, Boolesche-Werte oder selbst Objekte dar. Diese Eigenschafts-Werte müssen für Ihr Zielvorhaben aufbereitet werden. Zu diesem Zweck müssen wir den aktuellen Wert kennen.

> TIPP - Sollte ein Objekt nicht die Daten oder Methoden enthalten die benötigt werden, können Sie [PowerShell Objekte erweitern](https://attilakrick.com/powershell/powershell-objekt-erweiterung/).

**Zusammenfassend** führen wir eine PowerShell Objekt Analyse durch, um folgende Punkte zu ermitteln:

* A) Von welchem Typ ist ein Objekt (Typename)?
* B) Welche Member besitzt ein Objekt (Properties, Methods & Events)?
* C) Welche Werte enthalten die Objekt-Eigenschaften (Properties Value(s))?

> Meinen Teilnehmern predige ich, lieber ein paar Minuten in die PowerShell Objekt Analyse zu investieren als Stunden in Raten, Probieren und Googlen.

Welche Werkzeuge zur PowerShell Objekt Analyse stehen zur Verfügung?

| Tool | Beschreibung |
| --- | --- |
| `Get-Member` | ermittelt den `TypeName` und listet die `Member` auf. (s. [Get-Help 'Get-Member' -ShowWindow](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-member?view=powershell-7)) |
| `Select-Object` | Multifunktions-Cmdlet für Objekte-/Property-Mengen-Einschränkungen zur besseren Übersicht.(s. [Get-Help 'Select-Object' -ShowWindow](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7)) |
| `.PSTypeNames` | Ermitteln der Vererbungs-Hierarchie. |

![](images/PowerShell-Objekt-Analyse-Get-Member.png)

> TIPP - Da `Get-Member` und `Select-Object` temporär oft benutzt wird, steigern Sie Ihre Effizienz, wenn Sie deren Aliase `gm` und `select` verwenden.

Wie Sie die PowerShell Objekt Analyse-Werkzeuge einsetzen, die Ergebnisse anzeigen und interpretieren sollen die folgenden Beispiele demonstrieren.

 ![](images/PowerShell-Objekt-Analyse-Select-Object.png)

**Beispiel 1:** Ist der Remote-Server Xyz erreichbar?

```powershell
# PowerShell Objekt Analyse

# zu A) siehe TypeName => TestNetConnectionResult
Test-NetConnection -ComputerName 127.0.0.1 | Get-Member

# zu B) siehe Spalten Name, MemberType und Definition
Test-NetConnection -ComputerName 127.0.0.1 | Get-Member

# zu C) siehe Werte aller Properties => PingSucceeded
Test-NetConnection -ComputerName 127.0.0.1 | Select-Object -Property *

# LÖSUNG

# Wenn die Property 'PingSucceeded' den Wert 'true' enthält ist der Zielhost erreichbar:
$result = Test-NetConnection -ComputerName 127.0.0.1
if($result.PingSucceeded -eq $true) { "Zielhost ist erreichbar!" }
```

**Beispiel 2:** Welche Prozesse sind von der Firma Microsoft entwickelt wurden?

```powershell
# PowerShell Objekt Analyse

# zu A + B) Welche Objects liefert 'Get-Process' zurück?
            und welche Properties brauchbare Werte enthalten könnte:
Get-Process | Get-Member
# Denkbar währen folgende Properties: ProcessName, Company,
#                                     Description, Product

# zu C) Welche tatsächlichen Werte sind für die Lösung brauchbar sind:
Get-Process | Select-Object -Property ProcessName, Company, Description, Product

# LÖSUNG:

# Betroffene Property 'Company' mit dem Filterwert 'Microsoft Corporation' anwenden:
Get-Process | Where-Object -Property Company -IEQ -Value 'Microsoft Corporation'
```

**Beispiel 3:** Alle .LOG-Dateien in dem Verzeichnis C:\\Windows auflisten?

```powershell
# PowerShell Object Analyse
# zu A) und B)
Get-ChildItem -Path C:\Windows -File | Get-Member
# zu C)
Get-ChildItem -Path C:\Windows -File | Select-Object -Property Name, Extension, FullName

# LÖSUNG
Get-ChildItem -Path C:\Windows -File | Where-Object -Property Extension -IEQ -Value ".LOG"
```

**Beispiel 4:** Eine Übersicht aller Dateien die älter sind als 1 Jahr?

```powershell
# PowerShell Object Analyse
# zu A) und B)
Get-ChildItem -Path c:\ -Recurse -File -Force -ErrorAction Ignore | Select-Object -First 1 | Get-Member # ! Analyse
# zu C)
Get-ChildItem -Path c:\ -Recurse -File -Force -ErrorAction Ignore | Select-Object -First 1 -Property Name, CreationTime, LastWriteTime, LastAccessTime

# zu A) und B)
Get-Date | Get-Member
# zu C)
(Get-Date).AddYears(-1)

# LÖSUNG
Get-ChildItem -Path c:\ -Recurse -File -Force -ErrorAction Ignore | Where-Object -Property LastWriteTime -LE -Value (Get-Date).AddYears(-1)
```

##  2. <a name='Get-MemberHintergrundwissen'></a>Get-Member Hintergrundwissen

`Get-Member` stellt ein wesentliches Werzeug in der PowerShell Analyse dar. Daher lohnt es sich dieses Cmdlet etwas genau anzuschauen.

`Get-Member` **analysiert alle Objekte in der Pipeline** und generiert zum Schluss ein gruppiertes Ergebnis. Wenn Sie mit `Get-ChildItem` die Festplatte rekursiv durchsuchen, erhalten Sie erst nach ein paar Minuten zwei Ergebnisse. Eines für `[System.Io.FileInfo]` und das zweite für `[System.Io.DirectoryInfo]`. Bei vielen identischen Objekten in der Pipeline analysieren Sie besser Stichproben. Begrenzen Sie die Menge z.B. per `… | Select-Object -First 20`.

```powershell
Get-ChildItem -Path c:\ -Recurse -Force -ErrorAction Ignore | Select-Object -First 20 | Get-Member
```

**TypeName:** Das `Get-Member`\-Ergebnis informiert im Kopfbereich in der Zeile TypeName über den vollqualifizierten Typennamen (FQTN). Dieser FQTN besteht Namespace1.Namespace2.NamespaceN.TypeName. Zum Beispiel `[System.Io.FileInfo]` setzt sich zusammen aus dem Namespace System, Namespace Io und dem TypeName FileInfo. Suchen Sie nach diesem FQTN im Internet und folgen dem ersten Treffer zur Microsoft Online-Dokumentation.

**Member:** Das Schlüsselwort Member ist ein Überbegriff für die verschiedenen Objekt-Interaktions-Schnittstellen wie Properties, Methods, Events. `Get-Member` informiert auch über die Members des Objects. Die folgende List zeigt eine Übersicht der Member und relevante Schlüsselwörter:

| Member-Art | Beschreibung |
| --- | --- |
| `AliasProperty` | Alias für eine andere Property |
| `NoteProperty` | Eine nachträglich per PowerShell hinzugefügte Eigenschaft |
| `Property` | Original Eigenschaft |
| `PropertySet` | Eine nachträglich per PowerShell hinzugefügte Gruppe von Eigenschaften |
| `ScriptProperty` | Eine nachträglich per PowerShell hinzugefügte berechnende Eigenschaft |
| `get` | Read Property |
| `set` | Write Property |
| `get` & `set` | Read/Write Property |
| `Event` | Original Ereignis |
| `Method` | Original Methode |
| `void` | Methode ohne Rückgabe, sonst Type des Rückgabe-Objects |
| z.B. bool WaitForExit(int milliseconds) | Methode; Int-Übergabe-Objekt; Bool-RückgabeObjects |

`Get-Member` unterscheidet zwischen der Analyse von Pipeline-Objekten und NICHT-Pipeline-Objekten.

```powershell
# ! Analysiert die Objects in der Pipeline
1..99 | Get-Member # => System.Int32

# vs.

# ! Analysiert DAS Object (1..99)
Get-Member -InputObject (1..99) # => System.Array
```

##  3. <a name='TypenundderenstatischenMember'></a>Typen und deren statischen Member

**Klassen definiert Baupläne nach denen Objekte gebaut werden.** Wir können O. von einer Klasse erzeugen. Diese O. stellen mit ihren Eigenschafts-Werten und individuellen Methoden Unikate dar und grenzen sich so von einem anderen Objekt vom gleichen Typ ab.

Methoden und Eigenschaften, die nicht im Zusammenhang mit dem Objekt-Unikat stehen und objekt-übergreifend gleiche und wiederkehrende Routinen besitzen werden in die Klasse statisch implementiert. Diese **statischen Member** werden über den Klassennamen per `::` aufgerufen.

```powershell
# Welche statische Member besitzt der Process-Typ ?
Get-Process | Get-Member -Static
# Beispiel-Aufruf:
[System.Diagnostics.Process]::Start('notepad')

# Welche statische Member besitzt der DateTime-Typ ?
Get-Date | Get-Member -Static
# Beispiel-Aufruf:
[datetime]::Today
```

##  4. <a name='PowerShellObjektAnalysefrFortgeschrittene'></a>PowerShell Objekt Analyse für Fortgeschrittene

###  4.1. <a name='DerEnum-Typ'></a>Der `[Enum]`\-Typ

**[PowerShell 7](https://attilakrick.com/powershell/neuerungen-powershell-7/)** - Es gibt eine Autovervollständigung (`CTRL + SPACE`) für das Zuweisen von Aufzählungs-Werten (Enum) zu Variablen:

```powershell
$ErrorActionPreference = 'Stop'
# ?                      ^ An dieser Stelle in der Console CTRL+SPACE drücken.
```

Enumerationen `[Enum]` bilden eine Untermenge von Typen. Enums bilden eine Gruppe (Enum-Typennamen) von vordefinierte, Int32-Werte, die über Schlüsselwörter angesprochen werden (z.B. `[Color]::Red`).

Enums können als Cmdlet-Parameter-Typ angegeben werden. Ob ein Parameter diese Enumeration akzeptiert, ist auf den ersten Blick nicht ersichtlich da die Hilfe nur den Typennamen anzeigt. Ein `[ServiceController]`\-Objekt besitzt die Property `StartType` die von der Enumeration `[System.ServiceProcess.ServiceStartMode]` ist. Das Zuweisen von Enum-Werten ist analog zu statischen Membern `::`.

Handelt es sich bei einem Type X um eine Enumeration?

```powershell
$ErrorActionPreference | Get-Member
[System.Management.Automation.ActionPreference].IsEnum
[System.Management.Automation.ActionPreference].GetEnumNames()
# ! Wenn die Antwort JA lautet erfolgte eine Zuweisung wie folgt:
$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop
```

```powershell
Get-Service | Get-Member -Name StartType
[System.ServiceProcess.ServiceStartMode].IsEnum
[System.ServiceProcess.ServiceStartMode].GetEnumNames()
# ! Wenn die Antwort JA lautet erfolgte ein Vergleich wie folgt:
```

**Beispiel 5:** - Alle Dienste anzeigen deren Starttyp auf Manuell steht

```powershell
# Analyse
Get-Service | Get-Member
Get-Service | Select-Object -Property 'Name', 'StartType'

# ! Anwenden:

# Problematisch da eine automatische Konvertierung nach ServiceStartMode statt findet...:
Get-Service | Where-Object -Property 'StartType' -IEQ -Value 'Manual'
# TIPP - ... besser so:
Get-Service | Where-Object -Property 'StartType' -EQ -Value ([System.ServiceProcess.ServiceStartMode]::Manual)
```

Welche Enumerationen gibt es und wie kann ich diese finden?

```powershell
# Hilfreiches Cmdlet für die PowerShell Objekt Analyse
function Get-Enum {
    param (
        [string]$Value, 
        [String]$Name, 
        [switch]$All
    )
    
    $defaultManifestModules = 'CommonLanguageRuntimeLibrary',
                              'Microsoft.CSharp.dll',
                              'Microsoft.Management.Infrastructure.dll',
                              'Microsoft.PowerShell.Commands.Management.dll',
                              'Microsoft.PowerShell.commands.Utility.dll',
                              'System.dll',
                              'System.Configuration.dll',
                              'System.Configuration.Install.dll',
                              'System.Core.dll',
                              'System.Data.dll',
                              'System.DirectoryServices.dll',
                              'System.Management.Automation.dll',
                              'System.Management.dll',
                              'System.ServiceProcess.dll',
                              'System.Transactions.dll',
                              'System.Xml.dll'

    [System.AppDomain]::CurrentDomain.GetAssemblies() | 
        Where-Object -FilterScript { $All -or ($defaultManifestModules -contains $_.ManifestModule) } | 
        ForEach-Object -Process { 
            try { 
                $_.GetExportedTypes() 
            } catch { 
                'Keine ExportedTypes vorhanden' | Write-Verbose 
            } 
        } | Where-Object -FilterScript { $_.IsEnum -and $_.Name -imatch $Name } | 
                ForEach-Object -Process {
                    return [PSCustomObject]@{
                        Name   = $_.FullName
                        Source = $_.Module.ScopeName
                        Values = [System.Enum]::GetNames($_)
                    }
                } | Where-Object -Property Values -imatch -Value $Value
 }

Get-Enum -Value 'SilentlyContinue'
Get-Enum -Name 'ServiceStartMode'
Get-Enum -All | Measure-Object
```

###  4.2. <a name='DerClass-Typ'></a>Der `[Class]`\-Typ

**Vererbung (Inherit):** Klassen können eine andere Klasse beerben und so dessen Funktion zu eigen machen.

1.  Eine Klasse kann von EINER anderen Basisklasse ABGELEITET sein und ERBT so dessen Member/Funktionen.
2.  Jede Klasse ist früher oder später von der Klasse 'Object' (alias PSObject) abgeleitet worden.
3.  Eine abgeleitete Klasse A ist daher mit der Basisklasse B kompatibel, daher kann auch ein Objekt von Typ A an einen Parameter vom Typ B übergeben werden.

```powershell
# ? Welche Typ A von welchem Typ B abgeleitet wurde erfahren Sie so:
"Köln!".PSTypeNames
(Get-Service)[0].PSTypeNames
(Get-Process)[0].PSTypeNames
(Get-Process).PSTypeNames
```

**Statische Member (Static):** Objekte werden von einer bestimmten Klasse instansziert und so materialisiert. Erst dann können wir mit diesen Objekten in der PowerShell hantieren. Es gibt jedoch statische Member die direkt an der Klasse aufrufen werden können ohne, dass ich zuerst eine OBjekt erzeugen muss.

```powershell
# ? Welche statische Member besitzt eine Klasse:
Get-Process | Get-Member -Static
[System.Diagnostics.Process]::Start('notepad')

Get-Date | Get-Member -Static
[datetime]::Today
```

**Überladung (Overload):** Eine Methode kann mehrfacht überladen sein. Unter dem gleichen Methoden-Namen wird unterschiedliches Methoden-Verhalten implementiert. Wichtig ist jedoch das die Parameter-Signatur eindeutig ist.

```powershell
# ? Überladungs-Definitionen einer Methode anzeigen
$Text = "PowerShell"
$Text | Get-Member -Name LastIndexOf
$Text.LastIndexOf.OverloadDefinitions
```

Der folgende Code erweitert in der aktuellen Session den Basistyp `[Object]` um eine weitere Methode `.ShowObject()`. Diese Methode steht anschließend an allen Obj zur Verfügung. Wenn Sie `.ShowObject()` ausführen erhalten Sie sämtliche Eigenschafts-Werte eines Objektes in einem Windows-Fenster.

```powershell
# Hilfreiche Erweiterung für die PowerShell Objekt Analyse
$code = {
    Add-Type -AssemblyName "System.Windows.Forms"

    $propertyGrid                            = New-Object -TypeName "System.Windows.Forms.PropertyGrid"
    $propertyGrid.Dock                       = [System.Windows.Forms.DockStyle]::Fill
    $propertyGrid.PropertySort               = [System.Windows.Forms.PropertySort]::Alphabetical
    $propertyGrid.CanShowVisualStyleGlyphs   = $true
    $propertyGrid.CommandsVisibleIfAvailable = $true
    $propertyGrid.HelpVisible                = $true
    $propertyGrid.ToolbarVisible             = $true
    $propertyGrid.SelectedObject             = $this

    $window         = New-Object -TypeName "System.Windows.Forms.Form"
    $window.Text    = $this.ToString()
    $window.Size    = New-Object -TypeName "System.Drawing.Size" -ArgumentList @(600, 800)
    $window.TopMost = $true
    $window.Controls.Add($propertyGrid)
    $window.ShowDialog() | Out-Null
}
Update-TypeData -MemberType "ScriptMethod" -MemberName "ShowObject" -Value $code -TypeName "System.Object" -Force
```

Die neue Methode `.ShowObject()` benutzen:

```powershell
$p1 = Get-Process | Select-Object -First 1
$p1.ShowObject()
```
