---
created: 2022-03-04T14:10:09 (UTC +01:00)
tags: []
source: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html
author: sdwheeler
---

# 

> ## Excerpt
> Enthält Fragen und Antworten zum Ausführen von Remotebefehlen in PowerShell.

---
## FAQs zu PowerShell-Remoting

-   Häufig gestellte Fragen

### Ist diese Seite hilfreich?

Haben Sie weiteres Feedback für uns?

Feedback wird an Microsoft gesendet: Wenn Sie auf die Sendeschaltfläche klicken, wird Ihr Feedback verwendet, um Microsoft-Produkte und -Dienste zu verbessern. [Datenschutzrichtlinie](https://privacy.microsoft.com/en-us/privacystatement)

Vielen Dank.

### In diesem Artikel

1.  [Muss PowerShell auf beiden Computern installiert sein?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#muss-powershell-auf-beiden-computern-installiert-sein-)
2.  [Wie funktioniert Remoting?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#wie-funktioniert-remoting-)
3.  [Ist PowerShell-Remoting sicher?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ist-powershell-remoting-sicher-)
4.  [Ist für alle Remotebefehle PowerShell-Remoting erforderlich?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ist-f-r-alle-remotebefehle-powershell-remoting-erforderlich-)
5.  [Gewusst wie einen Befehl auf einem Remotecomputer ausführen?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#gewusst-wie-einen-befehl-auf-einem-remotecomputer-ausf-hren-)
6.  [Kann ich nur telnet auf einem Remotecomputer verwenden?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-nur-telnet-auf-einem-remotecomputer-verwenden-)
7.  [Kann ich eine permanente Verbindung erstellen?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-eine-permanente-verbindung-erstellen-)
8.  [Kann ich Befehle auf mehr als einem Computer gleichzeitig ausführen?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-befehle-auf-mehr-als-einem-computer-gleichzeitig-ausf-hren-)
9.  [Wo befinden sich meine Profile?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#wo-befinden-sich-meine-profile-)
10.  [Wie funktioniert die Drosselung bei Remotebefehlen?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#wie-funktioniert-die-drosselung-bei-remotebefehlen-)
11.  [Ist die Ausgabe von Remotebefehlen anders als die lokale Ausgabe?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ist-die-ausgabe-von-remotebefehlen-anders-als-die-lokale-ausgabe-)
12.  [Kann ich Hintergrundaufträge remote ausführen?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-hintergrundauftr-ge-remote-ausf-hren-)
13.  [Kann ich Windows-Programme auf einem Remotecomputer ausführen?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-windows-programme-auf-einem-remotecomputer-ausf-hren-)
14.  [Kann ich die Befehle einschränken, die Benutzer remote auf meinem Computer ausführen können?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-die-befehle-einschr-nken--die-benutzer-remote-auf-meinem-computer-ausf-hren-k-nnen-)
15.  [Was sind Auffächerungs- und Auffächerungskonfigurationen?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#was-sind-auff-cherungs--und-auff-cherungskonfigurationen-)
16.  [Kann ich Remoting auf einem einzelnen Computer testen, der nicht in einer Domäne ist?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-remoting-auf-einem-einzelnen-computer-testen--der-nicht-in-einer-dom-ne-ist-)
17.  [Kann ich Remotebefehle auf einem Computer in einer anderen Domäne ausführen?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-remotebefehle-auf-einem-computer-in-einer-anderen-dom-ne-ausf-hren-)
18.  [Unterstützt PowerShell Remoting über SSH?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#unterst-tzt-powershell-remoting--ber-ssh-)
19.  [Siehe auch](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also)

Wenn Sie remote arbeiten, geben Sie Befehle in PowerShell auf einem Computer (als "lokaler Computer" bezeichnet) ein, aber die Befehle werden auf einem anderen Computer (als "Remotecomputer" bezeichnet) ausgeführt. Die Erfahrung bei der Remotearbeit sollte dem direkten Arbeiten auf dem Remotecomputer so ähnlich wie möglich sein.

Hinweis

Um PowerShell-Remoting verwenden zu können, muss der Remotecomputer für Remoting konfiguriert sein. Weitere Informationen finden Sie unter [about\_Remote\_Requirements](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_Remote_Requirements).

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#muss-powershell-auf-beiden-computern-installiert-sein-)Muss PowerShell auf beiden Computern installiert sein?

Ja. Um remote arbeiten zu können, müssen die lokalen Computer und Remotecomputer über PowerShell, die Microsoft .NET Framework und das WS-Management-Protokoll (Web Services for Management) verfügen. Alle Dateien und anderen Ressourcen, die zum Ausführen eines bestimmten Befehls benötigt werden, müssen sich auf dem Remotecomputer befinden.

Computer mit Windows PowerShell 3.0 und Computer mit Windows PowerShell 2.0 können sich remote miteinander verbinden und Remotebefehle ausführen. Einige Features, z. B. die Möglichkeit, eine Verbindung mit einer Sitzung zu trennen und eine erneute Verbindung herzustellen, funktionieren jedoch nur, wenn beide Computer mit Windows PowerShell 3.0 ausgeführt werden.

Sie müssen über die Berechtigung zum Herstellen einer Verbindung mit dem Remotecomputer, die Berechtigung zum Ausführen von PowerShell und die Berechtigung für den Zugriff auf Datenspeicher (z. B. Dateien und Ordner) und die Registrierung auf dem Remotecomputer verfügen.

Weitere Informationen finden Sie unter [about\_Remote\_Requirements](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_Remote_Requirements).

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#wie-funktioniert-remoting-)Wie funktioniert Remoting?

Wenn Sie einen Remotebefehl übermitteln, wird der Befehl über das Netzwerk an die PowerShell-Engine auf dem Remotecomputer übertragen und im PowerShell-Client auf dem Remotecomputer ausgeführt. Die Befehlsergebnisse werden zurück an den lokalen Computer gesendet und in der PowerShell-Sitzung auf dem lokalen Computer angezeigt.

Um die Befehle zu übertragen und die Ausgabe zu empfangen, verwendet PowerShell das WS-Management Protokoll. Weitere Informationen zum WS-Management finden Sie in [WS-Management-Protokoll](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/windows/win32/winrm/ws-management-protocol) in der Windows Dokumentation.

Ab Windows PowerShell 3.0 werden Remotesitzungen auf dem Remotecomputer gespeichert. Dadurch können Sie die Verbindung mit der Sitzung trennen und die Verbindung von einer anderen Sitzung oder einem anderen Computer wiederherstellen, ohne die Befehle zu unterbrechen oder den Zustand zu verlieren.

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ist-powershell-remoting-sicher-)Ist PowerShell-Remoting sicher?

Wenn Sie eine Verbindung mit einem Remotecomputer herstellen, verwendet das System die Anmeldeinformationen für Benutzername und Kennwort auf dem lokalen Computer oder die Anmeldeinformationen, die Sie im Befehl angeben, um Sie beim Remotecomputer anzumelden. Die Anmeldeinformationen und der Rest der Übertragung werden verschlüsselt.

Um zusätzlichen Schutz hinzuzufügen, können Sie den Remotecomputer so konfigurieren, dass er Secure Sockets Layer (SSL) anstelle von HTTP verwendet, um auf WinRM-Anforderungen (Windows Remote Management) zu lauschen. Anschließend können Benutzer beim Herstellen einer Verbindung den **UseSSL-Parameter** `Invoke-Command``New-PSSession`der Cmdlets , `Enter-PSSession` und verwenden. Bei dieser Option wird anstelle von HTTP der sicherere HTTPS-Kanal verwendet.

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ist-f-r-alle-remotebefehle-powershell-remoting-erforderlich-)Ist für alle Remotebefehle PowerShell-Remoting erforderlich?

Nein. Mehrere Cmdlets verfügen über einen **ComputerName-Parameter** , mit dem Sie Objekte vom Remotecomputer abrufen können.

Diese Cmdlets verwenden kein PowerShell-Remoting. Sie können sie also auf jedem Computer verwenden, auf dem PowerShell ausgeführt wird, auch wenn der Computer nicht für PowerShell-Remoting konfiguriert ist oder wenn der Computer die Anforderungen für PowerShell-Remoting nicht erfüllt.

Diese Cmdlets umfassen Folgendes:

-   `Get-Process`
-   `Get-Service`
-   `Get-WinEvent`
-   `Get-EventLog`
-   `Test-Connection`

Geben Sie Zum Suchen aller Cmdlets mit einem **ComputerName-Parameter** Ein:

```powershell
Get-Help * -Parameter ComputerName
# or
Get-Command -ParameterName ComputerName
```

Informationen dazu, ob der **ComputerName-Parameter** eines bestimmten Cmdlets PowerShell-Remoting erfordert, finden Sie in der Parameterbeschreibung. Geben Sie Zum Anzeigen der Parameterbeschreibung Ein:

```powershell
Get-Help <cmdlet-name> -Parameter ComputerName
```

Beispiel:

```powershell
Get-Help Get-Process -Parameter ComputerName
```

Verwenden Sie für alle anderen Befehle das Cmdlet `Invoke-Command` .

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#gewusst-wie-einen-befehl-auf-einem-remotecomputer-ausf-hren-)Gewusst wie einen Befehl auf einem Remotecomputer ausführen?

Verwenden Sie das Cmdlet , um einen Befehl auf einem Remotecomputer `Invoke-Command` auszuführen.

Schließen Sie den Befehl in geschweifte Klammern () ein,`{}` um ihn zu einem Skriptblock zu machen. Verwenden Sie **den ScriptBlock-Parameter** von `Invoke-Command` , um den Befehl anzugeben.

Sie können den **ComputerName-Parameter** von verwenden `Invoke-Command` , um einen Remotecomputer anzugeben. Oder Sie können eine permanente Verbindung mit einem Remotecomputer (einer Sitzung) herstellen und dann den **Session-Parameter** `Invoke-Command` von verwenden, um den Befehl in der Sitzung auszuführen.

Mit den folgenden Befehlen wird beispielsweise ein Befehl remote `Get-Process` ausgeführt.

```powershell
Invoke-Command -ComputerName Server01, Server02 -ScriptBlock {Get-Process}

#  - OR -

Invoke-Command -Session $s -ScriptBlock {Get-Process}
```

Um einen Remotebefehl zu unterbrechen, geben Sie STRGC\+ ein. Die Unterbrechungsanforderung wird an den Remotecomputer übergeben, wo sie den Remotebefehl beendet.

Weitere Informationen zu Remotebefehlen finden Sie unter about\_Remote und den Hilfethemen zu den Cmdlets, die Remoting unterstützen.

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-nur-telnet-auf-einem-remotecomputer-verwenden-)Kann ich nur telnet auf einem Remotecomputer verwenden?

Sie können das Cmdlet verwenden `Enter-PSSession` , um eine interaktive Sitzung mit einem Remotecomputer zu starten.

Geben Sie an der PowerShell-Eingabeaufforderung Folgendes ein:

```powershell
Enter-PSSession <ComputerName>
```

Die Eingabeaufforderung ändert sich, um zu zeigen, dass Sie mit dem Remotecomputer verbunden sind.

```powershell
<ComputerName>\C:>
```

Nun werden die befehle, die Sie eingeben, auf dem Remotecomputer so ausgeführt, als ob Sie sie direkt auf dem Remotecomputer eingeben.

Um die interaktive Sitzung zu beenden, geben Sie Folgendes ein:

```powershell
Exit-PSSession
```

Eine interaktive Sitzung ist eine persistente Sitzung, die das WS-Management verwendet. Dies ist nicht dasselbe wie bei der Verwendung von Telnet, bietet jedoch eine ähnliche Erfahrung.

Weitere Informationen finden Sie unter `Enter-PSSession`.

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-eine-permanente-verbindung-erstellen-)Kann ich eine permanente Verbindung erstellen?

Ja. Sie können Remotebefehle ausführen, indem Sie den Namen des Remotecomputers, seinen NetBIOS-Namen oder seine IP-Adresse angeben. Oder Sie können Remotebefehle ausführen, indem Sie eine PowerShell-Sitzung (PSSession) angeben, die mit dem Remotecomputer verbunden ist.

Wenn Sie den **ComputerName-Parameter** von `Invoke-Command` oder verwenden `Enter-PSSession`, stellt PowerShell eine temporäre Verbindung her. PowerShell verwendet die Verbindung, um nur den aktuellen Befehl auszuführen, und schließt dann die Verbindung. Dies ist eine sehr effiziente Methode zum Ausführen eines einzelnen Befehls oder mehrerer nicht verbundener Befehle, auch auf vielen Remotecomputern.

Wenn Sie das Cmdlet zum `New-PSSession` Erstellen einer PSSession verwenden, stellt PowerShell eine permanente Verbindung für die PSSession her. Anschließend können Sie mehrere Befehle in der PSSession ausführen, einschließlich Befehlen, die Daten gemeinsam verwenden.

In der Regel erstellen Sie eine PSSession, um eine Reihe verwandter Befehle auszuführen, die Daten gemeinsam verwenden. Andernfalls ist die vom **ComputerName-Parameter** erstellte temporäre Verbindung für die meisten Befehle ausreichend.

Weitere Informationen zu Sitzungen finden Sie unter [about\_PSSessions](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_pssessions).

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-befehle-auf-mehr-als-einem-computer-gleichzeitig-ausf-hren-)Kann ich Befehle auf mehr als einem Computer gleichzeitig ausführen?

Ja. Der **ComputerName-Parameter** des Cmdlets `Invoke-Command` akzeptiert mehrere Computernamen, und der **Session-Parameter** akzeptiert mehrere PSSessions.

Wenn Sie einen Befehl `Invoke-Command` ausführen, führt PowerShell die Befehle auf allen angegebenen Computern oder in allen angegebenen PSSessions aus.

PowerShell kann Hunderte gleichzeitiger Remoteverbindungen verwalten. Die Anzahl der Remotebefehle, die Sie senden können, kann jedoch durch die Ressourcen Ihres Computers und seine Kapazität zum Herstellen und Verwalten mehrerer Netzwerkverbindungen eingeschränkt werden.

Weitere Informationen finden Sie im Beispiel im Hilfethema `Invoke-Command` .

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#wo-befinden-sich-meine-profile-)Wo befinden sich meine Profile?

PowerShell-Profile werden nicht automatisch in Remotesitzungen ausgeführt, sodass die befehle, die das Profil hinzufügt, nicht in der Sitzung vorhanden sind. Darüber hinaus wird die `$profile` automatische Variable nicht in Remotesitzungen aufgefüllt.

Verwenden Sie das Cmdlet , um ein Profil in einer Sitzung `Invoke-Command` auszuführen.

Beispielsweise führt der folgende Befehl das **Profil CurrentUserCurrentHost** vom lokalen Computer in der Sitzung in aus `$s`.

```powershell
Invoke-Command -Session $s -FilePath $profile
```

Mit dem folgenden Befehl wird das **Profil CurrentUserCurrentHost** vom Remotecomputer in der Sitzung in ausgeführt `$s`. Da die `$profile` Variable nicht aufgefüllt wird, verwendet der Befehl den expliziten Pfad zum Profil.

```powershell
Invoke-Command -Session $s {
  . "$home\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}
```

Nach dem Ausführen dieses Befehls sind die Befehle, die das Profil der Sitzung hinzufügt, in verfügbar `$s`.

Sie können auch ein Startskript in einer Sitzungskonfiguration verwenden, um ein Profil in jeder Remotesitzung auszuführen, die die Sitzungskonfiguration verwendet.

Weitere Informationen zu PowerShell-Profilen finden Sie [unter about\_Profiles](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_profiles). Weitere Informationen zu Sitzungskonfigurationen finden Sie unter `Register-PSSessionConfiguration`.

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#wie-funktioniert-die-drosselung-bei-remotebefehlen-)Wie funktioniert die Drosselung bei Remotebefehlen?

PowerShell bietet eine Drosselungsfunktion pro Befehl, mit der Sie die Anzahl gleichzeitiger Remoteverbindungen begrenzen können, die für jeden Befehl eingerichtet werden, um Sie bei der Verwaltung der Ressourcen auf Ihrem lokalen Computer zu unterstützen.

Der Standardwert ist 32 gleichzeitige Verbindungen, aber Sie können den **ThrottleLimit-Parameter** der Cmdlets verwenden, um ein benutzerdefiniertes Drosselungslimit für bestimmte Befehle festlegen.

Wenn Sie das Drosselungsfeature verwenden, denken Sie daran, dass es auf jeden Befehl angewendet wird, nicht auf die gesamte Sitzung oder auf den Computer. Wenn Sie Befehle gleichzeitig in mehreren Sitzungen oder PSSessions ausführen, ist die Anzahl gleichzeitiger Verbindungen die Summe der gleichzeitigen Verbindungen in allen Sitzungen.

Geben Sie Zum Suchen nach Cmdlets mit einem **ThrottleLimit-Parameter** Ein:

```powershell
Get-Help * -Parameter ThrottleLimit
-or-
Get-Command -ParameterName ThrottleLimit
```

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ist-die-ausgabe-von-remotebefehlen-anders-als-die-lokale-ausgabe-)Ist die Ausgabe von Remotebefehlen anders als die lokale Ausgabe?

Wenn Sie PowerShell lokal verwenden, senden und empfangen Sie "live" .NET Framework Objekten. "Live"-Objekte sind Objekte, die tatsächlichen Programmen oder Systemkomponenten zugeordnet sind. Wenn Sie die Methoden aufrufen oder die Eigenschaften von Liveobjekten ändern, wirken sich die Änderungen auf das tatsächliche Programm oder die Komponente aus. Und wenn sich die Eigenschaften eines Programms oder einer Komponente ändern, ändern sich auch die Eigenschaften des Objekts, die sie darstellen.

Da die meisten Liveobjekte jedoch nicht über das Netzwerk übertragen werden können, "serialisiert" PowerShell die meisten objekte, die in Remotebefehlen gesendet werden, d. h. jedes Objekt wird zur Übertragung in eine Reihe von XML-Datenelementen (Constraint Language in XML \[CLiXML\]) konvertiert.

Wenn PowerShell ein serialisiertes Objekt empfängt, konvertiert es den XML-Code in einen deserialisierten Objekttyp. Das deserialisierte Objekt ist ein genauer Datensatz der Eigenschaften des Programms oder der Komponente zu einem früheren Zeitpunkt, aber es ist nicht mehr "live", d. &a; es ist nicht mehr direkt mit der Komponente verknüpft. Und die Methoden werden entfernt, da sie nicht mehr effektiv sind.

In der Regel können Sie deserialisierte Objekte genauso wie Liveobjekte verwenden, aber Sie müssen deren Einschränkungen beachten. Außerdem verfügen die vom Cmdlet zurückgegebenen `Invoke-Command` Objekte über zusätzliche Eigenschaften, mit denen Sie den Ursprung des Befehls bestimmen können.

Einige Objekttypen, z. B. DirectoryInfo-Objekte und GUIDs, werden beim Empfangen wieder in Liveobjekte konvertiert. Diese Objekte benötigen keine besondere Behandlung oder Formatierung.

Informationen zum Interpretieren und Formatieren von Remoteausgabe finden Sie unter [about\_Remote\_Output](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_remote_output).

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-hintergrundauftr-ge-remote-ausf-hren-)Kann ich Hintergrundaufträge remote ausführen?

Ja. Ein PowerShell-Hintergrundauftrag ist ein PowerShell-Befehl, der asynchron ausgeführt wird, ohne mit der Sitzung zu interagieren. Wenn Sie einen Hintergrundauftrag starten, wird die Eingabeaufforderung sofort zurückgegeben, und Sie können in der Sitzung weiterarbeiten, während der Auftrag auch dann ausgeführt wird, wenn er über einen längeren Zeitraum ausgeführt wird.

Sie können einen Hintergrundauftrag auch dann starten, wenn andere Befehle ausgeführt werden, da Hintergrundaufträge immer asynchron in einer temporären Sitzung ausgeführt werden.

Sie können Hintergrundaufträge auf einem lokalen Oder Remotecomputer ausführen. Standardmäßig wird ein Hintergrundauftrag auf dem lokalen Computer ausgeführt. Sie können jedoch den **AsJob-Parameter** `Invoke-Command` des Cmdlets verwenden, um einen beliebigen Remotebefehl als Hintergrundauftrag auszuführen. Außerdem können Sie verwenden, um `Invoke-Command` einen Befehl remote `Start-Job` auszuführen.

Weitere Informationen zu Hintergrundaufträgen in PowerShell finden Sie unter [about\_Jobs](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_jobs) und [about\_Remote\_Jobs](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/module/microsoft.powershell.core/about/about_remote_jobs).

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-windows-programme-auf-einem-remotecomputer-ausf-hren-)Kann ich Windows-Programme auf einem Remotecomputer ausführen?

