---
created: 2024-09-09T14:46:37 (UTC +02:00)
tags: []
source: https://petri.com/
author: 
---

# PowerShell-Klassen – Ihr ultimativer Leitfaden – Petri IT Knowledgebase

---
Mit PowerShell 5.0 wurde das Konzept eingeführt, Klassen direkt in PowerShell erstellen zu können. Vor Version 5.0 mussten Sie eine Klasse in C# definieren und kompilieren oder eine ziemlich komplizierte PowerShell verwenden, um eine Klasse zu erstellen.

PowerShell-Skriptersteller ohne Programmierkenntnisse fragen sich vielleicht, was es mit der ganzen Aufregung um Klassen auf sich hat. Sie denken sich vielleicht auch: „Na und?“ Vielleicht schreckt Sie der Einstieg in Klassen ab. Dieser Artikel soll Ihnen die Angst vor der Verwendung von Klassen in Ihrer PowerShell-Programmierung nehmen.

## **Was genau ist eine PowerShell-Klasse?**

Wikipedia sagt: „ [In der objektorientierten Programmierung ist eine Klasse eine erweiterbare Programmcode-Vorlage zum Erstellen von Objekten, zum Bereitstellen von Anfangswerten für Zustände (Membervariablen) und zum Implementieren von Verhalten (Memberfunktionen von Methoden)](https://en.wikipedia.org/wiki/Class_(computer_programming)) .“ Hä? Moment mal. Erstens ist eine **Klasse** eine Vorlage zum Erstellen von **Objekten** . Sie haben die ganze Zeit PowerShell zum Erstellen und Bearbeiten von Objekten verwendet. Zweitens stellt die Klassenvorlage Anfangswerte für ihre **Member** bereit . PowerShell-Objekte haben ebenfalls Member, Eigenschaften und Methoden, und Sie können Werte für die Eigenschaften bereitstellen. Und schließlich implementiert die Klasse Verhalten über **Methoden** . Das macht PowerShell auch!

## **Sie haben die ganze Zeit Klassen verwendet**

Denken Sie einen Moment darüber nach, was passiert, wenn ein PowerShell-Cmdlet ausgeführt wird. Wenn beispielsweise der Befehl „get-service“ ausgeführt wird, gibt er ein Objekt zurück. Indem wir „get-service“ ausführen und dann an „get-member“ weiterleiten, stellen wir fest, dass die Ausgabe von „get-service“ ein Objekt vom Typ „System.ServiceProcess.ServiceController“ ist. Eine schnelle MSDN-Suche zeigt, dass [„ServiceController“](https://msdn.microsoft.com/en-us/library/system.serviceprocess.servicecontroller(v=vs.110).aspx) eine .Net-Klasse ist. Ebenso geben viele PowerShell-Cmdlets eine Instanz einer Klasse zurück.

## **Funktionen, Klassen, was ist der Unterschied?**

Microsoft hat PowerShell für Windows-Administratoren entwickelt, um Verwaltungsaufgaben zu vereinfachen und zu automatisieren. Es sollte für jeden benutzerfreundlich sein, unabhängig von Programmierkenntnissen. Darüber hinaus vereinfacht es mit seiner leicht verständlichen Sprache den Übergang von der GUI zur Verwendung von Code. PowerShell-Kurse sind jedoch für Programmierer interessant, die bereits Erfahrung mit Klassen in anderen Sprachen haben. Das heißt, Microsoft erweitert die Zielgruppe von Entwicklern auf Administratoren. Für Administratoren, die PowerShell bereits verwenden, können Kurse ihnen den Übergang vom „Skripter/Administrator“ zum „Entwickler“ erleichtern, indem sie die Ähnlichkeiten zwischen beiden untersuchen und verstehen.

## **Wie beginne ich mit dem Aufbau einer Klasse?**

Ich werde mit dem Erstellen einer Beispielklasse namens „Rock“ beginnen. Denken Sie an einen Gegenstand, den Sie in Ihrem Garten oder auf der Straße finden. Wo soll ich anfangen? Erinnern Sie sich daran, wie Sie Ihre erste Funktion geschrieben haben? Sie haben einfach das Schlüsselwort Function {} verwendet und dann die Funktion von dort aus erstellt. Beim Erstellen einer Klasse wird einfach ein anderes Schlüsselwort verwendet, nämlich das Schlüsselwort Class {}.

## **Hinzufügen von Eigenschaften zu Ihrer Klasse**

 ![Steiniger Boden](https://petri.com/wp-content/uploads/petri-imported-images/Rocks.jpg)

Ich weiß nicht viel über Steine, also habe ich zunächst über ihre Eigenschaften nachgedacht. Steine können verschiedene Farben, Formen und Größen haben. Darüber hinaus habe ich Google verwendet, um mehr über die [Eigenschaften von Steinen](https://www.reference.com/science/five-properties-rocks-b95d53ee9301702c) herauszufinden . Ich habe Farbe, Glanz, Form, Textur und Muster aus der verlinkten Referenz aufgenommen. Ich habe auch Größe und Standort hinzugefügt, da ich weitere Informationen zu einem Stein haben möchte. Ich werde für den Typ jeder dieser Eigenschaften Zeichenfolgen verwenden, mit Ausnahme der Standorteigenschaft. Ich definiere die Standorteigenschaft als Ganzzahl, beispielsweise die Entfernung von der Person, die den Stein hält.

Klasse Rock {  
\[Zeichenfolge\]$Farbe  
\[Zeichenfolge\]$Glanz  
\[Zeichenfolge\]$Form  
\[Zeichenfolge\]$Textur  
\[Zeichenfolge\]$Muster  
\[Zeichenfolge\]$Größe  
\[int\]$Standort  
}

## **Klasseneigenschaften – ähnlich wie Funktionsparameter**

Für einen Programmiervergleich: Vielleicht erstellen Sie eine SMBShare-Klasse. Sie müssen nicht googeln oder Bing verwenden, um zu wissen, dass ein SMBShare einen Namen, einen Pfad und Berechtigungen hat. Wenn Sie eine Funktion zum Bearbeiten eines SMBShare-Objekts erstellen würden, wären dies die Parameter, die Sie definieren würden. Somit lassen sich **Eigenschaften** einer Klasse grob in **Parameter** einer Funktion übersetzen.

## **Große Worte kommen!**

In Programmierbüchern werden gerne große Worte verwendet, um zu erklären, wie man eine Klasse erstellt. Das erste Wort, das Sie oft sehen werden, ist **Instanziierung**  , aber lassen Sie uns dieses Wort genauer analysieren.  Instanziierung ist die Substantivform des Verbs „instanziieren“, was „eine Instanz von etwas erstellen“ bedeutet. Sie können sogar das Wurzelwort „Instanz“ sowohl in Instanziieren als auch in Instanziierung sehen. Um ein Objekt der Rock-Klasse zu instanziieren, erstelle ich lediglich eine Instanz eines Rocks.

## **Erstellen der Instanz des Objekts**

Es ist Zeit, ein Rock-Objekt zu instanziieren. Dazu muss ich das zweite große Wort einführen:  **Konstruktor** . Ein Konstruktor ist ein „ [spezieller Typ von Subroutine, die aufgerufen wird, um ein Objekt zu erstellen](https://en.wikipedia.org/wiki/Constructor_(object-oriented_programming)) “. Der Konstruktor hat denselben Namen wie die Klasse. Sie verwenden den Operator new(), um ein neues Rock-Objekt zu erstellen (oder zu instanziieren!). Programmtechnisch sieht es so aus:

$rock = \[rock\]::Neu()

Ich erstelle ein neues Objekt der Klasse \[rock\] und speichere es in der Variable $Rock. Von dort aus kann ich den Inhalt von $Rock anzeigen oder $Rock an get-member weiterleiten, um dessen Typ, Eigenschaften und Methoden zu überprüfen.  ![Klassen1](https://petri.com/wp-content/uploads/petri-imported-images/Classes1.png)

 ![Klassen2](https://petri.com/wp-content/uploads/petri-imported-images/Classes2.png)

## **Überwinden Sie Ihre Angst vor dem Unterricht**

Ich habe noch keinen Code geschrieben. Bisher habe ich nur entworfen, wie meine Rock-Klasse aussehen soll, welche Eigenschaften sie hat, und mithilfe des Konstruktors eine neue Instanz von Rock erstellt. Jetzt, da ich $Rock habe, weise ich jeder der Eigenschaften Werte zu, so wie ich es in jeder gewöhnlichen PowerShell-Funktion tun würde.   ![Klassen3](https://petri.com/wp-content/uploads/petri-imported-images/Classes3.png)Es gibt keine neuen, speziellen Wörter, um diese Aktion zu beschreiben. Ich weise den Eigenschaften einfach Werte zu, wie ich es beim Erstellen eines SMBShare oder beim Sammeln von Informationen mithilfe von WMI tun würde, und erstelle ein benutzerdefiniertes Objekt mit den gewünschten Eigenschaften. Und obwohl ich ein paar neue Programmierkonzepte eingeführt habe, gibt es nicht viele Unterschiede zwischen dem Erstellen eines Rocks aus einer Klassendefinition und dem Erstellen eines benutzerdefinierten Objekts. Ich hoffe, Sie werden sich selbst herausfordern und es ausprobieren.

Ich werde die Klasse „Rock“ erweitern, indem ich mithilfe eines Aufzählungstyps oder einfach Enumeration zulässige Werte für einige Eigenschaften definiere.

## **Die Rockklasse noch einmal besuchen**

Um es noch einmal zusammenzufassen: Die Definition der Rock-Klasse enthielt 7 Eigenschaften: Farbe, Glanz, Form, Textur, Muster, Größe und Standort. Die ersten 6 Eigenschaften waren Zeichenfolgeneigenschaften und der Standort war eine Ganzzahl oder eine Entfernung zwischen einem beliebigen Punkt und dem Felsen selbst.

Klasse Rock {  
\[Zeichenfolge\]$Farbe  
\[Zeichenfolge\]$Glanz  
\[Zeichenfolge\]$Form  
\[Zeichenfolge\]$Textur  
\[Zeichenfolge\]$Muster  
\[Zeichenfolge\]$Größe  
\[int\]$Standort  
}

Darüber hinaus habe ich auch den New()-Konstruktor verwendet, um eine Instanz des Felsens zu erstellen, und nachdem ich eine Instanz des Felsens definiert hatte ($Rock), konnte ich ihr Eigenschaften zuweisen.

$Rock = \[rock\]::Neu()  
$Rock.Color = Silber  
$Rock.Size = RIESIG

## **Begrenzen zulässiger Werte mithilfe einer Aufzählung**

Die Verwendung von Zeichenfolgentypen für die Steineigenschaften ermöglicht eine endlose Kombination möglicher Eigenschaftswerte. Ich könnte beispielsweise die Größe eines Steins als „RIESIG“ (wie im obigen Beispiel) oder als „SehrSehrGroß“ definieren. Umgekehrt könnte ich ihn als „winzig klein“ oder „krümelgroß“ definieren. In diesem Fall möchte ich die möglichen Werte für die Größe auf die Größen beschränken, die ich definiert habe, wie etwa die Hemdgrößen klein, mittel und groß. Um dies zu erreichen, kann ich einen Aufzählungstyp (auch Enumeration genannt) oder  [einen Satz benannter Werte](https://en.wikipedia.org/wiki/Enumerated_type) verwenden  , um diese möglichen Werte zu definieren. Beachten Sie, dass der Ausdruck „Aufzählungstyp“ lautet. Ich definiere einen benutzerdefinierten Typ namens „Größe“.

enum Größe {  
Klein  
Mittel  
Groß  
}

## **Codeplatzierung für Enums**

Platzieren Sie beim Schreiben des Codes die Enumerationsdefinition außerhalb der Klassendefinition oder in einer eigenen Datei. Ich habe diese Size-Enumeration in einer Datei namens C:PowerShellSizeEnum.ps1 platziert. Auf diese Weise kann ich die Enumeration als Dot-Source verwenden. Warum sollte ich das tun wollen? Wenn ich die Enumeration in einer eigenen Datei platziere, kann ich sie als Dot-Source für jede Klasse oder Funktion verwenden. Das ist richtig, Enumerationen sind nicht nur für PowerShell-Klassen. Ich kann sie auch verwenden, um benutzerdefinierte Typen für Funktionen zu definieren, wie in der folgenden Funktion gezeigt.

Funktion CasinoGewinne {  
Param (  
\[int\]$Amt  
)

. 'C:\\PowerShell\\SizeEnum.ps1'

wenn ($Amt -lt 500) {  
$Result = \[Größe\]::Klein  
}  
sonstwenn (($Amt -ge 500) -und ($Amt -lt 1000)) {  
$Result = \[Größe\]::Mittel  
}  
sonst {  
$Result = \[Größe\]::Groß  
}  
Schreibe-Ausgabe $Result  
}

## **PowerShell-Deathmatch: Enums vs. ValidateSet**

ValidateSet ist ein unglaublich nützliches Parametervalidierungsattribut, das in erweiterten Funktionen verwendet wird, um die möglichen Eingabewerte für einen bestimmten Parameter einzuschränken. Im Vergleich zu einer Aufzählung definiert ValidateSet keinen benutzerdefinierten Typ. Es begrenzt nur die möglichen Werte eines Parameters. Der Vorteil der Verwendung von ValidateSet besteht daher darin, dass man die Methoden des definierten Parametertyps verwenden kann. Beispielsweise ermöglicht mir ein Zeichenfolgentyp mit einem ValidateSet, die Zeichenfolgenwerte mithilfe von Zeichenfolgenmethoden zu bearbeiten. Der Nachteil von ValidateSet besteht jedoch darin, dass das Set jedes Mal neu definiert werden muss, wenn man es verwenden möchte.

## **Ein Grund für die Verwendung von ValidateSet**

Betrachten Sie die folgende Funktion: Sie enthält einen Parameter namens Size und verwendet ValidateSet. Beachten Sie jedoch, dass der Parametertyp immer noch \[Zeichenfolge\] ist. In diesem einfachen Beispiel nehme ich den Parameter Size und gebe das 1. <sup><span><span>Zeichen</span></span></sup> als Ausgabe zurück.

Funktion CasinoTaxes {  
Param (  
\[Parameter(Pflichtfeld=$True)\]  
\[ValidateSet(„Klein“,”Mittel“,”Groß“)\]  
\[Zeichenfolge\]$Steuergröße  
)

Schreib-Ausgabe $Size\[0\]  
}

 ![KlassenPt2 1](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt2_1.png)

Dieselbe Funktion würde mit der Size-Aufzählung nicht funktionieren:

Funktion CasinoTaxes {  
Param (  
\[Parameter(Pflichtfeld=$True)\]  
\[Größe\]$CurrentTaxSize  
)

Schreib-Ausgabe $CurrentTaxSize\[0\]  
}

 ![KlassenPt2 2](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt2_2.png)

## **Enumerationen sind für benutzerdefinierte Typen sinnvoll**

ValidateSet ist in der oben beschriebenen Situation sinnvoll, wenn auf die Methoden des zugrunde liegenden Typs zugegriffen werden muss. Wenn Sie Zeichenfolgenmanipulationen an den Werten vornehmen möchten, ist es sinnvoll, die Parameter als Zeichenfolgen beizubehalten.

Ich bevorzuge ValidateSet für Funktionen. Dies ist zusammen mit allen anderen Validate\*-Parameterattributen in der PowerShell-Hilfe unter about\_Functions\_advanced\_parameters aufgeführt. In der Hilfedatei about\_Classes wird jedoch ausdrücklich darauf hingewiesen, dass die PowerShell-Sprache Unterstützung für Klassen und andere benutzerdefinierte Typen hinzufügt.

Dies ist hier der Schlüssel und der Grund, warum ich ein Enumerationselement einem ValidateSet vorziehen würde. Dies ist der beste Weg, wenn ich möchte, dass die Eigenschaft oder der Parameter von einem benutzerdefinierten Typ ist und auf bestimmte Werte beschränkt ist.

## **Enumerationen und Wiederverwendung**

Fazit: Verwenden Sie Aufzählungstypen nach Möglichkeit wieder, um den Code und die Parameterdeklarationen zu vereinfachen. Da die Aufzählung für die Dauer der Sitzung gültig ist, können Klassen oder Funktionen, die zusammengehören und dieselben oder ähnliche Parameter verwenden, alle dieselbe Aufzählungsdefinition verwenden. Dies gilt unabhängig davon, ob es sich am Anfang des Klassenmoduls, in einem Modul mit Funktionen oder in einer eigenen Datei befindet und per Dot-Source in das Modul mit dem Code eingebunden wird. Vereinfachen Sie schließlich den Code mithilfe einer Aufzählung, anstatt mehrere ValidateSets deklarieren zu müssen.

## **Instanziieren Sie den Rock**

Nein, nicht „ [The Rock](https://en.wikipedia.org/wiki/Dwayne_Johnson) “. Zuerst werde ich mithilfe der obigen Rock-Klassendefinition eine Instanz eines Felsens instanziieren oder erstellen. Dann werde ich dem Felsen einige Eigenschaften zuweisen.

 ![KlassenPt3 1](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt3_1.png)

## **Rock-Klasse-Methoden**

Als Nächstes werde ich einige Methoden für die Klasse definieren. Eine Methode ist eine Aktion, die an einem Objekt ausgeführt wird. Ich habe mich gefragt: „Was kann ich mit einem Stein machen? Oder was kann ich mit einem Stein machen?“ Und die Antworten, die mir in den Sinn kamen, sind „Stein werfen“ und „Stein zerschmettern“. Ich werde Methoden definieren, die diese beiden Aktionen ausführen. Ich werde auch eine Methode namens „Steinstandort anzeigen“ definieren. Ich werde die Eigenschaft „Standort“, die ein ganzzahliger Wert ist, verwenden, um grafisch anzuzeigen, wie „weit“ der Stein von einem festen Punkt entfernt ist. (In diesem Fall ist es die Cursorposition auf dem Bildschirm.) Wenn ich die Methode „Stein werfen“ aufrufe, kann ich visuell anzeigen, wie weit ich den Stein geworfen habe.

## **Definieren der Methode**

Eine Klassenmethode lässt sich genauso einfach definieren wie eine PowerShell-Funktion. Es gibt jedoch einen großen Unterschied. Ich muss herausfinden, ob die Methode einen Wert zurückgeben soll, und den Typ des zurückgegebenen Werts in der Methodendefinition angeben. Wenn eine Methode keinen Wert zurückgeben soll, ist der Typ des Rückgabewerts \[void\]. Beginnend mit der Methode „ShowRockLocation“ sieht die Methodendefinition folgendermaßen aus:

\[void\]ShowRockLocation () {  
}

Von dort verwende ich einfach PowerShell, um den Code hinzuzufügen, der mir einen Standort grafisch anzeigt:

\[void\]ShowRockLocation () {  
$Filler = ' '  
für ($i=0;$i -lt $This.Location;$i++) {  
$filler += ' '  
}  
Schreibhost „$($Filler)\*“  
}

Beachten Sie, dass ich in der „for“-Schleife die Variable $This verwende. Wenn ich die Methode ShowRockLocation aufrufe, rufe ich sie für die Instanz von Rock auf, die ich zuvor erstellt habe ($Rock). $This ist eine spezielle Variable, die „Diese Instanz der Rock-Klasse“ bedeutet. Um den Standort anzuzeigen, füge ich für jede Einheit der Standorteigenschaft des Felsens ein Leerzeichen (Füller) hinzu und zeige den Felsen dann grafisch mit einem Sternchen an.

## **Aufrufen der Methode „ShowRockLocation“**

Um die Methode ShowRockLocation aufzurufen, nehme ich meine Instanz von Rock ($Rock) und rufe die Methode ShowRockLocation wie unten gezeigt auf. Ich sehe das Sternchen, das den Standort des Felsens darstellt.

 ![KlassenPt3 2](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt3_2.png)

## **Erstellen und Aufrufen einer Methode mit einem Argument**

Als nächstes möchte ich die ThrowRock-Methode erstellen. ThrowRock nimmt ein Argument an, beispielsweise die Distanz, über die der Stein geworfen werden soll, und zwar in einem Integer-Typ. Die Variable $arg stellt die Distanz dar.

\[ void \] WurfStein ( \[ int \] $arg ) {

$Dieser . Standort += $arg

}

Nachdem ich die Methode definiert habe, rufe ich ThrowRock mit demselben Aufruf wie ShowRockLocation auf, gebe aber das Argument für die Entfernung an. Als Nächstes rufe ich ShowRockLocation auf, um zu sehen, dass sich der Standort geändert hat, und tatsächlich hat sich das Sternchen verschoben, vermutlich um 28 Stellen.

 ![KlassenPt3 3](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt3_3.png)

## **Methode und Enumerationen**

Zuletzt werde ich die SmashRock-Methode erstellen. Wenn ich auf die Klassendefinition zurückblicke, habe ich eine Enumerationsdefinition für die Size-Eigenschaft verwendet, um die Werte von Size auf die Größen zu beschränken, die ich für diese Methode haben möchte. Wenn die SmashRock-Methode für eine Instanz eines großen Steins aufgerufen wird, ändert die Methode ihn in mittelgroß. Wenn ich SmashRock für einen mittelgroßen Stein aufrufe, ändert er sich in klein. Wenn ich SmashRock für einen kleinen Stein aufrufe, schreibe ich einfach eine Meldung auf den Bildschirm, dass der Stein bereits klein ist.

\[void\]SmashRock () {  
if ($This.Size -eq „Groß“) {  
$This.Size = „Mittel“  
}  
elseif ($This.Size -eq „Mittel“) {  
$This.Size = „Klein“  
}  
else {  
write-host „Der Stein ist bereits zu klein, um ihn zu zerschlagen.“  
}  
}

$rock = \[rock\]::New()  
$Rock.Color = „Rot“  
$Rock.Location = 28  
$Rock.Size = „Groß“  
$Rock.Luster = „Wachsartig“

 ![KlassenPt3 4](https://petri.com/wp-content/uploads/petri-imported-images/ClassesPt3_4.png)

##  **Ein letztes Wort zur Aufzählung**

Beachten Sie abschließend, dass ich die SmashRock-Methode nicht hätte schreiben können, ohne entweder ein Enum oder ein ValidateSet zu verwenden. In diesem Fall gäbe es keine Möglichkeit, die unendlichen Variationen eines Zeichenfolgenwerts für Size zu berücksichtigen. Wenn ich mich für die Verwendung einer Zeichenfolge entschieden und dann beschlossen hätte, diese Methode zu schreiben, könnte ich immer zurückgehen und die Size-Eigenschaft neu definieren, um ein Enum anstelle eines Zeichenfolgenwerts zu verwenden.

## **Zusammenfassung der Methode**

Zusammenfassend lässt sich sagen, dass Methoden eine Aktion für eine Instanz eines Klassenobjekts ausführen. Sie akzeptieren ein oder mehrere Argumente und können einen Wert als Ausgabe zurückgeben. Methoden führen eine Aktion für die aktuelle Instanz des Objekts mithilfe der Variable $This aus. Schließlich ähnelt es der PowerShell-Funktion, da eine Funktion bestimmte Eingaben (Parameter) entgegennimmt und eine Ausgabe zurückgeben kann, aber für den Aufruf einer Funktion weder eine Instanz einer Klasse noch ein Objekt benötigt.

Nachdem Sie nun mit PowerShell-Klassen sowie deren Programmierkonzepten und -terminologie vertraut sind, ist es an der Zeit, Ihnen einige weitere Vorteile der Verwendung von PowerShell-Klassen aufzuzeigen. In diesem Artikel werde ich über Konstruktoren sprechen und wie Sie verschiedene Konstruktoren verwenden können, um Instanzen von Klassen mit unterschiedlichen Mitgliedern zu erstellen. Ich werde außerdem ein weiteres neues Konzept für Klassen namens Vererbung vorstellen und einige praktische Beispiele zeigen.

## Standardkonstruktoren

In den vorherigen Artikeln habe ich bereits gezeigt, wie man den Standardkonstruktor verwendet, um eine Instanz einer Klasse zu erstellen. Aber was bedeutet „Konstruktor“? Ein Konstruktor ist eine Methode mit dem gleichen Namen wie die Klasse. Wenn innerhalb der Klasse keine Konstruktoren angegeben sind, erhält sie automatisch einen Standardkonstruktor ohne Parameter, mit dem ich eine Instanz einer Klasse erstellen kann, wie im vorherigen Artikel gezeigt.

Ich habe beispielsweise eine Instanz eines Felsens wie folgt erstellt:

 ![KlassenPt4 1](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_1.png)

Dadurch wird eine Instanz eines Steins erstellt. Ich verwende den Standardkonstruktor, da ich in meiner Klasse noch keine Konstruktoren definiert habe. Die Instanziierung erfolgt, wenn ich die Methode new() ohne Parameter aufrufe und eine Instanz eines Steins mit nicht zugewiesenen oder Standardeigenschaften erhalte.

 ![KlassenPt4 2](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_2.png)

## Überladen von Konstruktoren

Ich kann eine Überladung für den Konstruktor erstellen. Die Überladung ermöglicht es mir, Standardwerte für Eigenschaften direkt in der neuen Methode selbst festzulegen. Dies erspart mir eine oder mehrere Codezeilen beim späteren Zuweisen von Eigenschaften. Wenn ich den Konstruktor auch weiterhin ohne Parameter verwenden möchte, muss ich ihn explizit in der Klasse definieren.

Felsen(){}

Im nächsten Beispiel erstelle ich eine Überladung für einen Konstruktor der Rock-Klasse, der einen Parameter hat: Size.

Rock(\[Größe\]$Größe){  
$this.Größe = $größe  
}

Was genau bedeutet das? Es bedeutet, dass wenn ich eine Klasse von Rock mit einem Parameter instanziiere, dieser Parameter der Parameter Size sein muss, dann muss er vom Typ Size sein. Eine erfolgreiche Instanziierung sieht so aus:

 ![KlassenPt4 3](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_3.png)  
Was passiert, wenn ich versuche, einen anderen Parameter anzugeben, beispielsweise eine Farbe? Wenn ich das tue, erhalte ich eine Fehlermeldung, dass der String nicht in der Enumeration „Größe“ enthalten ist. Dies ist ein weiteres gutes Argument für die Verwendung von Enumerationen! Wenn ich einen String-Typ für Größe verwendet hätte, wäre „Rot“ akzeptabel gewesen.

 ![KlassenPt4 4](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_4.png)

## **Hinzufügen zusätzlicher Überladungen**

Was passiert umgekehrt, wenn ich sowohl Größe als auch Farbe zuweisen möchte? Mit den aktuell von mir definierten Konstruktoren würde ich beim Versuch, diese Instanz zu erstellen, ebenfalls einen Fehler erhalten. Beachten Sie, dass es sich um einen Fehler bezüglich der Überladung selbst handelt. In diesem Fall wird nach einer Überladung gesucht, die zwei Argumente akzeptiert. Ich habe jedoch noch keine erstellt, die zwei Argumente akzeptiert.   ![KlassenPt4 5](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_5.png)Hier ist der Konstruktor für eine Rock-Klasse, die zwei Argumente akzeptiert:

Rock(\[Größe\]$Größe,\[Zeichenfolge\]$Farbe){  
$Diese.Größe = $Größe  
$Diese.Farbe = $Farbe  
}

Jetzt kann ich Instanzen von Rocks mit null, einem oder zwei Parametern erstellen:

 ![KlassenPt4 6](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_6.png)  
Bei der Überladung mit 2 Parametern müssen die Parameter jedoch in genau dieser Reihenfolge definiert werden – zuerst Größe, dann Farbe. Wenn man sie umkehrt, versucht PowerShell, Größe „Rot“ zuzuweisen, und ich erhalte denselben Fehler wie in einem der vorherigen Beispiele.

 ![KlassenPt4 7](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_7.png)

## Was ist Vererbung?

Klassen in PowerShell können, genau wie in anderen objektorientierten Programmiersprachen, hierarchisch sein. Das bedeutet, dass ich eine Unterklasse aus einer übergeordneten Klasse erstellen und der Unterklasse erlauben kann, die Eigenschaften und Mitglieder der übergeordneten Klasse zu erben. Wenn ich beispielsweise eine übergeordnete Klasse mit dem Namen „ConstructionMaterials“ hätte, würde diese Klasse einige Eigenschaften enthalten, wahrscheinlich einige der gleichen Eigenschaften wie die Rock-Klasse.

Ein Stein ist ein bestimmter Typ von Baumaterial und erbt daher die Eigenschaften von der Klasse ConstructionMaterials. Er kann aber auch eigene Eigenschaften haben. Ebenso könnte ich andere Unterklassen von ConstructionMaterials erstellen, wie etwa Brick und Wood. Im folgenden Beispiel habe ich die Klasse Rock genommen und eine Klasse ConstructionMaterials erstellt, wobei ich die Eigenschaften minimiert habe.

Aufzählungsgröße {

Klein

Medium

Groß

}

Klasse Konstruktionsmaterial {

    \[ Zeichenfolge \] $Color

    \[ Zeichenfolge \] $Shape

    \[ Größe \] $Größe

    \[ int \] $Standort

    \[ void \] Standort anzeigen ( ) {

         $Füller \= ' '

         für ( $i \= 0 ; $i \-lt $Dieser . Standort ; $i ++ ) {

              $Füller += ' '

              }

         Schreib-Host „$($Filler)\*“

         }

    \[ void \] Wirf es ( \[ int \] $arg ) {

         $Dieser . Standort += $arg

         }

    \[ Leere \] SmashIt ( ) {

         wenn ( $This . Größe \-eq „Groß“ ) {

              $Dies . Größe \= „Mittel“

         }

         elseif ( $This . Größe \-eq „Mittel“ ) {

              $Dies . Größe \= „Klein“

              }

         }

   }

Anschließend erstelle ich eine Rock-Klasse, die eine Unterklasse von ConstructionMaterial ist, mit der folgenden Syntax:

<em>Klasse</em> Unterklassenname : Basisklassenname{}

Zuletzt werde ich überprüfen, ob die Klasse Rock eine Unterklasse von ConstructionMaterial ist.

 ![KlassenPt4 8](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_8.png)

## Hinzufügen zusätzlicher Eigenschaften zu einer Unterklasse

Vielleicht möchte ich, dass die Rock-Unterklasse auch die Eigenschaften „Luster“, „Texture“ und „Pattern“ hat, die ich in der ursprünglichen Rock-Klasse definiert habe. Um das zu erreichen, müssen wir die Enumeration für die Werte für „Luster“ in den Speicher laden, indem wir sie entweder per Dot-Sourcing abrufen oder direkt zur Klassendatei hinzufügen. Als Nächstes erstellen wir eine neue Rock-Klasse, die die zusätzlichen Eigenschaften enthält.

Klasse Rock : Konstruktionsmaterial {  
\[Zeichenfolge\]$Textur  
\[Zeichenfolge\]$Muster  
\[Glanz\]$Glanz  
}

Wenn ich eine Instanz eines Steins erstelle, enthält sie die Eigenschaften der Basisklasse (Farbe, Form, Größe und Position). Darüber hinaus enthält sie auch die steinspezifischen Eigenschaften (Textur, Glanz und Muster).

 ![KlassenPt4 9 1](https://petri.com/wp-content/uploads/petri-imported-images/classesPt4_9-1.png)

## Übung macht den Meister (Sinn)

Ich habe gezeigt, wie man den Standardkonstruktor verwendet, um eine Instanz einer Klasse zu erstellen, ohne in der Klasse selbst etwas Spezielles zu definieren. Ich habe auch gezeigt, wie man Konstruktorüberladungen hinzufügt, um Werte innerhalb der Instanz der Klasse explizit zu definieren. Darüber hinaus habe ich über Vererbung gesprochen und wie man Basisklassen und Unterklassen erstellt.

Jetzt sind Sie an der Reihe. Suchen Sie nach Möglichkeiten, wie Sie Klassen in Ihre alltägliche Programmierung integrieren können. Oder vielleicht möchten Sie einfach nur zum Spaß mit dem Erstellen einer Klasse herumspielen und Ihr Wissen weiter ausbauen. In jedem Fall ist es eine großartige Möglichkeit, sich mit den Programmierkonzepten von Klassen vertraut zu machen, die auch auf andere objektorientierte Sprachen übertragbar sind.

## **Überarbeitung der Klassendefinition für ConstructionMaterial**

Zur schnellen Wiederholung: Die Klasse ConstructionMaterial hat 4 Eigenschaften: Farbe, Form, Größe und Position. Der Datentyp von Size ist eine Aufzählung, die nur die Werte Small, Medium oder Large haben kann. Für dieses Beispiel definiere ich keine speziellen Konstruktoren. Mein Beispielobjekt vom Typ ConstructionMaterial heißt $ClassObj.

Aufzählungsgröße {

Klein

Medium

Groß

}

Klasse Konstruktionsmaterial {

\[ Zeichenfolge \] $Color

\[ Zeichenfolge \] $Shape

\[ Größe \] $Größe

\[ int \] $Standort

}

 ![KlassenPt5 1](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_1.png)

## **Verwenden einer Hash-Tabelle zum Definieren benutzerdefinierter Objekteigenschaften**

Um eine Instanz eines Klassenobjekts mit einem benutzerdefinierten Objekt zu vergleichen, beginne ich mit der Erstellung des benutzerdefinierten Objekts „New-Object“ und eines Typs „PsObject“ und definiere die gewünschten Eigenschaften in einer Hash-Tabelle.

$props \= @ {

Farbe \= „Rot“

Form \= „Rund“

Größe \= „Groß“

Standort \= 4

}

$Obj \= Neues Objekt \-Typname psobject \-Eigenschaft $Props

 ![KlassenPt5 2](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_2.png)

Beachten Sie, dass ich in diesem Code die Struktur des benutzerdefinierten Objekts mit den 4 Eigenschaften Farbe, Form, Größe und Position definiere, aber auch das Objekt selbst ($obj) erstelle. Die Verwendung von new-object erstellt und instanziiert das Objekt auf einmal. Ich erstelle nicht die Struktur eines Objekts und instanziiere es später.

Mithilfe der $props-Hash-Tabelle kann ich $props verwenden, um zusätzliche Objekte zu definieren, die dieselbe Struktur wie $obj haben. Der Unterschied zwischen der Definition des benutzerdefinierten Objekts mit new-object und der Verwendung der Klasse besteht darin, dass die Klasse einen zweistufigen Prozess erfordert (Definition der Klasse und Instanziierung) und die Verwendung von new-object ein einzelner Schritt ist.

## **Definieren benutzerdefinierter Objekteigenschaften mit Add-Member**

Wenn ich einfach das benutzerdefinierte Objekt ohne Eigenschaften erstelle, anstatt die Hash-Tabelle zu verwenden, bin ich immer noch nur auf halbem Weg, da ich ein Objekt ohne Eigenschaften habe. Wenn ich nach der Instanziierung „add-member“ verwende, muss ich immer noch nicht nur die Eigenschaftsnamen angeben, sondern auch einen Wert für jede der Eigenschaften. Wenn ich jedoch ein zweites benutzerdefiniertes Objekt erstelle, gibt es keine Garantie, dass es dieselben Eigenschaften wie das erste Objekt hat, da es wirklich ein benutzerdefiniertes Objekt ohne definierte Struktur ist. Die Eigenschaften jedes benutzerdefinierten Objekts können beliebig sein. Unten erstelle ich beispielsweise ein benutzerdefiniertes Objekt $obj mit meinen gewünschten Eigenschaften für ein Objekt, das ConstructionMaterial definiert.

$Obj | Add-Member -MemberType NoteProperty Farbe -Wert „Rot“ $Obj | Add-Member -MemberType NoteProperty Form -Wert „Quadrat“ $Obj | Add-Member -MemberType NoteProperty Größe -Wert „Groß“ $Obj | Add-Member -MemberType NoteProperty Standort -Wert „4“

Jetzt definiere ich ein zweites benutzerdefiniertes Objekt und dieses Objekt hat nur eine Eigenschaft. Anstatt die Eigenschaft Size zu verwenden, habe ich die Eigenschaft Bigness definiert, die ebenfalls groß ist. Obwohl $obj und $CM beide benutzerdefinierte Objekte sind, hat nur eines davon die Struktur, die ich für das Baumaterial haben möchte.

 ![KlassenPt5 3](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_3.png)

## **Ein zweiter Blick auf die ThrowIt-Methode**

In der Klasse ConstructionMaterial habe ich eine Methode namens ThrowIt() definiert, die den Wert von Location um einen durch ein ganzzahliges Eingabeargument angegebenen Betrag erhöht. Da dies eine Methode der Klasse ConstructionMaterial ist, muss ich das Objekt $ClassObj nicht übergeben. Stattdessen manipuliere ich das Objekt und seine Eigenschaften über $This.

\[ void \] Wirf es ( \[ int \] $arg ) {

$Dieser . Standort += $arg

}

## **ThrowIt als Funktion schreiben**

Sie haben oben gesehen, dass es bei der Definition des benutzerdefinierten Objekts $CM 4 Methoden gab – Equals, GetHashCode, GetType und ToString, aber keine ThrowIt-Methode. Ich kann keine ThrowIt-Methode verwenden, aber ich kann eine ThrowIt-Funktion definieren. Ich beginne mit der ThrowIt-Funktionsdeklaration und einem Eingabeparameter $arg vom Typ int, der die Wurfdistanz angibt, genau wie bei der ThrowIt()-Methode. Aber warten Sie mal … ich habe nicht das Originalobjekt! Ich muss entweder das Objekt selbst übergeben oder die Location-Eigenschaft des Objekts übergeben, um den Anfangswert des Standorts zu kennen. Ich werde das gesamte benutzerdefinierte Objekt übergeben.

Funktion ThrowIt {

    Parameter (

    \[ psobject \] $InitialObj ,

    \[ int \] $arg

    )

$Ergebnis \= $Initialobj . Standort \+ $arg

Schreibe-Ausgabe $Result

}

Dann rufe ich die ThrowIt-Funktion auf, übergebe $obj (das gesamte Objekt) als $InitialObj und erhöhe den Standort um 8. Ich gehe davon aus, dass $obj.location jetzt 12 ist, aber wie ich aus den Ergebnissen unten erkenne, hat die Funktion 48 zurückgegeben. Warum? Nun, die Funktion wusste nicht, dass sie $InitialObj.Location als Ganzzahl behandeln sollte, und behandelte stattdessen die 4 als Zeichenfolge und verkettete 8 daran.

   ![KlassenPt5 4](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_4.png)

Um dies zu korrigieren, muss ich $Initialobj.location in der Funktion stark als Ganzzahl eingeben.

$Ergebnis = \[int\]$Initialobj.Location + $arg

## **ThrowIt und das benutzerdefinierte Objekt $CM**

Als Nächstes werde ich mein benutzerdefiniertes $CM-Objekt nehmen und versuchen, es als Eingabe für ThrowIt zu verwenden. Denken Sie daran, dass $CM derzeit nur eine Eigenschaft hat: Bigness. Was erwarten Sie, was passieren wird? Zunächst erwarte ich, dass ich einen Fehler erhalte, wenn ich versuche, $CM.location gleich dem von ThrowIt ausgegebenen Ergebnis zu setzen, da es für das $CM-Objekt keine Location-Eigenschaft gibt.

 ![KlassenPt5 5](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_5.png)

Ich muss eine Standorteigenschaft für dieses benutzerdefinierte Objekt definieren. Nehmen wir an, ich definiere $CM.Location als Zeichenfolge mit dem Wert „Wrong“ statt als Ganzzahl. Da $CM ein PS-Objekt ist, ist der Wert „Wrong“ für diese Eigenschaft vollkommen akzeptabel. Was passiert jedoch, wenn wir versuchen, die Funktion „ThrowIt“ aufzurufen? Meine nächste Erwartung ist, dass ThrowIt einen Fehler ausgibt, der besagt, dass „Wrong“ nicht in eine Ganzzahl umgewandelt werden kann.

 ![KlassenPt5 6](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_6.png)  
 ![KlassenPt5 7](https://petri.com/wp-content/uploads/petri-imported-images/classesPt5_7.png)

## **Es gibt keinen „besseren“ Ansatz**

Mit diesen Beispielen möchte ich nicht feststellen, ob ein Ansatz richtig oder ein anderer falsch ist, sondern vielmehr die Unterschiede zwischen beiden aufzeigen. Benutzerdefinierte Objekte eignen sich hervorragend, um einmalige, eindeutige Informationen in einem Objekt zusammenzufassen, und es gibt sicherlich Verwendungsmöglichkeiten dafür.

Die Cmdlets Get-WMIobject oder get-CimInstance sammeln Unmengen an benutzerdefinierten Informationen über einen Computer, die dann in einmalige benutzerdefinierte Objekte aufgeteilt und für die weitere Verarbeitung oder Berichterstellung verwendet werden können. Der Schlüssel liegt in der Benutzerfreundlichkeit.

Wenn Sie wirklich etwas Benutzerdefiniert definieren, bedeutet dies, dass keine definierte Struktur vorhanden ist. Klassen bieten Struktur und diese Struktur ist nützlich, um die Methoden zu definieren, die auf diese starre Struktur angewendet werden können. Beide Ansätze funktionieren, aber meiner Meinung nach sind Klassen für starre Strukturen und benutzerdefinierte Objekte für fließende Strukturen gedacht.
