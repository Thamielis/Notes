# PowerShell Objekt erweitern - 2 einfache Möglichkeiten

<!-- vscode-markdown-toc -->
* 1. [Überblick](#berblick)
* 2. [Objekt Member analysieren](#ObjektMemberanalysieren)
* 3. [Vier Möglichkeiten eigene Objekte zu erschaffen](#VierMglichkeiteneigeneObjektezuerschaffen)
	* 3.1. [PSCustomObject per HashTable erzeugen](#PSCustomObjectperHashTableerzeugen)
	* 3.2. [PSCustomObject per Add-Member erzeugen](#PSCustomObjectperAdd-Membererzeugen)
	* 3.3. [Eigene Typen-Definition per PowerShell](#EigeneTypen-DefinitionperPowerShell)
	* 3.4. [Eigene Typen-Definition per C#](#EigeneTypen-DefinitionperC)
* 4. [Epilog](#Epilog)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

##  1. <a name='berblick'></a>Überblick

Die [objektorientierte Programmierung](https://de.wikipedia.org/wiki/Objektorientierte_Programmierung) (OOP) ist ein, nicht wegzudenkender Bestandteil der PowerShell. Wenn wir mit Objekten in der Shell arbeiten, nutzen wir deren Eigenschaften und Methoden, um Werte auszulesen oder Aktionen auszulösen. Dieser Informations- und Actionsumfang (Member => Eigenschaften, Methoden und Ereignisse) ist auf den jeweiligen Objekt-Typ beschränkt.

Diese Objekt-Erweiterung ist immer dann sinnvoll, **wenn wir zusätzliche Daten über die Pipe transportieren wollen** oder dauerhaft in der Sitzung eigene Aktionen in Objekten anstoßen möchten.

Neben vorhanden Objekte können neue Objekte über den Typ `[PSCustomObject]` erzeugt werden. Dieses leere Objekt kann, um einen Satz von eigenen Eigenschaften und Ereignisse ergänzt werden.

Mit `Add-Member` können Sie ein konkretes Objekt, um neue Eigenschaften und Methoden ergänzen. Mit `Update-TypeData` können Sie einen Typen in der aktuellen Session ergänzen, so dass alle Objekte von diesem Typ von der Erweiterung profitieren können. Das sind 2 einfache Möglichkeiten der Objekt-Erweiterung, um Individualität im Pipeline-Fluss zu bekommen.

![](images/PowerShell-Objekt-Erweitern-Beispiel-1.png)

> TIPP - Zwei weitere spannende Artikel die gut zu diesem Thema passen sind: "[PowerShell Einstieg für Anfänger und Profis](https://attilakrick.com/powershell/powershell-tutorial/)" "[PowerShell Objekte in 3 Schritten erfolgreich analysieren](https://attilakrick.com/powershell/powershell-objekt-analyse/)", und "[PowerShell Pipeline Sinn & Nutzen erklärt](https://attilakrick.com/powershell/funktionsweise-powershell-pipeline/)".

##  2. <a name='ObjektMemberanalysieren'></a>Objekt Member analysieren

Zuerst versschafen wir uns einen Überblick (IST-Aufnahme), **welche Eigenschaften, Methoden und Ereignisse ein Object besitzt**. U.a. erfahren wir auch so, wie das Objekt bereits für die PowerShell erweitert wurde.

![](images/PowerShell-MemberTypes.png)

Die folgende Code-Zeile ...

```powershell
Get-Process | Get-Member -View 'Adapted'
```

... zeigt eine Liste von Eigenschaften, Methoden und Ereignisse die native (`Adapted`) im .NET-Typen `[System.Diagnostics.Process]` implementiert wurden. Das heißt dass diese Member in jeder .NET Programmiersprache aber auch in der PowerShell zur Verfügung steht und seitens [Microsoft supported und dokumentiert](https://docs.microsoft.com/de-de/dotnet/api/system.diagnostics.process) wird.

Neben diesen nativen .NET-Eigenschaften, -Methoden und -Ereignisse lassen wir uns nun die Member anzeigen die **bereits per PowerShell Erweiterungen hinzugefügt `Extended` wurden**.

```powershell
Get-Process | Get-Member -View 'Extended'
```

Diese Member können nur in der PowerShell gesehen und verwendet werden.

Hier nun eine Zusammenfassung gruppiert nach Eigenschaften, Methoden und Ereignisse-Typ:

```powershell
Get-Process | Get-Member -View 'All' | Group-Object -Property 'MemberType' -NoElement | Sort-Object -Property 'Count' -Descending
```

> TIPP - Wenn Sie mehrt über Objekt-Analyse verstehen wollen, dann lesen Sie: [PowerShell Objekte in 3 Schritten erfolgreich analysieren](https://attilakrick.com/powershell/powershell-objekt-analyse/).

**Wenn nun die benötigte Eigenschaft oder Methode nicht vorhanden ist?** Kein Problem! Das Typen-System der PowerShell ist flexibel. Wir ergänzen das aktuelle Objekt mit `Add-Member`. Dieses Verfahren hat den Vorteil, dass wir nicht komplett neue Typen definieren müssen und so redundanten Code implementieren würden.

Vorhandene Objekte oder eigene Objekte, um weitere Member zu erweitern ist immer dann sinnvoll, wenn a) weitere Daten oder Aktionen "huckepack" tranportiert werden sollen oder b) Objekte aus unterschiedlichen anderen Objekten und Informationen zusammengeführt werden sollen.

Ein Objekt kann auf unterschiedlichste Weise erweitert werden. Zum Beispiel soll in einem Anwendungsfall das Ergebnis unmittelbar nach der Berechnung einmalig in eine neue `NoteProperty`\-Eigenschaft gespeichert werden. In einem anderen Fall erfolgt diese Berechnung jedes Mal beim Lesen der zuvor neu geschaffenen `ScriptProperty`\-Eigenschaft. Folgende Objekt Erweiterungen stehen zur Verfügung:

| Art | Beschreibung |
| --- | --- |
| `AliasProperty` | Alias-Eigenschaft für eine andere vorhandene Property. |
| `NoteProperty` | Eine einfache Read/Write Property. |
| `ScriptProperty` | ScriptBlock-Code der jedesmal beim Lesen der Eigenschaft ausgeführt wird. |
| `PropertySet` | Eine Gruppe von Properties die über den Set-Namen angesprochen wird. |
| `ScriptMethode` | ScriptBlock-Code der beim Aufruf ausgeführt wird inkl. Argumenten-Übergabe |

Um Objekte erweitern zu können verwende ich für den weiteren Verlauf ein Windows Dienst-Objekt `$spooler`:

```powershell
$spooler = Get-Service -Name 'Spooler'
```

Das `$p1`\-Objekt wird nun um einen `NoteProperty`\-, `ScriptProperty`\- und `ScriptMethod`\-Member erweitert:

```powershell
# ? Dem Dienst-Objekt eine NoteProperty hinzufügen
$spooler | Add-Member -Name 'HelpdeskAufgabe' -Value 'Der Spooler muss immer laufen und bei Problem Dienst neu starten.' -MemberType 'NoteProperty'

# ? Dem Dienst-Objekt eine ScriptProperty hinzufügen
$spooler | Add-Member -Name 'ProzessId' -Value { Get-CimInstance -ClassName 'Win32_Service' -Filter "Name LIKE '$($this.ServiceName)'" | Select-Object -ExpandProperty 'ProcessId' } -MemberType 'ScriptProperty'
$spooler | Add-Member -Name 'Laufzeit' -Value { Get-Process -Id $this.ProzessId | Select-Object -ExpandProperty 'StartTime' | New-TimeSpan } -MemberType 'ScriptProperty'

# ? Dem Dienst-Objekt eine ScriptMethod hinzufügen
$spooler | Add-Member -Name 'Restart' -Value { $this.Stop() ; $this.Start() } -MemberType 'ScriptMethod'
```

Jetzt können wir die neuen Objekt-Erweiterung verwenden:

```powershell
# ? Die neuen Properties und Methods anzeigen
$spooler | Get-Member -View 'Extended'

# * Beispiel testen:
$spooler.HelpdeskAufgabe # ? NoteProperty   aufrufen => statisches Datum
$spooler.ProzessId       # ? ScriptProperty aufrufen => dynamisches Datum
$spooler.Laufzeit        # ? ScriptProperty aufrufen => dynamisches Datum
$spooler.Restart()       # ? ScriptMethod   aufrufen => dynamisches Datum
```

Hier ein anderes Beispiel einer ScriptMethod-Erweiterung. Die neue Methode `SyncCreationLastTime` nimmt ein `datetime`\-Objekt als Argument entgegen:

```powershell
$datei = New-Item -Path 'C:\temp\Test.txt' -Force
$datei | Add-Member -Name 'SyncCreationLastTime' -Value {
        param(
            [datetime]$newDateTime
        )
        $this.CreationTime   = $newDateTime
        $this.LastWriteTime  = $newDateTime
        $this.LastAccessTime = $newDateTime
    } -MemberType 'ScriptMethod'
$datei.SyncCreationLastTime('2020-12-31')
$datei | Select-Object -Property Name, CreationTime, LastWriteTime, LastAccessTime
```

**Wie können sämtliche Objekte eines Typs erweitert werden?.** Bis hierhin erweiterte `Add-Member` nur die Objekte direkt in der Pipeline oder eine Variable. Sollte jedoch Pipeline-Übergreifend sämtliche Objekte von einem Typ in der aktuellen Session erweitert werden, so müssen wir dies anders implementieren. In diesem Fall nehmen wir die Objekt Erweiterung direkt am Typ mittels `Update-TypeData` vor. Diese Art der Erweiterung wirkt sich nur in der Session auf alle Objekte vom gleichen Typ aus.

```powershell
# ? Session-weite Erweiterungen
Update-TypeData -TypeName 'System.Diagnostics.Process' -MemberName 'WorkingSet64MB' -Value { [int]($this.WorkingSet64 / 1MB) } -MemberType 'ScriptProperty' -Force

# ? Alle Process-Objects haben jetzt eine neue Property WorkingSet64MB
Get-Process | Get-Member -View 'Extended'
Get-Process | Select-Object -Property 'Name', 'WorkingSet64MB'
```

Im folgenden Beispiel sollen alle Objects der PowerShell eine Methode `OpenTypeNameSearch` bekommen. Wird diese Methode aufgerufen öffnet sich im Browser die Google-Suche die nach dem konkreten Typennamen sucht, um so mehr über diesen Typ in Erfahrung zu bringen.

```powershell
Update-TypeData -TypeName 'System.Object' -MemberName 'OpenTypeNameSearch' -MemberType 'ScriptMethod' -Force -Value {
    $FullTypeName = $this.GetType().FullName
    $SearchUrl = "https://www.google.com/search?q=$FullTypeName"
    Start-Process -FilePath $SearchUrl
}

# .OpenTypeNameSearch() testen

$p1 = Get-Process | Select-Object -First 1
$p1.OpenTypeNameSearch() # Google-Suche nach System.Diagnostics.Process startet

$s1 = Get-Service | Select-Object -First 1
$s1.OpenTypeNameSearch() # Google-Suche nach System.ServiceProcess.ServiceController
```

In diesem Beispiel wird der Type `[System.Object]` bereichert. Sämtliche anderen Typen wurden früher oder später von Object abgeleitet was zu folge hat das die Methode `OpenTypeNameSearch` an allen Objekten, egal von welchem Typ vorhanden ist.

![](images/PowerShell-Update-TypeData.png)

##  3. <a name='VierMglichkeiteneigeneObjektezuerschaffen'></a>Vier Möglichkeiten eigene Objekte zu erschaffen

Die oben beschriebenen Methoden kürzen vorhandene Objekte, um deren Member und fügen eigene Member hinzu so dass der ursprüngliche Sinn des Typen verloren geht. Im weiteren Verlauf der Objektverwertung können die Objekte nicht mehr auseinander gehalterden werden. In kurzen Pipeline-Verknüpfung-Ketten ist, das noch ein legitimes Mittel aber darüber hinauskommt, der Wunsch auf eigene Typen kreieren zu können. Hierzu stehen uns 4 Möglichkeiten zur Verfügung.

*   `PSCustomObject` per `HashTable` erzeugen
*   `PSCustomObject` per `Add-Member` erzeugen
*   Eigene Typen-Definition per PowerShell
*   Eigene Typen-Definition per C#

###  3.1. <a name='PSCustomObjectperHashTableerzeugen'></a>PSCustomObject per HashTable erzeugen
Ein effizienter Weg, um einfache Daten-Transport-Container schnell zu erschaffen ist das Konvertieren eines `HashTable`\-Objekte in ein `PSCustomObject`\-Objekt.

**Nachteile:**

1.  Unterschiedlich erzeugte `PSCustomObject`\-Objekte können nicht auseinandergehalten werden.
2.  Methoden und und Script-Eigenschaften können nicht implementiert werden.

```powershell
# PSCustomObject erzeugen
$PassivesObjekt = [PSCustomObject]@{
    Ermittler      = 'Attila Krick'
    ComputerName   = $env:COMPUTERNAME
    ErstelltAm     = ( Get-Date )
    BelegterRam    = [int]((Get-Process | Measure-Object -Property WorkingSet64 -Sum | Select-Object -ExpandProperty Sum) / 1GB)
    AktiveProzesse = Get-Process
}

# PSCustomObject nutzen
$PassivesObjekt | Get-Member
$PassivesObjekt.Ermittler
$PassivesObjekt.ComputerName
$PassivesObjekt.ErstelltAm
$PassivesObjekt.BelegterRam
$PassivesObjekt.AktiveProzesse
```

###  3.2. <a name='PSCustomObjectperAdd-Membererzeugen'></a>PSCustomObject per Add-Member erzeugen
Die resultierenden Objekte sind identisch wie bei 1.. Zusätzlich können wir die `PSCustomObject`\-Objekte mittels `Add-Member`, um dynamischen Member wie `ScriptProperty` und `ScriptMethod` bereichern.

**Nachteile:**

1.  Siehe Nachteile A.
2.  Erhöhter Erstellungsaufwand.
3.  Lesbarkeit könnte leide da Komplexer und Abstrakter.

```powershell
# PSCustomObject erzeugen
$AktivesObjekt = New-Object -TypeName 'PSCustomObject'
$AktivesObjekt | Add-Member -Name 'ErstelltAm' -MemberType 'NoteProperty' -Value ( Get-Date )
$AktivesObjekt | Add-Member -Name 'JetztIst' -MemberType 'ScriptProperty' -Value { Get-Date }
$AktivesObjekt | Add-Member -Name 'PasswortGenerieren' -MemberType 'ScriptMethod' -Value {
    param([Byte]$AnzahlZeichen = 10)
    return [Convert]::ToBase64String((0..255 | Get-Random -Count 255)).SubString(0, $AnzahlZeichen)
}

# PSCustomObject nutzen
$AktivesObjekt | Get-Member
$AktivesObjekt.ErstelltAm
$AktivesObjekt.JetztIst
$AktivesObjekt.PasswortGenerieren(12)
```

###  3.3. <a name='EigeneTypen-DefinitionperPowerShell'></a>Eigene Typen-Definition per PowerShell
Per Definition können einfache Klassen erzeugt werden die Eigenschaften und Methoden besitzen. Anschließend können Objekte erzeugt werden, die sich klar von anderen Objekten und deren Typen abgrenzen. Weiterhin ist nur ein geringes Grundverständnis der objektorientierten Programmierung (OOP) nötig. Alles was Sie dazu benötigen finden Sie unter: `Get-Help -Name 'about_Classes' -ShowWindow`.

**Nachteil:**

1.  Es stehen nicht alle Möglichkeiten der OOP für diese Art der Implementierung zur Verfügung.

```powershell
# Eigene Klasse XAkte definieren
class XAkte {

    # Private Variable
    # Nur innerhalb des Objektes, kann auf sie zugegriffen werden.
    hidden [string]$_Titel

    # Eine Read/Write-Property vom Typ Byte
    # mit einem gültigen Wertbereich von 10 bis 100 und dem Default-Wert 10.
    [ValidateRange(10, 1000)]
    [Byte]$AufwandStunden = 10

    # Konstruktor
    # Code der einmalig beim Erzeugen eines neuen Objektes ausgeführt wird.
    XAkte([string]$titel) {
        $this._Titel = $titel
    }

    # Eine Methode mit Rückgabe
    # und ohne Argumenten Übergabe.
    [string]GetTitel() {
        return $this._Titel
    }

    # Eine Methode mit Argumenten Übergabe
    # und ohne Rückgabe.
    [void]AkteSchließen([string]$autorisierungcode) {
        "Die XAkte $($this._Titel) wurde am $(Get-Date -Format 'dd.MM.yyyy') nach $($this.AufwandStunden) Stunden geschlossen. Autorisierungcode: $autorisierungcode" | Add-Content -Path 'C:\Temp\XAkten.log'
    }
}

# XAkte-Objekt(e) nutzen
$x = [XAkte]::new('TH34X')
$x.AufwandStunden = 99
'Titel der $x XAkte ist {0}' -f $x.GetTitel() | Write-Warning
$x.AkteSchließen('08-15-47-11')
Get-Content -Path 'C:\Temp\XAkten.log'
```

###  3.4. <a name='EigeneTypen-DefinitionperC'></a>Eigene Typen-Definition per C#
Per C#-Definition können komplexe Klassen erzeugt werden die Eigenschaften, Methoden, Ereignisse etc. besitzen. Anschließend können Objekte erzeugt werden, die sich klar von anderen Objekten und deren Typen abgrenzen. Es stehen **ALLE Möglichkeiten der OOP** für diese Art der Implementierung zur Verfügung.

**Nachteile:**

1.  Es ein ausführliches Wissen der objektorientierten Programmierung (OOP) nötig.
2.  Die Entwicklung solch einer komplexen Klasse benötigt eine C# Entwicklungsumgebung.

```powershell
Add-Type -Language 'CSharp' -TypeDefinition @'
using System;

public class YAkte
{
    // Private Variable (Feld)
    // Nur innerhalb des Objektes, kann auf sie zugegriffen werden.
    private byte _AufwandStunden = 10;

    // Eine Read/Write-Property vom Typ Byte
    // mit einem gültigen Wertbereich von 10 bis 100 und dem Default-Wert 10
    // sowie das nur Stunden hinzugebucht aber nicht abgezogen werden können.
    public byte AufwandStunden
    {
        get { return _AufwandStunden; }
        set
        {
            if (value < _AufwandStunden)
                throw new ArgumentOutOfRangeException("value", "Der Stunden-Aufwand kann nachträglich nicht vermindert werden.");
            if (value < 10 || value > 100)
                throw new ArgumentOutOfRangeException("value", "Der Stunden-Aufwand muss >= 10 und <= 100 Stunden sein.");
            _AufwandStunden = value;
        }
    }

    // Eine ReadOnly-Property vom Typ String
    public string Titel { get; private set; }

    // Konstruktor
    // Code der einmalig beim Erzeugen eins neuen Objekts ausgeführt wird.
    public YAkte(string titel)
    {
        Titel = titel;
    }
}
'@

# YAkte-Objekt(e) nutzen
$y = [YAkte]::new('DF88G')
$y.AufwandStunden = 11
$y.AufwandStunden = 10 # ! Nicht möglich
'Titel der $y YAkte ist {0}' -f $y.Titel | Write-Warning
$y.Titel = 'Neuer Titel' # ! Nicht möglich
```

##  4. <a name='Epilog'></a>Epilog

Wollen Sie dauerhaft von diesen Typen-Erweiterungen profitieren so könnten Sie diesen Code in einer der `profile.ps1` Dateien speichern:

```powershell
$profile.AllUsersAllHosts
$profile.AllUsersCurrentHost
$profile.CurrentUserAllHosts
$profile.CurrentUserCurrentHost
```

Oder Sie implementieren den Code in ein eigenes Modul (`.PSM1`).