Sie können PowerShell-Remotebefehle verwenden, um Windows-basierten Programmen auf Remotecomputern auszuführen. Beispielsweise können Sie oder auf einem `Shutdown.exe` `Ipconfig.exe` Remotecomputer ausführen.

Sie können jedoch keine PowerShell-Befehle verwenden, um die Benutzeroberfläche für ein Programm auf einem Remotecomputer zu öffnen.

Wenn Sie ein Windows-Programm auf einem Remotecomputer starten, wird der Befehl nicht abgeschlossen, und die PowerShell-Eingabeaufforderung wird erst wieder angezeigt, wenn das Programm abgeschlossen ist oder Sie STRGC\+ drücken, um den Befehl zu unterbrechen. Wenn Sie das Programm z. B. auf `Ipconfig.exe` einem Remotecomputer ausführen, `Ipconfig.exe` wird die Eingabeaufforderung erst nach Abschluss der Ausführung wieder angezeigt.

Wenn Sie Remotebefehle verwenden, um ein Programm zu starten, das über eine Benutzeroberfläche verfügt, wird der Programmprozess gestartet, aber die Benutzeroberfläche wird nicht angezeigt. Der PowerShell-Befehl ist nicht abgeschlossen, und die Eingabeaufforderung wird erst wieder angezeigt, \+ wenn Sie den Programmprozess beenden oder STRGC drücken, wodurch der Befehl unterbrochen und der Prozess beendet wird.

