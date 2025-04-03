Überblick
---------

Die PowerShell-Pipeline ist ein zentrales Element der PowerShell. Das Quell-Cmdlet erzeugt Objekte, die über die Pipe an das nächste Cmdlet über zwei unterschiedlichen Verfahren weitegegeben (Binding) wird. Wenn die Objekte in der Pipeline entsprechend aufgearbeitet werden, **kann jedes Cmdlet an jedes beliebige Cmdlet über die Pipe `|` gebunden** werden.

Die Objekte von `Get-Process` können offensichtlich über die Pipe `|` an das Cmdlet `Stop-Process` gebunden werden. Es findet aber im Vorfeld keine Definition zwischen diesen Cmdlets statt. Einzig allein greifen immer diese zwei unterschiedlichen Bindungs-Verfahren.

Wenn Sie wissen wie die Verfahren `ByValue` und `ByPropertyName` arbeiten, können Sie dieses Wissen zu eigen machen. Mittels dieser Verfahren können **sämtliche Cmdlets über die Pipe `|` verbunden** werden.

Dieses Tutorial erklärt mit 3 einfachen Tricks an praktischen Beispielen die PowerShell-Pipeline so, dass Sie dieses Werkzeug effizient für sich arbeiten lassen können.

> LINK-TIPP - Zu diesem Tutorial gibt es ein YouTube-Video: [Wie funktioniert die Pipeline der PowerShell](https://www.youtube.com/watch?v=UQH1wMztOeo&feature=youtu.be).  
> Zu diesem Tutorial passen auch die folgenden Artikel: [PowerShell Einstieg für Anfänger und Profis](https://attilakrick.com/powershell/powershell-tutorial/), [PowerShell-Objekte in 3 Schritten erfolgreich analysieren](https://attilakrick.com/powershell/powershell-objekt-analyse/) und [PowerShell-Objekte für den eigenen Zweck erweitern und einspannen](https://attilakrick.com/powershell/powershell-objekt-erweiterung/).

Regeln der Pipeline-Verarbeitung
--------------------------------

*   **Zeilenumbrüche in der Pipeline-Verarbeitung** - nach einer Pipe `|` können Zeilenumbrüche (CRLF) eingefügt werden, um die Lesbarkeit zu erhöhen:

```
Get-Process |
    Where-Object -Property 'Company' -Like -Value 'Microsoft*' |
    Sort-Object -Property 'Name' |
    Select-Object -Property 'Name', 'Company' |
    Out-File -FilePath 'C:\Temp\Process.txt' -Force
```

Dies gilt auch für PowerShell Konsole und sämtliche Script-Dateien wie .PS1 oder PSM1.

> TIPP / ACHTUNG - Ab jetzt muss der auszuführende Block selektiert und erst dann mit `F8` zur Ausführung gebracht werden. **Ständige markieren ist auf Dauer ein Handling-Nachteil**. Dieser Nachteil kann über `ALT`+`Z` in Visual Studio Code relativiert werden. Sie können so steuern ob der Code mit visuellen Umbrüchen anzeigen werden soll oder nicht. Da nicht nach rechts gescrollt werdem muss, bleibt eine lange Befehls-Zeile lesbar und es muss. Da es technisch immer noch eine Zeile ist, kann diese, ohne vorher selektiert werden zu müssen mit `F8` ausgeführt werden.

```
Get-Process | Where-Object -Property 'Company' -CEQ -Value 'Microsoft Corporation' | Sort-Object -Property 'Name' | Select-Object -Property 'Name', 'Company' | Out-File -FilePath 'C:\Temp\Process.txt' -Force
```

> TIPP - Dieser visuellen Umbruch kann in den Visual Studio Code-Einstellungen (`settings.json`) an die eigenen Bedürfnisse angepasst werden.

```
{
    "editor.rulers": [
        { "column" :  80 , "color" : "#2c2c2c" },
        { "column" : 160 , "color" : "#ff0000" },
    ],
    "editor.wordWrap"       : "wordWrapColumn",
    "editor.wordWrapColumn" : 80,
    "editor.wrappingIndent" : "indent",
}
```

*   **Objekte in der Pipeline** - über die Pipe `|` überträgt PowerShell von Quell-Cmdlet zu Ziel-Cmdlet **KEINE TEXTE**. Es werden immer **OBJEKT** übertragen.

```
# Der ForEach-Object-Output demonstriert das es sich beim dem Pipeline-Objekt ($_) um Prozess-OBJEKTE handelt.
Get-Process | Where-Object -Property 'Company' -IEQ -Value 'Microsoft Corporation' | ForEach-Object -Process { "Ist der Prozess '$($_.Name)' ein Objekt? $($_ -is [System.Object])" }
```

*   **Just-in-time Objekt-Weitergaben** - das Quell-Cmdlet übergibt jedes ermittelte die Objekte just-in-time an die PowerShell-Pipeline. Die Pipe `|` bindet wiederum just-in-time an das nächste Cmdlet.

```
# Just-in-time, d.h. währen Get-ChildItem sämtliche Dateien lokalisiert erhalten wir Warnmeldungen und das Out-GridView-Fenster füllt sich ständig weiter auf.
Get-ChildItem -Path 'C:\' -File -Recurse -PipelineVariable 'Datei' -ErrorAction 'SilentlyContinue' | ForEach-Object -Process { "Empfange Datei-Objekt $($Datei.Name) und gebe dessen .Name-Eigenschafts-Wert als [string] in der Pipeline weiter." | Write-Warning; $Datei.Name } | Out-GridView
```

Pipeline-Objekte an Ziel-Cmdlet binden
--------------------------------------

**Ein einprägsames Beispiel!**  
Schauen wir uns zum Beispiel einmal folgende zwei Pipeline-Vorgänger in PowerShell an:

```
# ! Für diese Beispiel benötigen mir ein notepad-Prozess:
Start-Process -FilePath 'notepad.exe'

# ? Würde dieser Befehl die notepad-Prozesse beenden, was denken Sie? (JA | NEIN):
Get-Process -Name 'notepad' | Stop-Process

# ? Würde dieser Befehl die notepad-Prozesse beenden, was denken Sie? (JA | NEIN | ERROR)
Get-ChildItem -Path 'C:\Temp\DL' | Stop-Process
```

**Was denken Sie?**  
Würden diese beiden Code-Beispiel-Zeilen vorhandene `notepad`\-Prozesse beenden? Vermutlich stimmen Sie der ersten Zeile (`Get-Process`) zu aber jedoch nicht der zweiten Zeile (`Get-ChildItem`)? Tatsächlich beendet die zweite Zeile auch sämtliche `notepad`\-Prozesse. Aber nur solange sich in dem Ordner `C:\Temp\DL` eine Datei namens `notepad` ohne Dateierweiterung befindet.

Wenn man die dahinterliegende Mechanik der Tutorial-Beispiele verstanden hat, können Sie dieses Wissen für Ihre eigene Zwecke benutzen. Sie müssen nur in der Mitte die Pipeline-Objekte für das nächste Cmdlet aufbereiten.

Die Aufkläre dieses Beispiel kommt etwas später im Tutorial.

Die Objekte, die über die Pipe weitergegeben werden, werden über zwei Bindungsverfahren `ByValue` und `ByPropertyName` and das nächste Cmdlet gebunden. Parallel zur folgenden Beschreibung schauen Sie sich auch diese FlipChart:

 ![[images/PowerShell-Pipelining-FlipChart.png]]

> HINWEIS - Live Demonstration gefällig? Dan schauen Sie sich das YouTube-Video [Wie funktioniert die Pipeline der PowerShell](https://www.youtube.com/watch?v=UQH1wMztOeo&feature=youtu.be) an.

**Cmdlets können nur über deren Parameter angesprochen** und gesteuert werden. Diese Regel gilt auch für das Pipeline-Objekte und dessen Bindung an das nächste Cmdlet.

Für diese Bindung zwischen Pipeline-Objekt und den Parametern des Ziel-Cmdlets stehen **zwei Verfahren** zur Verfügung:

1.  Beim **Verfahren `ByValue`** findet eine Bindung des **ganzen Pipeline-Objekts** statt. Aber nur, wenn ...
    *   ... der Pipeline-Objekt-TYP **kompatibel** mit dem Parameter-TYP ist.
2.  Beim **Verfahren `ByPropertyName`** findet eine Bindung **einer Eigenschaft** des Pipeline-Objektes an den Ziel-Cmdlet-Parameter statt.  
    Aber nur, wenn
    *   der Eigenschafts-Name des Pipeline-Objektes **identisch** ist mit dem Parameter-Name (oder dessen Alias-Name) des Ziel-Cmdlets.
    *   der Pipeline-Objekt-Eigenschafts-TYP kompatibel mit Ziel-Cmdlet-Parameter-TYP ist.

> HINWEIS - Was "Kompatibilität" bedeutet wird weiter unten im Tutorial erklärt.

Ein Mehrfach-Binden bzw. Mehrfach-Verfahren an das Ziel-Cmdlet sind möglich.

> HINWEIS - Woran können Sie erkennen ob `ByValue` oder `ByPropertyName` oder beide Verfahren oder kein Verfahren angewendet wird? Diese Informationen finden Sie in der Parameter-Beschreibung der Ziel-Cmdlet-Hilfe-Seite z.B. `Get-Help -Name 'Stop-Process' -Online`.

Mit diesem Hintergrundwissen beleuchten wir jetzt das o.a. Tutorial-Beispiel. Zuerst **klären** wir welche Parameter (Name, Type) des Ziel-Cmdlets `Stop-Process` die Pipeline-Eingabe akzeptieren. Also welche Parameter dasVerfahren `ByValue` oder/und `ByPropertyName` unterstützen.

```
Get-Help -Name 'Stop-Process' -ShowWindow
```

Folgende relevante Information enthält die Cmdlet-Hilfe.

| Parameter Name | Parameter Typ | Zugelassenes Verfahren |
| --- | --- | --- |
| \-InputObject | <Process\[\]> | ByValue |
| \-Name | <string\[\]> | ByPropertyName |
| \-Id | <int32\[\]> | ByPropertyName |

Jetzt **analysieren** wir mit `Get-Member` die Pipeline-Objektes vom Quell-Cmdlet `Get-Process` bzgl. Object-Type und Object-Properties:

```
Get-Process -Name 'notepad' | Get-Member
```

Folgende relevante Information besitzt das Objekt.

| Relevanz | Name | Typ | Binden möglich? Warum? |
| --- | --- | --- | --- |
| Object-Type | System.Diagnostics.Process |  | Ja, wegen `ByValue` |
| Object-Property | Name | String | Ja, wegen `ByPropertyName` |
| Object-Property | Id | Int32 | Ja, wegen `ByPropertyName` |

Für das erste Beispiel können wir folgende Rückschlüsse ziehen:

*   Das ganze Pipeline-Objekt kann an den Parameter `-InputObject` gebunden werden. Der Parameter unterstützt das Verfahren `ByValue` und ist vom Typ `<Process[]>`. Das wiederum ist kompatibel mit dem Pipeline-Objekt das vom Typ `System.Diagnostics.Process` ist.
*   Die Pipeline-Objekt Eigenschaft `Name` kann an den Cmdlet-Parameter `-Name` gebunden werden. Dieser Cmdlet-Parameter unterstützt das Verfahren `ByPropertyName`, ist vom Typ `<string[]>` und heißt `Name`. Das wiederum ist kompatibel mit der Pipeline-Objekt-Eigenschaft `Name` vom Typ `String`.
*   Die Pipeline-Objekt-Eigenschaft `Id` kann an den Parameter `-Id` gebunden werden. Dieser Parameter unterstützt das Verfahren `ByPropertyName`, ist vom Typ `<int32[]>` und heißt `Id`. Das wiederum ist kompatibel mit der Pipeline-Objekt-Eigenschaft `Id` vom Typ `Int32`.
*   Ein Mehrfach-Binden per `ByValue` und `ByPropertyName` findet statt.

Identisch verfahren wir bei der **Analyse** des zweiten Tutorial-Beispiels.  
Was liefert `Get-ChildItem` zurück (Object-Type & -Propertie)?

```
Get-ChildItem -Path 'C:\Temp\DL' | Get-Member
```

| Relevanz | Name | Typ | Binden möglich, warum? |
| --- | --- | --- | --- |
| Object-Type | System.IO.FileInfo |  | Nein, falscher Typ für `ByValue` |
| Object-Property | Name | String | Ja, wegen `ByPropertyName` |
| Object-Property | Id | Int32 | Nein, da Property nicht vorhanden |

Für das zweite Beispiel können wir folgende Rückschlüsse ziehen:

*   Die `Name`\-Pipeline-Objekt-Eigenschaft kann an den Parameter `-Name` gebunden werden. Dieser Parameter unterstützt das Verfahren `ByPropertyName`, ist vom Typ `<string[]>` und heißt `Name`. Das wiederum ist kompatibel mit der Pipeline-Objekt-Eigenschaft `Name` vom Typ `String`.
*   Das ganze Pipeline-Objekt kann NICHT an den Parameter `-InputObject` gebunden werden. Der Parameter unterstützt das Verfahren `ByValue` und ist vom Typ `<Process[]>`. Das wiederum ist NICHT kompatibel mit dem Pipeline-Objekt das vom Typ `System.IO.FileInfo` ist.
*   Die Pipeline-Objekt-Eigenschaft `Id` kann an den Parameter `-Id` NICHT gebunden werden. Dieser Parameter unterstützt das Verfahren `ByPropertyName`, ist vom Typ `<int32[]>` und heißt `Id`. Das wiederum ist NICHT kompatibel mit dem Pipeline-Objekt, da es die Eigenschaft `Id` nicht gibt.
*   Ein Binden findet nur per `ByPropertyName` statt.

Wann sind Objekt-Typen kompatibel
---------------------------------

Objekte sind kompatibel, wenn deren Typen-Namen zu 100%, inklusive Namespace identisch sind:

```
# * kompatibel:
[System.String]       -ceq [System.String]

# ! NICHT kompatibel:
[System.Timers.Timer] -ceq [System.Windows.Forms.Timer]
```

Jedes Objekt ist kompatibel mit `[System.Object]`:

```
 # * kompatibel:
'Hallo Köln!'    -is [System.Object]
(Get-Process)[0] -is [System.Object]
12               -is [System.Object]
```

Jedes komplexe Objekt ist kompatibel mit `[PSCustomObject]` (früher `PSObject`):

```
# * kompatibel:
(Get-Process)[0]   -is [PSCustomObject]
(Get-Service)[0]   -is [PSCustomObject]
(Get-ChildItem)[0] -is [PSCustomObject]

# ! NICHT kompatibel, da es sich um einen primitiven Typen handelt:
12 -is [PSCustomObject]
```

Jedes Objekt ist kompatibel mit Typen die in der **Vererbungshierarchie** vorkommen:

```
# * kompatibel:
(Get-Process)[0] -is [System.Diagnostics.Process]
(Get-Process)[0] -is [System.ComponentModel.Component]
(Get-Process)[0] -is [System.MarshalByRefObject]
(Get-Process)[0] -is [System.Object]
```

1.  Eine Klasse kann nur von einer anderen Basisklasse abgeleitet sein und erbt so dessen Funktionsumfang (Member).
2.  Jede Klasse ist früher oder später von der Klasse `Object` abgeleitet.
3.  Wenn Klasse A von Klasse B abgeleitet wurde, dann sind Objekte vom Typ A mit der Basisklasse B kompatibel. Daraus ergibt sich, dass ein Objekt von Typ A an einen Parameter vom Typ B übergeben werden.

Welcher Typ A von welchem Typ B abgeleitet wurde erfahren Sie über die Objekt-Eigenschaft `PSTypeNames`, die jedes Objekt besitzt.

```
'Köln!'.PSTypeNames
# * System.String -> System.Object

(Get-Process)[0].PSTypeNames
# * System.Diagnostics.Process -> System.ComponentModel.Component -> System.MarshalByRefObject -> System.Object

(Get-Process).PSTypeNames
# * System.Object[] -> System.Array -> System.Object
```

PowerShell selbst bietet ein komplexes Analyse Cmdlet `Trace-Command`, dessen ich später ein eigenes Tutorial widmen werde. Letzt endlich können Sie die gleichen Rückschlüsse ziehen.

Zum 1. Beispiel oben im Tutorial:

```
Trace-Command -Name 'ParameterBinding' -Expression { Get-Process -Name 'notepad' | Stop-Process } -PSHost
```

Zum 2. Beispiel oben im Tutorial:

```
Trace-Command -Name 'ParameterBinding' -Expression { Get-ChildItem -Path 'C:\Temp\DL' | Stop-Process } -PSHost
```

Parameter-Binding in der Praxis
-------------------------------

Der praktische Nutzen ergibt sich z.B., wenn wir über eine CSV-Datei neue Benutzer im ActiveDirectory oder lokal anlegen wollen:

```
# Experimentierdaten in Form von .CSV erzeugen
@'
Benutzername;Passwort;Beschreibung
p.lustig;P@ssw0rd;Peter Lustig (IT)
e.gruen;Geh1imAbc;Eva Grün (HR)
'@ | Set-Content -Path 'C:\Temp\NewUsers.csv'
```

> Um `New-LocalUser` nutzen zu können, muss unter PowerShell 7 das Module `Microsoft.PowerShell.LocalAccounts` importiert werden.

```
Import-WinModule -Name 'Microsoft.PowerShell.LocalAccounts'
```

Der **erste Lösungsversuch** könnte vielleicht so oder so ähnlich ausschauen. Leider funktioniert das so noch nicht.

```
Get-ChildItem -Path 'C:\Temp\NewUsers.csv' | New-LocalUser
```

Zuerst müssen wir die Dokumentation von `New-LocalUser` auswerten. Welche Parameter (Name, Type) lassen die Pipeline-Bindung zu? Und wenn Ja, nach welchem Verfahren (`ByValue`, `ByPropertyName`)?

```
Get-Help -Name 'New-LocalUser' -ShowWindow
```

| Parameter-Name | Parameter-Type | Binding |
| --- | --- | --- |
| `-Name` | `<String>` | `ByPropertyName` |
| `-Password` | `<SecureString>` | `ByPropertyName` |
| `-Description` | `<String>` | `ByPropertyName` |

Jetzt wird die CSV-Datei so aufbereitet, dass am Ende Pipeline-Objekte raus kommen die diesen Anforderungen genügen. Im Klartext muss unser Objekt für `New-LocalUser` folgende Merkmal enthalten:

*   eine Eigenschaft `Name` vom Typ \[String\]
*   eine Eigenschaft `Password` vom Typ `[SecureString]`
*   eine Eigenschaft `Description` vom Typ `[String]`

Vom Start-Cmdlet `Get-ChildItem -Path 'C:\Temp\NewUsers.csv'` arbeiten wir uns zu dieser Ziel-Objekt-Form vor, um `New-LocalUser` gefällig zu sein. Die fertige Zeile Code könnte dann wie folgt aussehen.

```
Get-ChildItem -Path 'C:\Temp\NewUsers.csv' | Get-Content | ConvertFrom-Csv -Delimiter ';' -Header 'Name', 'Password', 'Description' | Select-Object -Skip 1 -Property 'Name', 'Description', @{Label='Password'; Expression={ $_.Password | ConvertTo-SecureString -AsPlainText -Force }} | New-LocalUser -WhatIf
```

Parameter-Bindung per Splatting
-------------------------------

Splatting ist eine Methode in PowerShell, eine Sammlung von Parameterwerten `HashTable` an ein Cmdlet als Einheit zu übergeben. Das @-Symbol teilt PowerShell mit, dass es sich bei dieser Variablen um eine Sammlung von Parameter-Werten handelt und nicht um ein Übergabeobjekt.

Cmdlet-Steuerung **ohne** Splatting:

```
Get-EventLog -LogName 'System' -Newest 5 -EntryType 'Error', 'Warning'
```

Gleiche Cmdlet-Steuerung **mit** Splatting:

```
$Argument = @{
    LogName   = 'System'
    Newest    = 5
    EntryType = 'Error', 'Warning'
}
Get-EventLog @Argument
```

Per Splatting können umfangreiche Werte übersichtlich an das Cmdlets übergeben werden und in Fallunterscheidungen unterschiedliche Werte-Objekte.

Weitere Details sind in der About-Seite `about_Splatting` zu finden.

```
Get-Help -Name 'about_Splatting' -ShowWindow
```

PowerShell Wissenstests und Übungen
-----------------------------------

Beantworten Sie die folgenden 6 zufälligen Fragen. Dieser Wissenstest über die PowerShell Pipeline-Verarbeitung ist kostenlos und kann anonym erfolgen. Die Auswertung des Wissenstests erfolgt unmittelbar am Ende.

Zu gewinnen gibt es **Stolz und Ehre**.

Viel Spaß und Erfolg!

***

1 Voten, 5 Durchschnittssterne

Erstellt von **Attila Krick**

 ![[images/PowerShell-Pipelining-FlipChart-Vorschau.png]]

PowerShell Pipeline Verarbeitung

Die Pipeline-Mechanik ist ein zentrales Element der PowerShell. Das Quell-Cmdlet erzeugt Objekte die über die Pipeline an das Ziel-Cmdlet über zwei unterschiedlichen Verfahren gebunden werden. Wenn die Objekte in der Pipeline entsprechend aufgearbeitet werden, kann jedes Cmdlet an jedes beliebige Cmdlet über die Pipeline gebunden werden.

1 / 6

Wie bzw. Warum werden die Pipeline-Objekte zwischen `Where-Object` und `Select-String` gebunden?

`Get-ChildItem -Path "$($env:WinDir)\Logs" -Recurse -File -Force -ErrorAction 'Ignore' | Where-Object -Property 'Extension' -IEQ -Value '.log' | Select-String -Pattern 'error' | Set-Content -Path 'C:\temp\master_error.log' -PassThru`

Die Eigenschaft PSPath des Pipeline-Objektes wird an den Parameter -PSPath gebunden.

Die Eigenschaft PSPath des Pipeline-Objektes wird an den Parameter -LiteralPath gebunden.

Das ganze Pipeline-Objekt wird an den Parameter -InputObject gebunden.

Die Kommando-Zeile ist fehlerhaft, daher findet keine Bindung statt.

2 / 6

1.Welche Aussagen sind korrekt?

Ein Cmdlet liefert Objekte i.d.R. just-in-time an das nächste Cmdlet.

Kommando-Zeilen mit Pipeline-Zeilenumbrüchen müssen nicht vorher markiert werden, wenn diese mit F8 ausführen werden.

Nach einer Pipeline können Zeilenumbrüche eingefügt werden, um die Lesbarkeit zu erhöhen.

Ein Cmdlet liefert i.d.R. alle Objekte auf einmal an das nächste Cmdlet.

Die PowerShell überträgt über die Pipeline von Cmdlet A zu Cmdlet B nur Objekte.

Die PowerShell überträgt über die Pipeline nur TEXTE von Cmdlet A zu Cmdlet B.

3 / 6

Was sind kompatible Objekte im Sinne der Pipeline-Verarbeitung?

Jedes Objekt ist kompatibel mit \[System.Object\].

Jedes Objekt ist kompatibel mit Typen, die in der Vererbungshierarchie vorkommen.

Jedes komplexe Objekt ist kompatibel mit \[PSCustomObject\].

Jedes komplexe Objekt ist kompatibel mit \[ObjectInfo\].

Kompatibel ist, was vorher per .CPF-Datei definiert wurde.

Wenn die Typennamen 100% identisch sind, egal ob diese Typen aus unterschiedlichen Namespaces stammen.

Wenn die Typennamen 100% identisch sind, was den Namespace miteinschließt.

4 / 6

Warum werden hier keine doppelten Objekte entfernt, bzw. was wäre die Lösung?

`1, 2, 3, 1, 2, 3, 1, 2, 3 | Get-Unique`

Get-Unique erwartet eine sortierte Liste.

Auch Zahlen sind Objekte und jedes Objekt ist eindeutig, auch wenn es identische Werte enthält.

Die \[int\]-Objekte werden einzeln in die Pipeline gegeben und per just-in-time abgearbeitet. So ist es unmögliche doppelte Werte zu erkennen.

Arrays können nicht sortiert werden.

Sort-Object muss vor Get-Unique kommen.

5 / 6

Die Sortierung bei der folgenden Zeile funktioniert nicht, warum?

`Get-ChildItem "$env:WinDir*.exe" | Select-Object -Property 'Name', 'LastWriteTime' | Sort-Object -Property 'Lenght' -Descending`

Das Cmdlet Sort-Object unterstützt kein Parameter-Bindung über die Pipeline.

Die Property Lenght steht nach Select-Object nicht mehr zur Verfügung.

Die Property Lenght ist falsch geschrieben.

Lenght darf nicht in einfache Hochkommata (') stehen.

Die Cmdlets Select-Object und Sort-Object müssen getauscht werden.

6 / 6

Die Bindung des Pipeline-Objektes an das Cmdlet `New-LocalUser` findet nach dem Verfahren ByPropertyName statt, da alle verbindlichen Voraussetzungen erfüllt werden. Welche Voraussetzungen sind das?

`Get-ChildItem -Path 'C:TempNewUsers.csv' | Get-Content | ConvertFrom-Csv -Delimiter ';' -Header 'Name', 'Password', 'Description' | Select-Object -Skip 1 -Property 'Name', 'Description', @{ Label='Password'; Expression={ $_.Password | ConvertTo-SecureString -AsPlainText -Force } } | New-LocalUser`

Der Parameter -Description ist vom Typ \[String\].

Der Parameter -Password ist vom Typ \[SecureString\].

Der Parameter -FullName ist vom Typ \[String\].

Der Parameter -Name ist vom Typ \[String\].

Der Parameter -InputObject ist vom Typ \[Object\].

Die Parameter -Name, -Description und -Password lassen die Pipeline-Eingabe nach ByValue zu.

Die Parameter -Name, -Description und -Password lassen die Pipeline-Eingabe zu nach ByPropertyName.

Ihr detailliertes Ergebnis senden wir Ihnen gerne per Email zu.

Deine Punktzahl ist

Die durchschnittliche Punktezahl ist 67%

Bitte hinterlassen Sie eine Bewertung.

***

**Weitere PowerShell Wissenstests** finden Sie auch am Ende anderer Beiträge oder in der [PowerShell Wissenstests Übersicht](https://attilakrick.com/powershell/powershell-wissenstest/).

Oder versuchen Sie sich der folgenden Aufgabe:

```
# 1. Erstellen Sie folgende Dateien:
New-Item -Path 'C:\Temp' -Name 'Kunde A.txt' -ItemType 'File'
New-Item -Path 'C:\Temp' -Name 'Kunde B.txt' -ItemType 'File'
New-Item -Path 'C:\Temp' -Name 'Kunde C.txt' -ItemType 'File'
New-Item -Path 'C:\Temp' -Name 'Kunde X.txt' -ItemType 'File'

# 2. Erstellen Sie folgende .CSV-Datei:
"Dateiname;LöschennKunde A.txt;NeinnKunde B.txt;Ja`nKunde C.txt;Nein" | Set-Content -Path 'C:\Temp\Files.csv'

# 3. Passen Sie den folgenden ???-Teil so an, das nur die Dateien gelöscht werden deren Property Löschen ein Ja enthält.
#    D.h. aktuell nur die Datei 'Kunde B.txt' darf aus dem Temp-Ordner entfernt werden.
Get-ChildItem -Path 'C:\Temp\Files.csv' | ??? | Remove-Item

# TIPPS :: Get-Content ; ConvertFrom-Csv ; Where-Object ; Select-Object
```

Bitte bewerten Sie diesen Artikel
---------------------------------

\[site\_reviews\_form category="121" assign\_to="150" id="kc8vgfcj" hide="title,content,name,email,terms"\]

***