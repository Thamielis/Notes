# Handling Events with PowerShell and .NET (Part 1)

- [Handling Events with PowerShell and .NET (Part 1)](#handling-events-with-powershell-and-net-part-1)
  - [PowerShell Engine Ereignisse](#powershell-engine-ereignisse)
  - [Ein neues Ereignis erstellen: das New-Event cmdlet](#ein-neues-ereignis-erstellen-das-new-event-cmdlet)
    - [Anzeigen der Ereigniswarteschlange: Das Get-Event Cmdlet](#anzeigen-der-ereigniswarteschlange-das-get-event-cmdlet)
    - [Entfernen von Ereignissen aus der Warteschlange: Das Remove-Event cmdlet](#entfernen-von-ereignissen-aus-der-warteschlange-das-remove-event-cmdlet)
    - [Abonnieren eines Ereignisses: Die Cmdlets Register-EngineEvent und Get-EventSubscriber](#abonnieren-eines-ereignisses-die-cmdlets-register-engineevent-und-get-eventsubscriber)
    - [Auslösen von Ereignissen in PowerShell](#auslösen-von-ereignissen-in-powershell)
    - [Abmelden von einem Ereignis: Das Unregister-Event Cmdlet](#abmelden-von-einem-ereignis-das-unregister-event-cmdlet)
  - [.NET Framework Ereignisses](#net-framework-ereignisses)
    - [Beispiel: Process.Exited-Ereignisse in PowerShell behandeln](#beispiel-processexited-ereignisse-in-powershell-behandeln)
    - [Beispiel: FileSystemWatcher-Klassenereignisse in PowerShell behandeln](#beispiel-filesystemwatcher-klassenereignisse-in-powershell-behandeln)
    - [Beispiel: System.Diagnostics.EventLog-Klassenereignisse in PowerShell behandeln](#beispiel-systemdiagnosticseventlog-klassenereignisse-in-powershell-behandeln)
  - [Fazit](#fazit)
  - [Volle Kontrolle und vollständige Nachverfolgbarkeit](#volle-kontrolle-und-vollständige-nachverfolgbarkeit)
  - [Weiterführende Links](#weiterführende-links)

Das Oxford-Wörterbuch definiert ein Ereignis als „[eine Sache, die passiert, besonders etwas Wichtiges][1]". In der Computerwelt assoziieren die meisten Leute Ereignisse mit Protokollierung, aber Ereignisse gehen darüber hinaus. Tatsächlich ist ein Protokoll nichts anderes als die Ausgabe eines Ereignisses.

Dieser Blog-Beitrag behandelt zwei Arten von Ereignissen, PowerShell-Engine-Ereignisse und .NET-Objekt-Ereignisse (klicken Sie hier für Teil 2 der Serie, [Ereignisbehandlung mit PowerShell und WMI][2]).

Lesen Sie weiter, wenn Sie erfahren möchten, wie Sie sowohl PowerShell-Engine-Ereignisse als auch .NET Object-Ereignisse behandeln können und welche PowerShell-Befehle Ihnen dabei helfen.

Die Grundlagen: Von PowerShell-Klassen und Objekten zu Ereignissen

Bevor wir uns mit den Details von PowerShell-Ereignissen beschäftigen, müssen wir zunächst Klassen und Objekte verstehen.

- Eine Klasse ist eine Sammlung von Eigenschaften und Methoden.
- Ein Objekt ist eine Instanz der Klasse, die für den Zugriff auf Eigenschaften und Methoden verwendet wird.

Einfach, oder? Lassen Sie uns dies anhand eines realen Beispiels vereinfachen.

Ich bin ein Objekt der Klasse meiner Eltern. Meine Eltern haben bestimmte Eigenschaften, wie schwarze Haare, braune Augen usw. und bestimmte Methoden wie Kochen, Tanzen usw.

Nehmen wir ein einfaches Beispiel für eine in PowerShell definierte Klasse:

```powershell
class PrintName {#Define a class
    [Int] $count #Property
    [Void] WriteHello([string] $Name){ #Function
        Write-Host "Hello $Name"
    }
}

$Obj = [PrintName]::new() #Instantiate an Object

$Obj.count = 1 #Assign value for count property
Write-Host "Property Value " $obj.count
$Obj.WriteHello('Sonny') #Call GetProcessPath method
"`n"
```

Diese liefert die folgende Ausgabe:

```powershell
Property Value 1
Hello Sonny
```

Im obigen Beispiel haben wir eine Klasse namens „PrintName" mit einer Eigenschaft namens „count" und einer Methode namens „WriteHello" erstellt. Aber warum sprechen wir über Klassen?

Nun, um Ereignisse zu verstehen, müssen wir zuerst die Klassenstruktur verstehen, denn ein Ereignis ist nichts anderes als eine spezielle Art von Methode.

Speziell, weil andere Teile des Codes Ereignisse abonnieren können (dies wird auch als _Ereignis-Subskription_ bezeichnet).

## PowerShell Engine Ereignisse

Damit andere Programme über bestimmte Aktionen oder Zustandsänderungen durch ein bestimmtes Programm informiert werden können, müssen wir Ereignisse in diesem Programm erstellen.

So können andere Programme diese Ereignisse abonnieren und werden informiert, wenn bestimmte Aktionen oder Zustandsänderungen in Ihrem Programm stattfinden (keine Sorge, sobald wir über .NET Framework-Ereignisse besprechen, werden die Dinge klarer).

PowerShell bietet verschiedene Cmdlets für die Arbeit mit Ereignissen. Beginnen wir mit dem _New-Event_ Cmdlet (Abbildung 1), das, wie der Name schon sagt, ein neues Ereignis erstellt.

## Ein neues Ereignis erstellen: das New-Event cmdlet

PowerShell bietet verschiedene Cmdlets für die Arbeit mit Ereignissen. Beginnen wir mit dem Cmdlet „New-Event" (Abbildung 1), mit dem, wie der Name schon sagt, ein neues Ereignis erstellt wird.

```powershell
New-Event 

    [-SourceIdentifier]  

    [[-Sender] ] 

    [[-EventArguments] <psobject[]>] 

    [[-MessageData] ] 

    []</psobject[]>
```

[Source: Microsoft][3]

[][4]![Das Cmdlet "New-Event" erstellt ein neues PowerShell-Ereignis](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-1-Creating-a-new-event-in-powershell-1.png?width=585&name=Fig-1-Creating-a-new-event-in-powershell-1.png)

_Abbildung 1: Das New-Event Cmdlet erstellt ein neues Event_

### Anzeigen der Ereigniswarteschlange: Das Get-Event Cmdlet

Sobald ein Ereignis erstellt wurde, wird es der _Ereigniswarteschlange_ hinzugefügt. Um die Ereigniswarteschlange anzuzeigen, verwenden wir das Cmdlet Get-Event. Abbildung 2 zeigt, dass sich zwei Ereignisse in der Warteschlange befinden.

```powershell
Get-Event
   [[-SourceIdentifier] ]
   []
```

```powershell
Get-Event
   [-EventIdentifier] 
   []
```

[Quelle: Microsoft][5]

 [][6]![Die Ausgabe des Cmdlets Get-Event zeigt, dass sich derzeit zwei Ereignisse in der Ereigniswarteschlange befinden](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-2-Viewing-events-in-the-Queue.png?width=667&height=496&name=Fig-2-Viewing-events-in-the-Queue.png)

_Abbildung 2: Das New-Event Cmdlet ruft Ereignisse in der PowerShell-Ereigniswarteschlange für die aktuelle Sitzung ab_

### Entfernen von Ereignissen aus der Warteschlange: Das Remove-Event cmdlet

Wie entfernen wir nun Ereignisse aus der Warteschlange? Wir verwenden das _Remove-Event_ Cmdlet, wie in _Abbildung_ _3_ dargestellt.

```powershell
Remove-Event
      [-SourceIdentifier] 
      [-WhatIf]
      [-Confirm]
      []
```

```powershell
Remove-Event
      [-EventIdentifier] 
      [-WhatIf]
      [-Confirm]
      []
```

[Quelle: Microsoft][7]

![Das Cmdlet "Remove-Event" löscht Ereignisse aus der Ereigniswarteschlange](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-3-Removing-events-from-the-Queue.png?width=569&height=287&name=Fig-3-Removing-events-from-the-Queue.png)

_Abbildung 3: Das Remove-Event Cmdlet löscht Ereignisse aus der PowerShell-Ereigniswarteschlange_

Wie wir sehen können, ist nur noch ein Ereignis in der Ereigniswarteschlange vorhanden.

Bevor wir fortfahren, leeren wir die Ereigniswarteschlange, indem wir das folgende Cmdlet ausführen

```powershell
Remove-Event -SourceIdentifier *
```

Nun befinden sich keine Ereignisse in unserer Ereigniswarteschlange.

### Abonnieren eines Ereignisses: Die Cmdlets Register-EngineEvent und Get-EventSubscriber

Ereignisse sind nur dann nützlich, wenn jemand sie abonniert hat. Um ein Ereignis zu abonnieren, verwenden wir das _Register-EngineEvent_ Cmdlet, wie in Abbildung 4 gezeigt. Genau wie Ereignisse wird die **Ereignis-Subskription** der Sitzung hinzugefügt.

Um die aktuellen Subskriptionen einer Sitzung anzuzeigen, verwenden Sie das Cmdlet _Get-EventSubscriber_. Die beiden Cmdlets _Register-EngineEvent_ und _Get-EventSubscriber_ sind in Abbildung 4 dargestellt.

```powershell
Register-EngineEvent
        [-SourceIdentifier] 
        [[-Action] ]
        [-MessageData ]
        [-SupportEvent]
        [-Forward]
        [-MaxTriggerCount ]
        []
```

[Quelle: Microsoft][8]

```powershell
Get-EventSubscriber
   [[-SourceIdentifier] ]
   [-Force]
   []
```

```powershell
Get-EventSubscriber
   [-SubscriptionId] 
   [-Force]
   []

```

[Source: Microsoft][9]

![Abonnieren von " MyEvent" mit dem Cmdlet "Register-EngineEvent](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-4-Subscribing-to-my-event-event.png?width=898&name=Fig-4-Subscribing-to-my-event-event.png)

_Abbildung 4: Mit dem Register-EngineEvent Cmdlet abonieren wir das Ereignis "MyEvent"_

### Auslösen von Ereignissen in PowerShell

Im obigen Beispiel erstellen wir ein neues Abonnement für ein Ereignis mit dem Namen „MyEvent".

Lassen Sie uns nun das Ereignis mit dem Namen „MyEvent" auslösen. Wie in Abbildung 5 zu sehen ist, wird beim Auslösen des Ereignisses mit dem Namen „MyEvent" der Ereignisabonnent aufgerufen und der Aktionsskriptblock ausgeführt.

 [][10]![Der Aktionsblock wird ausgeführt, wenn ein neues Ereignis mit dem Namen " MyEvent" aufgerufen wird](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-5-The-action-block-is-being-executed-when-a-new-event-named-myevent-is-envoked.png?width=727&height=645&name=Fig-5-The-action-block-is-being-executed-when-a-new-event-named-myevent-is-envoked.png)

Abbildung 5: Der Aktionsscriptblock wird ausgeführt, wenn ein neues Ereignis mit dem Namen "MyEvent" ausgeführt wird

### Abmelden von einem Ereignis: Das Unregister-Event Cmdlet

Um die Subskription aus der aktuellen Sitzung zu entfernen, verwenden wir das Cmdlet Unregister-Event, wie in Abbildung 6 gezeigt.

```powershell
Unregister-Event
          [-SourceIdentifier] 
          [-Force]
          [-WhatIf]
          [-Confirm]
          []
```

```powershell
Unregister-Event
          [-SubscriptionId] 
          [-Force]
          [-WhatIf]
          [-Confirm]
          []

```

[Quelle: Microsoft][11]

![Abbrechen eines Ereignisabonnements mit dem Cmdlet "Unregister-Event" in PowerShell](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-6-Unregistering-the-event-subscriber.png?width=667&height=383&name=Fig-6-Unregistering-the-event-subscriber.png)

_Abbildung 6: Aufhebung der Registrierung des Eventabonnements_

## .NET Framework Ereignisses

- ErrorDataReceived
- Exited und
- OutputDataReceived

Um auf Klassenmitglieder zuzugreifen, müssen wir entweder ein neues Objekt instanziieren oder vorhandene Objekte verwenden. Sobald wir ein Objekt haben, können wir es verwenden, um die Ereignisse zu abonnieren.

![Aufhebung der Registrierung des Eventabonnements](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-7-Exited-event-for-SystemDiagnosticProcess-class.png?width=667&height=441&name=Fig-7-Exited-event-for-SystemDiagnosticProcess-class.png)

_Abbildung 7: Aufhebung der Registrierung des Eventabonnements_

### Beispiel: Process.Exited-Ereignisse in PowerShell behandeln

PowerShell bietet das Cmdlet _Register-ObjectEvent_ zum Abonnieren von .NET Framework-Ereignissen.

Nehmen wir als Beispiel an, dass wir das Ereignis „Exiting" der Klasse _Process_ abonnieren möchten. Dazu benötigen wir zunächst ein Objekt der Klasse _Process_. Mit diesem Objekt können wir dann die Member-Ereignisse der _Process_\-Klasse abonnieren.

Das Ereignis „Exiting" wird aufgerufen, wenn ein Prozess beendet wird. In unserem Beispiel werden wir das Objekt _Taschenrechner-Prozess_ verwenden, um das Ereignis „Exiting" zu abonnieren.

Jeder Prozess, der unter Windows läuft, ist ein Objekt. Um eine Liste der Prozessobjekte unter Windows abzurufen, können wir das Cmdlet _Get-CimInstance_ verwenden. Wie in Abbildung 8 zu sehen ist, gibt das Cmdlet Get-CimInstance die Objekte aus, und durch Kombination mit dem Cmdlet _Get-Member_ können wir die Klassenmitglieder anzeigen.

```powershell
Get-CimInstance
   [-ClassName] 
   [-ComputerName <string[]>]
   [-KeyOnly]
   [-Namespace ]
   [-OperationTimeoutSec ]
   [-QueryDialect ]
   [-Shallow]
   [-Filter ]
   [-Property <string[]>]
   []</string[]></string[]>
```

[Quelle: Microsoft][12]

![Verwenden des Cmdlets Get-CimInstance zum Anzeigen laufender Prozesse](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-8-CIM-cmdlet-to-view-running-processes.png?width=667&height=341&name=Fig-8-CIM-cmdlet-to-view-running-processes.png)

_Abbildung 8: Verwenden des Cmdlets Get-CimInstance zum Anzeigen laufender Prozesse_

Für unser Beispiel starten wir in unserem Code den Taschenrechner-Prozess. Wir haben immer die Möglichkeit, ein bereits vorhandenes Prozessobjekt zu verwenden.

Im folgenden Code starten wir zunächst den Taschenrechner-Prozess und erfassen das Objekt in der Variablen _$CalcProcessObj_.

```powershell
$CalcProcessObj = [System.Diagnostics.Process]::Start("calc.exe")
Register-ObjectEvent -InputObject $CalcProcessObj -EventName Exited -Action { cmd.exe /c ping -n 2 8.8.8.8 }
```

Als Nächstes verwenden wir das Cmdlet _Register-ObjectEvent_, um das Ereignis „Exited" für den Taschenrechnerprozess zu abonnieren.

```powershell
Register-ObjectEvent
        [-InputObject] 
        [-EventName] 
        [[-SourceIdentifier] ]
        [[-Action] ]
        [-MessageData ]
        [-SupportEvent]
        [-Forward]
        [-MaxTriggerCount ]
        []
```

[Source: Microsoft][13]

Wenn der Taschenrechner-Prozess beendet wird, wird unser Aktionsblock ausgeführt. Der Aktionsblock enthält einen einfachen Befehl zum Senden von 2 Pings an die IP-Adresse 8.8.8.8.

Abbildung 9 zeigt die Ausgabe, dass wir das Ereignis erfolgreich abonniert haben. [][14]![Ausgabe nach dem Ausführen des Cmdlets „Register-ObjectEvent](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-9-Output-after-running-the-Register-ObjectEvent-cmdlet.png?width=901&height=87&name=Fig-9-Output-after-running-the-Register-ObjectEvent-cmdlet.png)

_Abbildung 9: Ausgabe nach dem Ausführen des Cmdlets „Register-ObjectEvent_

Nach dem Beenden des Taschenrechner-Prozesses können wir sehen, dass der Scriptblock ausgeführt wurde und 2 Pings an die IP-Adresse 8.8.8.8 gesendet wurden (Abbildung 10).

![Wireshark zeigt 2 Pings, die an die IP-Adresse 8.8.8.8 gesendet wurden](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-10-Wireshark-showing-2-pings-sent-to-IP-address-8-8-8-8.png?width=900&height=197&name=Fig-10-Wireshark-showing-2-pings-sent-to-IP-address-8-8-8-8.png)

_Abbildung 10: Wireshark zeigt 2 Pings, die an die IP-Adresse 8.8.8.8 gesendet wurden_

Wie wir bereits gesehen haben, können wir das Cmdlet _Get-EventSubscriber_ verwenden, um eine Liste aller Ereignisabonnements abzurufen.

Die Ausgabe in unserem Beispiel ist in Abbildung 11 zu sehen.

![Fig-11-List-of-event-subscribers-for-current-session](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-11-List-of-event-subscribers-for-current-session.png?width=766&name=Fig-11-List-of-event-subscribers-for-current-session.png)

_Abbildung 11: Abrufen einer Liste von Ereignisabonnenten für die aktuelle Sitzung mit dem Cmdlet Get-EventSubscriber_

Auf ähnliche Weise können wir mit dem Cmdlet Unregister-Event die Registrierung eines Ereignisabonnements aufheben (lieben Sie nicht auch die Verb-Nomen-Darstellung von Cmdlets? 😊), wie in Abbildung 12 zu sehen ist.

![Fig-12-unregistering-an-event-subscriber](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-12-unregistering-an-event-subscriber.png?width=766&name=Fig-12-unregistering-an-event-subscriber.png)

_Abbildung 12: Aufheben der Registrierung eines Ereignisabonnenten mit dem Cmdlet „Unregister-Event"_

### Beispiel: FileSystemWatcher-Klassenereignisse in PowerShell behandeln

Nehmen wir ein weiteres Beispiel der [FileSystemWatcher-Klasse][15], die einige interessante Ereignisse bereitstellt (siehe Abbildung 13), welche wir abonnieren können, z. B. das Erstellen oder Löschen von Dateien oder Verzeichnissen usw.

Angenommen, wir möchten das Ereignis zum Erstellen von Dateien/Verzeichnissen abonnieren. Wir folgen den gleichen Schritten wie in unserem letzten Beispiel:

- Zuerst müssen wir das Objekt abrufen,
- dann verwenden wir das Cmdlet _Register-ObjectEvent_, um das Ereignis zu abonnieren

 [][16]![Ereignisse für die Klasse FileSystemWatcher in .NET](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-13-Events-for-FileSystemWatcher-class.png?width=899&name=Fig-13-Events-for-FileSystemWatcher-class.png)

_Abbildung 13: Ereignisse für die Klasse FileSystemWatcher in .NET_

Erstellen wir zunächst ein Objekt der Klasse _FileSystemWatcher_

```powershell
$testobj1 = New-Object -TypeName System.IO.FileSystemWatcher
```

Als Nächstes geben wir unserem Objekt den Verzeichnispfad, der auf die Erstellung von Dateien/Verzeichnissen überwacht werden soll

```powershell
$testobj1.Path = "C:\Users\Public"
```

Schließlich verwenden wir das Cmdlet _Register-ObjectEvent_, um das Ereignis zu abonnieren.

```powershell
Register-ObjectEvent -InputObject $testobj1 -EventName Created -Action { cmd.exe /c ping -n 2 8.8.8.8 }
```

### Beispiel: System.Diagnostics.EventLog-Klassenereignisse in PowerShell behandeln

Hier ein weiteres Beispiel: Die System.Diagnostics.EventLog-Klasse bietet ein Ereignis namens „EntryWritten", das ausgelöst wird, wenn ein Protokolleintrag geschrieben wird.

Wir folgen denselben Schritten wie zuvor: Wir instanziieren ein Objekt, legen die Log-Eigenschaft für das Objekt fest (= welches Protokoll wir beobachten möchten) und verwenden dann das Cmdlet _Register-ObjectEvent_, um das Ereignis „EntryWritten" zu abonnieren.

```powershell
$testobj1 = New-Object -TypeName System.Diagnostics.EventLog

$testobj1.Log = "Security"

Register-ObjectEvent -InputObject $testobj1 -EventName EntryWritten -Action { Write-Host "Meow" }
```

Bitte beachten Sie: Dieser Code erfordert Administratorrechte, da wir mit der Protokollierung arbeiten.

 [][17]![Ereignisse für die Klasse FileSystemWatcher in .NET](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-14-EntryWritten-event-for-EventLog-class.png?width=901&name=Fig-14-EntryWritten-event-for-EventLog-class.png)

_Abbildung 14: Ereignisse für die Klasse FileSystemWatcher in .NET_

Für diese Demonstration habe ich von VS Code zu ISE gewechselt. _Abbildung 15_ zeigt, wie wir das Ereignis „EntryWritten" für Sicherheitsprotokolle abonniert haben.

Unsere Aktionsblöcke schreiben jedes Mal „Miau", wenn das Ereignis aufgerufen wird.

![Abonnieren des Ereignisses „EntryWritten"](https://www.scriptrunner.com/hs-fs/hubfs/Blog%20Media/Fig-15-Subscribing-for-EntryWritten-event.png?width=906&name=Fig-15-Subscribing-for-EntryWritten-event.png)

_Abbildung 15: Abonnieren des Ereignisses „EntryWritten"_

## Fazit

Es gibt einige Dinge, die wir beachten müssen

- Ereignisse, Ereignissubskriptionen und die Ereigniswarteschlange existieren nur in der aktuellen Sitzung. Wenn wir die aktuelle Sitzung schließen, wird die Ereigniswarteschlange verworfen, und die Ereignissubskription wird abgebrochen.
- Es gibt zwei separate Cmdlets für die Arbeit mit PowerShell-Engine-Ereignissen (_Register-EngineEvent_) und .NET Framework-Ereignissen (_Register-ObjectEvent_).

**Im zweiten Teil der Serie besprechen wir,** **wie [WMI-Ereignisse mit PowerShell][18]** gehandhabt werden können.

___

## Volle Kontrolle und vollständige Nachverfolgbarkeit

## Weiterführende Links

[1]: https://www.oxfordlearnersdictionaries.com/definition/english/event
[2]: https://www.scriptrunner.com/de/blog/handling-events-powershell-and-wmi
[3]: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/new-event?view=powershell-7
[4]: https://f.hubspotusercontent30.net/hubfs/3408889/Imported_Blog_Media/Fig-1-Creating-a-new-event-in-powershell-1.png
[5]: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-event?view=powershell-7
[6]: https://f.hubspotusercontent30.net/hubfs/3408889/Imported_Blog_Media/Fig-2-Viewing-events-in-the-Queue-1.png
[7]: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/remove-event?view=powershell-7
[8]: https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/Register-EngineEvent?view=powershell-7
[9]: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/remove-event?view=powershell-7
[10]: https://f.hubspotusercontent30.net/hubfs/3408889/Imported_Blog_Media/Fig-5-The-action-block-is-being-executed-when-a-new-event-named-myevent-is-envoked-1.png
[11]: https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/Unregister-Event?view=powershell-7
[12]: https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/Unregister-Event?view=powershell-7
[13]: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/register-objectevent?view=powershell-7
[14]: https://f.hubspotusercontent30.net/hubfs/3408889/Imported_Blog_Media/Fig-9-Output-after-running-the-Register-ObjectEvent-cmdlet-1.png
[15]: https://docs.microsoft.com/de-de/dotnet/api/system.io.filesystemwatcher?view=netframework-4.8
[16]: https://f.hubspotusercontent30.net/hubfs/3408889/Imported_Blog_Media/Fig-13-Events-for-FileSystemWatcher-class-1.png
[17]: https://f.hubspotusercontent30.net/hubfs/3408889/Imported_Blog_Media/Fig-14-EntryWritten-event-for-EventLog-class-1.png
[18]: https://www.scriptrunner.com/de/blog/handling-events-powershell-and-wmi