Wenn Sie beispielsweise einen PowerShell-Befehl `Notepad` zum Ausführen auf einem Remotecomputer verwenden, wird der Editor-Prozess auf dem Remotecomputer gestartet, die Editor-Benutzeroberfläche wird jedoch nicht angezeigt. Drücken Sie STRGC, um den Befehl zu unterbrechen und die Eingabeaufforderung wiederherzustellen+.

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-die-befehle-einschr-nken--die-benutzer-remote-auf-meinem-computer-ausf-hren-k-nnen-)Kann ich die Befehle einschränken, die Benutzer remote auf meinem Computer ausführen können?

Ja. Jede Remotesitzung muss eine der Sitzungskonfigurationen auf dem Remotecomputer verwenden. Sie können die Sitzungskonfigurationen auf Ihrem Computer (und die Berechtigungen für diese Sitzungskonfigurationen) verwalten, um zu bestimmen, wer Befehle remote auf Ihrem Computer ausführen kann und welche Befehle ausgeführt werden können.

Eine Sitzungskonfiguration konfiguriert die Umgebung für die Sitzung. Sie können die Konfiguration mithilfe einer Assembly definieren, die eine neue Konfigurationsklasse implementiert, oder mithilfe eines Skripts, das in der Sitzung ausgeführt wird. Die Konfiguration kann die Befehle bestimmen, die in der Sitzung verfügbar sind. Außerdem kann die Konfiguration Einstellungen enthalten, die den Computer schützen, z. B. Einstellungen, die die Datenmenge einschränken, die die Sitzung remote in einem einzelnen Objekt oder Befehl empfangen kann. Sie können auch einen Sicherheitsdeskriptor angeben, der die Berechtigungen bestimmt, die für die Verwendung der Konfiguration erforderlich sind.

