# Funktionales PowerShell mit Klassen

## Ich verspreche, es ist kein Widerspruch

Die Paradigmen der objektorientierten Programmierung und der funktionalen Programmierung scheinen im Widerspruch zueinander zu stehen, aber sie sind in Wirklichkeit nur zwei von PowerShell unterstützte Sprachparadigmen. Praktisch alle Programmiersprachen, ob funktional oder nicht, verfügen über ein Mittel zur erweiterbaren Bindung von Namen an Werte; Klassen, wie `Structs` oder `Records`, sind nur eine Möglichkeit, dies zu tun. Solange wir unsere Verwendung von Klassen in erster Linie auf die Bindung von Namen und Werten beschränken und schwere objektorientierte Programmierkonzepte wie Vererbung, Polymorphie oder Veränderbarkeit vermeiden, können wir Klassen nutzen, ohne unseren Code zu verkomplizieren. Durch das Hinzufügen von Methoden zur unveränderlichen Typkonvertierung können wir unseren funktionalen Code mit Klassen aufwerten.

## Casting-Magie

Casting ist eine der leistungsfähigsten Funktionen in PowerShell. Wenn Sie einen Wert casten, können Sie abstrakten Initialisierungs- und Validierungscode in Ihrer Anwendung auslösen. Beispielsweise löst das Casting einer Zeichenfolge mit `[xml]` den Code zum Parsen der Zeichenfolge in einen vollständigen XML-Baum aus. Wir können Klassen nutzen, um die gleichen Funktionen in unserem eigenen Code zu implementieren.

## Casting von Hashtabellen

Wenn Sie keinen Konstruktor haben, können Sie Hash-Tabellen in Ihren Klassentyp umwandeln, ohne Ihre Klasse zu ändern. Achten Sie darauf, dass Sie [Validierungsattribute][1] hinzufügen, um dieses Muster vollständig zu nutzen. Wir können auch benutzerdefinierte Typen für den Typ unserer Klasseneigenschaften verwenden, um noch mehr Validierungs- und Initialisierungslogik auszulösen.

[1]: https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd

```powershell
class Cluster {
    [ValidatePattern("^[A-z]+$")]
    [string] $Service
    [ValidateSet("TEST", "STAGE", "CANARY", "PROD")]
    [string] $FlightingRing
    [ValidateSet("EastUS", "WestUS", "NorthEurope")]
    [string] $Region
    [ValidateRange(0, 255)]
    [int] $Index
}

[Cluster]@{
    Service       = "MyService"
    FlightingRing = "PROD"
    Region        = "EastUS"
    Index         = 2
}
```
