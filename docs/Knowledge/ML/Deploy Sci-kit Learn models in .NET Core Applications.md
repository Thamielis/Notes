Stellen Sie Sci-kit Learn-Modelle in .NET Core-Anwendungen bereit
-----------------------------------------------------------------

Verwenden Sie ONNX und die ONNX Runtime, um ein einzelnes Modell über Programmiersprachen und Technologie-Stacks hinweg gemeinsam zu nutzen.
--------------------------------------------------------------------------------------------------------------------------------------------

[

![[images/15dPphXCv65x8mIkpyApu1Q.jpeg]]



](https://gnovack.medium.com/?source=post_page-----90e24e572f64--------------------------------)[

![[images/1CJe3891yB1A1mzMdqemkdg.jpeg]]



](https://towardsdatascience.com/?source=post_page-----90e24e572f64--------------------------------)

6 Min. gelesen

4\. Juli 2020

Ein häufiges Problem für Unternehmen, die ML-Modelle für die Produktion bereitstellen möchten, ist die Diskrepanz zwischen den von Datenwissenschaftlern verwendeten Tools und Technologien und denen von Anwendungsentwicklern. Datenwissenschaftler werden höchstwahrscheinlich in Python arbeiten und Frameworks für maschinelles Lernen wie Sci-kit Learn, Tensorflow oder PyTorch verwenden, um ihre Modelle zu erstellen und zu trainieren, während Anwendungsentwickler häufig Programmiersprachen wie Java, C# oder JavaScript verwenden, um Unternehmensanwendungen zu erstellen. Nutzung beliebter Webanwendungs-Frameworks wie Spring oder ASP.NET Core.

Es gibt viele Möglichkeiten, diese Lücke zu schließen. Einige der gängigsten Ansätze sind:

1.  Lassen Sie den Data Scientist die trainierten Parameter des Modells an den Anwendungsentwickler senden, der das Modell dann in der Sprache der Webanwendung, in der das Modell verwendet werden soll, neu schreiben muss.
2.  Entwickeln Sie eine separate Suite von Webanwendungen, um die bereitgestellten Modelle mithilfe eines Python-Webframeworks wie Flask oder Django zu hosten.

Keines davon ist ideal. Beim ersten Ansatz führt der Schritt des manuellen Umschreibens zu langsameren Zykluszeiten, Duplizierung der Logik und einer erhöhten Wahrscheinlichkeit menschlicher Fehler. Der zweite Ansatz ist zwar ansprechender als der erste, aber immer noch nicht besonders gut, da er die Möglichkeit einschränkt, Entwicklungsmuster, Bibliotheken und Kernlogik (wie Sicherheit, Protokollierung oder gemeinsame Integrationslogik) über alle Anwendungen hinweg gemeinsam zu nutzen.

In diesem Artikel sehen wir uns eine bessere Möglichkeit an, die Technologielücke zwischen Datenwissenschaftlern und App-Entwicklern mithilfe des ONNX-Modellformats und der ONNX-Runtime zu schließen. Konkret zeigen wir, wie Sie mit Sci-kit Learn ein Modell erstellen und trainieren und dann dasselbe Modell verwenden können, um Echtzeit-Inferenz in einer .NET Core-Web-API durchzuführen.

![[images/1AI7MPXGSbjjIkDJ0Sp4nAw.png]]

Integration des ML-Modells und der Lebenszyklen der Anwendungsentwicklung. (Bild vom Autor)

Was ist ONNX?
-------------

Open Neural Network Exchange (ONNX) ist ein offenes ML-Modellformat, ähnlich dem Pickle-Format, das häufig zum Speichern und Laden von Sci-kit Learn-Modellen verwendet wird, oder dem SavedModel-Format für Tensorflow-Modelle. ONNX ist jedoch Framework-agnostisch, was bedeutet, dass Sie Modelle im ONNX-Format aus nahezu jedem gängigen Framework für maschinelles Lernen erstellen können.

Zusätzlich zum ONNX-Modellformat verwenden wir auch die ONNX Runtime, eine Open-Source-Laufzeit, die es uns ermöglicht, unser ONNX-Modell innerhalb unserer .NET Core-Anwendung auszuführen. Wir verwenden die C#-APIs, aber die ONNX Runtime unterstützt auch APIs für mehrere andere Sprachen, darunter Python, Java und Javascript.

Mehr über das ONNX-Projekt und die unterstützten Frameworks können Sie hier lesen: [https://onnx.ai/](https://onnx.ai/)

Und Sie können hier mehr darüber erfahren, wie Sie die ONNX Runtime mit verschiedenen Sprachen und Plattformen verwenden: [https://microsoft.github.io/onnxruntime/](https://microsoft.github.io/onnxruntime/)

Erstellen Sie ein ONNX-Modell
-----------------------------

Zuerst erstellen und trainieren wir ein Sci-kit Learn-Modell unter Verwendung des California Housing Dataset. Hier gibt es nichts Besonderes, nur einen GradientBoostingRegressor, der darauf trainiert ist, den Preis eines Hauses anhand einiger Datenpunkte über die Nachbarschaft vorherzusagen, wie etwa dem Durchschnittseinkommen, der durchschnittlichen Anzahl der Schlafzimmer usw.

Wir müssen die _sklearn-onnx-_ Bibliothek installieren, die es uns ermöglicht, das sklearn-Modell in das ONNX-Format zu konvertieren:

```
pip install skl2onnx
```

Dann verwenden wir die `convert_sklearn()`Methode, um die Konvertierung durchzuführen:

Der `initial_types`Parameter definiert die Dimensionen und Datentypen der Modelleingabe. Dieses Modell benötigt 8 Eingänge vom Typ Float. Das `None`in der Eingabedimension `[None,8]`weist auf eine unbekannte Chargengröße hin.

**Hinweis** : Es gibt einige Einschränkungen für die Konvertierung von Scikit-Learn-Modellen in das ONNX-Format. _Einzelheiten zu diesen Einschränkungen und zur sklearn-onnx_ -Bibliothek finden Sie hier: [http://onnx.ai/sklearn-onnx/](http://onnx.ai/sklearn-onnx/)

Führen Sie eine Inferenz mit einem ONNX-Modell durch
----------------------------------------------------

Nun zur ASP.NET Core-Anwendung, die unser ONNX-Modell verwendet und es als REST-API-Endpunkt verfügbar macht, wodurch Echtzeit-Inferenz als Dienst ermöglicht wird. Wir erstellen eine leere ASP.NET Core-Web-API mit dem `dotnet`Befehlszeilentool:

```
Dotnet neues Webapi
```

Als Nächstes installieren wir das **Microsoft.ML.OnnxRuntime** NuGet-Paket, das es uns ermöglicht, das ONNX-Modell innerhalb der .NET Core-Anwendung zu laden und zu bewerten:

```
dotnet fügt das Paket Microsoft.ML.OnnxRuntime hinzu
```

Bevor wir das Modell bewerten können, müssen wir ein Objekt starten `InferenceSession`und das Modellobjekt in den Speicher laden. Fügen Sie der `ConfigureServices`Methode in _Startup.cs_ die folgende Zeile hinzu :

Wenn Sie mit ASP.NET Core oder der Abhängigkeitsinjektion nicht vertraut sind, erstellt die obige Zeile lediglich eine Singleton-Instanz des Typs `InferenceSession`und fügt sie dem Dienstcontainer der Anwendung hinzu. Dies bedeutet, dass die Inferenzsitzung nur einmal erstellt wird, wenn die Anwendung gestartet wird, und dass dieselbe Sitzung bei nachfolgenden Aufrufen des Inferenz-API-Endpunkts, den wir in Kürze erstellen werden, wiederverwendet wird.

Ausführlichere Informationen zum Service-Container, zur Service-Lebensdauer und zur Abhängigkeitsinjektion im Allgemeinen finden Sie hier: [Abhängigkeitsinjektion in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection?view=aspnetcore-3.1)

Beachten Sie, dass wir im obigen Code die .onnx-Modelldatei aus dem lokalen Dateisystem laden. Während dies in unserem Beispiel gut funktioniert, wäre es in einer Produktionsanwendung wahrscheinlich besser, das Modellobjekt aus einem externen Modell-Repository/einer externen Modellregistrierung wie MLFlow herunterzuladen, um die Versionskontrolle des ML-Modells von der der Anwendung zu trennen.

Da die Anwendung nun weiß, wie sie unser ONNX-Modell in den Speicher lädt, können wir eine API-Controller-Klasse erstellen, die in ASP.NET Core-Anwendungen einfach eine Klasse ist, die die API-Endpunkte definiert, die von unserer Anwendung verfügbar gemacht werden.

Hier ist die Controller-Klasse für den Inferenzendpunkt:

Ein paar Anmerkungen zur oben genannten Klasse:

*   Das Attribut gibt an, dass wir über die Route _/score_`[Route("/score")]` Anfragen an die Endpunkte dieses Controllers stellen können
*   Beachten Sie, dass der Konstruktor der Klasse ein Objekt vom Typ `InferenceSession`als Parameter akzeptiert. Wenn die Anwendung startet, erstellt sie eine Instanz unserer Controller-Klasse und übergibt die Singleton-Instanz der zuvor in _Startup.cs_`InferenceSession` definierten Instanz .
*   Die tatsächliche Bewertung unseres Modells anhand der Eingaben erfolgt, wenn wir aufrufen`_session.Run()`
*   Die Klassen `HousingData`und `Prediction`sind einfache Datenklassen, die zur Darstellung der Anforderungs- bzw. Antworttexte verwendet werden. Wir werden beide im Folgenden definieren.

Hier ist die `HousingData`Klasse, die den JSON-Hauptteil der eingehenden API-Anfrage an unseren Endpunkt darstellt. Zusätzlich zu den Eigenschaften des Objekts haben wir auch eine `AsTensor()`Methode definiert, die das `HousingData`Objekt in ein Objekt vom Typ konvertiert `Tensor<float>`, damit wir es an unser ONNX-Modell übergeben können:

Und hier ist die `Prediction`Klasse, die die Struktur der Antwort definiert, mit der unser API-Endpunkt antwortet:

Testen der API
--------------

Und das ist es. Jetzt können wir unsere ASP.NET Core-Web-API ausführen und unseren Inferenzendpunkt testen. Verwenden Sie den `dotnet run`Befehl im Stammverzeichnis des Projekts, um die Anwendung zu starten. In der Ausgabe sollte eine Zeile wie diese angezeigt werden, die angibt, auf welchem Port die Anwendung lauscht:

```
Höre jetzt zu: http://[::]:80
```

Nachdem die App nun betriebsbereit ist, können Sie Ihr Lieblingstool zum Erstellen von API-Anfragen (meins ist [Postman](https://www.postman.com/) ) verwenden, um ihr eine Anfrage wie diese zu senden:

![[images/1RGxtamjUIXctiTnF1aPisw.jpeg]]

Senden einer Anfrage an den /score-Endpunkt über Postman. (Bild vom Autor)

Und da haben Sie es! Wir sind jetzt in der Lage, über API-Anfragen Vorhersagen aus unserem Modell in Echtzeit zu erhalten. Versuchen Sie, die Eingabewerte zu optimieren und sehen Sie, wie sich der vorhergesagte Wert ändert.

Abschluss
---------

Danke fürs Lesen. In diesem Artikel haben wir gesehen, wie Sie das ONNX-Modellformat und die ONNX-Laufzeit verwenden, um den Prozess der Integration von ML-Modellen in Produktionsanwendungen zu optimieren. Während die gezeigten Beispiele spezifisch für Scikit-Learn und C# waren, ermöglicht uns die Flexibilität von ONNX und der ONNX Runtime, verschiedene Frameworks und Technologie-Stacks für maschinelles Lernen zu kombinieren (z. B. Scikit-learn und Javascript, Tensorflow und Java usw.). .

Beispielcode
------------

Ein Repository mit dem gesamten Beispielcode für Training und Inferenz finden Sie hier: [https://github.com/gnovack/sklearn-dotnet](https://github.com/gnovack/sklearn-dotnet)

Verweise
--------

*   [http://onnx.ai/sklearn-onnx/tutorial.html](http://onnx.ai/sklearn-onnx/tutorial.html)
*   [https://github.com/microsoft/onnxruntime/blob/master/docs/CSharp\_API.md#getting-started](https://github.com/microsoft/onnxruntime/blob/master/docs/CSharp_API.md#getting-started)

Fühlen Sie sich frei, unten Fragen oder Kommentare zu hinterlassen. Danke!