Das `Enable-PSRemoting` Cmdlet erstellt die Standardsitzungskonfigurationen auf Ihrem Computer: Microsoft.PowerShell, Microsoft.PowerShell.Workflow und Microsoft.PowerShell32 (nur 64-Bit-Betriebssysteme). `Enable-PSRemoting` legt die Sicherheitsbeschreibung für die Konfiguration fest, damit nur Mitglieder der Gruppe Administratoren auf Ihrem Computer diese verwenden können.

Sie können die Cmdlets für die Sitzungskonfiguration verwenden, um die Standardsitzungskonfigurationen zu bearbeiten, neue Sitzungskonfigurationen zu erstellen und die Sicherheitsbeschreibungen aller Sitzungskonfigurationen zu ändern.

Ab Windows PowerShell 3.0 `New-PSSessionConfigurationFile` können Sie mit dem Cmdlet benutzerdefinierte Sitzungskonfigurationen mithilfe einer Textdatei erstellen. Die Datei enthält Optionen zum Festlegen des Sprachmodus und zum Angeben der Cmdlets und Module, die in Sitzungen verfügbar sind, die die Sitzungskonfiguration verwenden.

Wenn Benutzer die Cmdlets `Invoke-Command`, `New-PSSession`oder `Enter-PSSession` verwenden, können sie den **ConfigurationName-Parameter** verwenden, um die Sitzungskonfiguration anzugeben, die für die Sitzung verwendet wird. Außerdem können sie die Standardkonfiguration ändern, die ihre Sitzungen verwenden `$PSSessionConfigurationName` , indem sie den Wert der Einstellungsvariablen in der Sitzung ändern.

Weitere Informationen zu Sitzungskonfigurationen finden Sie in der Hilfe zu den Cmdlets für die Sitzungskonfiguration. Geben Sie Zum Suchen der Cmdlets für die Sitzungskonfiguration Ein:

```powershell
Get-Command *PSSessionConfiguration
```

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#was-sind-auff-cherungs--und-auff-cherungskonfigurationen-)Was sind Auffächerungs- und Auffächerungskonfigurationen?

Das häufigste PowerShell-Remotingszenario mit mehreren Computern ist die 1:n-Konfiguration, bei der ein lokaler Computer (der Computer des Administrators) PowerShell-Befehle auf zahlreichen Remotecomputern ausführt. Dies wird als "Auffächerungsszenario" bezeichnet.

In einigen Unternehmen ist die Konfiguration jedoch n:1, bei der viele Clientcomputer eine Verbindung mit einem einzelnen Remotecomputer herstellen, auf dem PowerShell ausgeführt wird, z. B. mit einem Dateiserver oder Kiosk. Dies wird als "Auffächerungskonfiguration" bezeichnet.

PowerShell-Remoting unterstützt sowohl Auffächerungs- als auch Einfächerkonfigurationen.

Für die Auffächerungskonfiguration verwendet PowerShell das WS-Management-Protokoll (Web Services for Management) und den WinRM-Dienst, der die Microsoft-Implementierung von WS-Management unterstützt. Wenn ein lokaler Computer eine Verbindung mit einem Remotecomputer herstellt, stellt WS-Management eine Verbindung her und verwendet ein Plug-In für PowerShell, um den PowerShell-Hostprozess (Wsmprovhost.exe) auf dem Remotecomputer zu starten. Der Benutzer kann einen alternativen Port, eine alternative Sitzungskonfiguration und andere Features angeben, um die Remoteverbindung anzupassen.

Zur Unterstützung der "Fan-In"-Konfiguration verwendet PowerShell Internetinformationsdienste (IIS), um die WS-Verwaltung zu hosten, das PowerShell-Plug-In zu laden und PowerShell zu starten. In diesem Szenario werden alle PowerShell-Sitzungen im selben Hostprozess ausgeführt, anstatt jede PowerShell-Sitzung in einem separaten Prozess zu starten.

IIS-Hosting und auffächernde Remoteverwaltung werden in Windows XP oder in Windows Server 2003 nicht unterstützt.

In einer Lüfterkonfiguration kann der Benutzer einen Verbindungs-URI und einen HTTP-Endpunkt angeben, einschließlich Transport, Computername, Port und Anwendungsname. IIS gibt alle Anforderungen mit einem angegebenen Anwendungsnamen an die Anwendung weiter. Der Standardwert ist die WS-Verwaltung, die PowerShell hosten kann.

Sie können auch einen Authentifizierungsmechanismus angeben und die Umleitung von HTTP- und HTTPS-Endpunkten verhindern oder zulassen.

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-remoting-auf-einem-einzelnen-computer-testen--der-nicht-in-einer-dom-ne-ist-)Kann ich Remoting auf einem einzelnen Computer testen, der nicht in einer Domäne ist?

Ja. PowerShell-Remoting ist auch dann verfügbar, wenn sich der lokale Computer nicht in einer Domäne befindet. Sie können die Remotingfunktionen verwenden, um eine Verbindung mit Sitzungen herzustellen und Sitzungen auf demselben Computer zu erstellen. Die Funktionen funktionieren genauso wie beim Herstellen einer Verbindung mit einem Remotecomputer.

Um Remotebefehle auf einem Computer in einer Arbeitsgruppe auszuführen, ändern Sie die folgenden Windows auf dem Computer.

Vorsicht: Diese Einstellungen wirken sich auf alle Benutzer im System aus, und sie können das System anfälliger für einen böswilligen Angriff machen. Seien Sie vorsichtig, wenn Sie diese Änderungen vornehmen.

-   Windows Vista, Windows 7, Windows 8:
    
    Erstellen Sie den folgenden Registrierungseintrag, und legen Sie den Wert auf 1 fest: LocalAccountTokenFilterPolicy in `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System`
    
    Sie können den folgenden PowerShell-Befehl verwenden, um diesen Eintrag hinzuzufügen:
    
    ```powershell
    $parameters = @{
      Path='HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
      Name='LocalAccountTokenFilterPolicy'
      propertyType='DWord'
      Value=1
    }
    New-ItemProperty @parameters
    ```
    
-   Windows Server 2003, Windows Server 2008, Windows Server 2012, Windows Server 2012 R2:
    
    Es sind keine Änderungen erforderlich, da die Standardeinstellung der Richtlinie "Netzwerkzugriff: Freigabe- und Sicherheitsmodell für lokale Konten" auf "Klassisch" festgelegt ist. Überprüfen Sie die Einstellung, falls sie geändert wurde.
    

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#kann-ich-remotebefehle-auf-einem-computer-in-einer-anderen-dom-ne-ausf-hren-)Kann ich Remotebefehle auf einem Computer in einer anderen Domäne ausführen?

Ja. In der Regel werden die Befehle ohne Fehler ausgeführt, obwohl Sie möglicherweise den **Credential-Parameter** `Invoke-Command`der Cmdlets , `New-PSSession`oder `Enter-PSSession` verwenden müssen, um die Anmeldeinformationen eines Mitglieds der Gruppe Administratoren auf dem Remotecomputer anzugeben. Dies ist manchmal auch dann erforderlich, wenn der aktuelle Benutzer Mitglied der Gruppe Administratoren auf dem lokalen Computer und dem Remotecomputer ist.

Wenn sich der Remotecomputer jedoch nicht in einer Domäne befindet, der der lokale Computer vertraut, kann der Remotecomputer die Anmeldeinformationen des Benutzers möglicherweise nicht authentifizieren.

Verwenden Sie zum Aktivieren der Authentifizierung den folgenden Befehl, um den Remotecomputer der Liste der vertrauenswürdigen Hosts für den lokalen Computer in WinRM hinzuzufügen. Geben Sie den Befehl an der PowerShell-Eingabeaufforderung ein.

```powershell
Set-Item WSMan:\localhost\Client\TrustedHosts -Value <Remote-computer-name>
```

Um beispielsweise den Computer Server01 der Liste der vertrauenswürdigen Hosts auf dem lokalen Computer hinzuzufügen, geben Sie an der PowerShell-Eingabeaufforderung den folgenden Befehl ein:

```powershell
Set-Item WSMan:\localhost\Client\TrustedHosts -Value Server01
```

## [](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#unterst-tzt-powershell-remoting--ber-ssh-)Unterstützt PowerShell Remoting über SSH?

Ja. Weitere Informationen finden Sie unter [PowerShell-Remoting über SSH](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core).

___

## Empfohlener Inhalt

-   [
    
    ### Informationen zu Remoteanforderungen - PowerShell
    
    ](https://docs.microsoft.com/de-de/powershell/module/microsoft.powershell.core/about/about_remote_requirements)
    
    Beschreibt die Systemanforderungen und Konfigurationsanforderungen für die Ausführung von Remotebefehlen in PowerShell.
    

## Feedback

Feedback senden und anzeigen für
