Maschinelles Lernen mit ML.Net und Python
-----------------------------------------

[

![[images/1KcdwBasy1FoaO5aFaHzlIw.png]]



](https://ninjacoder1986.medium.com/?source=post_page-----2bbdd7b15874--------------------------------)[

![[images/15D9oYBd58pyjMkV_5-zXXQ.jpeg]]



](https://levelup.gitconnected.com/?source=post_page-----2bbdd7b15874--------------------------------)

Erstellen Sie Machine-Learning-Ausgaben mit ML.Net und Python mit Beispielcode.

![[images/1IZ62PDdOzK0dWGJ7JDXv2Q.jpeg]]

Maschinelles Lernen ist zu einem integralen Bestandteil vieler Unternehmen und Branchen geworden und ermöglicht es Organisationen, Daten und Erkenntnisse zu nutzen, um bessere Entscheidungen zu treffen. Eines der beliebtesten Frameworks für maschinelles Lernen ist Python, dank seiner Benutzerfreundlichkeit und der Fülle an leistungsstarken Bibliotheken. Für diejenigen, die jedoch eine .NET-Umgebung bevorzugen, hat Microsoft ML.Net entwickelt, ein Framework für maschinelles Lernen, das sich nahtlos in .NET-Sprachen wie C# und F# integrieren lässt.

In diesem Blogbeitrag werden wir untersuchen, wie man ML.Net und Python zusammen verwendet, um Modelle für maschinelles Lernen zu erstellen, die Daten analysieren und vorhersagen können.

Anforderungen
-------------

*   Daten importieren
*   Saubere Daten
*   Modell erstellen
*   Zugmodell
*   Machen Sie eine Vorhersage
*   Verbessern

IDEs
----

Sie benötigen zunächst die folgenden IDEs und können die Abhängigkeiten später damit installieren.

*   [Visual Studio-Code](https://code.visualstudio.com/download)
*   [Visual Studio – Community Edition](https://visualstudio.microsoft.com/vs/community/)

Python für maschinelles Lernen
------------------------------

Öffnen Sie das Terminal in VSCode (Strg + Umschalt + ~) und führen Sie den folgenden Befehl aus

```
python -m pip install -U pandas python -m pip install -U scikit-learn
```

Dadurch sollten [_Pandas_](https://pandas.pydata.org/) _und_ [_Scikit-Learn_](https://scikit-learn.org/stable/) -Bibliotheken installiert werden, die für die Programmiersprache Python zur Datenmanipulation und -analyse geschrieben wurden.

![[images/1SMbF0Da54ZRBvmJbdVObPg.png]]

Daten importieren
-----------------

Als nächstes muss ein Datensatz zur Analyse importiert werden. Ich habe einen einfachen Datensatz mit Kunden erstellt, die einige Produkte kaufen, in dem Alter, Geschlecht und Produkt angegeben sind und es sich nur um ein Beispiel handelt.

Als nächstes schreiben wir etwas Python-Code

```
Pandas als PD aus sklearn.model_selection importieren , train_test_split aus sklearn.linear_model importieren , LogisticRegression aus sklearn.metrics importieren , Accuracy_score importieren  data = pd.read_csv( "sales_data.csv" )  data.dropna(inplace= True ) data = data[(data[ "age" ] > 18 ) & (data[ "age" ] < 65 )] X_train , _ _ _ _ _ _ _  _  model.fit(X_train, y_train)  y_pred = model.predict(X_test)  precision = precision_score(y_test, y_pred) print ( "Accuracy: " , precision)
```

Zuerst importieren wir die notwendigen Bibliotheken für unser Projekt. Wir verwenden Pandas, um unsere Daten zu laden und zu bearbeiten, und Scikit-Learn, um maschinelle Lernvorgänge durchzuführen.

```
Pandas als PD aus sklearn.model_selection importieren , train_test_split aus sklearn.linear_model importieren , LogisticRegression importieren
```

Als nächstes laden wir unsere Daten mit Pandas aus einer CSV-Datei. Der resultierende Datenrahmen besteht aus drei Spalten: `Age`, `Gender`und `Product`(das ist die Spalte, die wir vorhersagen möchten).

```
data = pd.read_csv('sales_data.csv ')
```

Um unsere Daten zu bereinigen, löschen wir alle Zeilen mit fehlenden Werten mithilfe der `dropna`Pandas-Methode. `Age`Wir filtern unsere Daten auch mithilfe der booleschen Indizierung, um alle Zeilen zu entfernen, deren Spalte außerhalb des Bereichs von 18 bis 65 liegt.

```
data = data .dropna() data = data [( data [ 'Age' ] >= 18 ) & ( data [ 'Age' ] <= 65 )]
```

`train_test_split`Wir teilen unsere Daten mithilfe der Scikit-Learn-Methode in Trainings- und Testsätze auf . Standardmäßig teilt diese Methode die Daten in 75 % Trainingsdaten und 25 % Testdaten auf.

```
train_data, test_data, train_target, test_target = train_test_split(data[[ 'Age' , 'Gender' , 'Product' ]], data[ 'Target' ], test_size= 0.25 )
```

Anschließend definieren wir unser Modell mithilfe der `LogisticRegression`Klasse von scikit-learn. In diesem Beispiel verwenden wir die Standard-Hyperparameter für das logistische Regressionsmodell.

```
model = LogisticRegression()
```

Mithilfe der Methode passen wir das Modell an unsere Trainingsdaten an `fit`. Dadurch wird das Modell anhand der Trainingsdaten trainiert und ein trainiertes Modell zurückgegeben, das für Vorhersagen verwendet werden kann.

```
Modell .fit (train_data, train_target)
```

Wir verwenden das trainierte Modell, um mithilfe der Methode Vorhersagen zu unseren Testdaten zu treffen `predict`. Dadurch wird ein Satz vorhergesagter Zielwerte generiert, die mit den tatsächlichen Zielwerten verglichen werden können, um die Leistung des Modells zu bewerten.

```
Vorhersagen = model.predict(test_data)
```

Schließlich verwenden wir verschiedene Scikit-Learn-Funktionen, um Leistungsmetriken für das Modell zu berechnen, einschließlich Genauigkeit, Präzision, Rückruf und F1-Score.

```
aus sklearn.metrics Import Accuracy_score, Precision_score, Recall_score, f1_score Genauigkeit = Accuracy_score(test_target, Vorhersagen) Precision = Precision_score(test_target, Vorhersagen) Recall = Recall_score(test_target, Vorhersagen) f1 = f1_score(test_target, Vorhersagen)
```

Mithilfe dieser Metriken kann die Leistung des Modells bewertet und bei Bedarf Verbesserungen vorgenommen werden.

ML.Net für maschinelles Lernen
------------------------------

Und hier ist ein Beispielcode zum Importieren und Bereinigen von Daten in ML.Net, zum Erstellen und Trainieren eines Modells mithilfe der ModelBuilder-API und zum Erstellen von Vorhersagen für neue Daten:

```
mit Microsoft.ML; mit Microsoft.ML.Data; public  class  Data {     [ LoadColumn(0) ] public  float Age;     [ LoadColumn(1) ] public  float Geschlecht;     [ LoadColumn(2) ] öffentliches  Float- Produkt; } var mlContext = new MLContext(); var data = mlContext.Data.LoadFromTextFile<Data>( "sales_data.csv" , separatorChar: ',' );varpipeline = mlContext.Transforms.DropMissingValues()     .Append(mlContext.Transforms.FilterByColumn( "Age" , LowerBound: 18 , UpperBound: 65 )); var trainTestSplit = mlContext.Data.TrainTestSplit(data); var trainData = trainTestSplit.TrainSet; var testData = trainTestSplit.TestSet; var modelBuilder = mlContext.Model; var model = modelBuilder     .SelectColumns( "Target" )    .Append(mlContext.Transforms.Concatenate( "Gender" , "Age" , "Product" ))     .Append(mlContext.BinaryClassification.Trainers.LogisticRegression())     .Fit(trainData); varvorhersagen = model.Transform(testData); var metrics = mlContext.BinaryClassification.Evaluate(predictions); Console.WriteLine( $"Accuracy: {metrics.Accuracy} " );
```

Zuerst definieren wir eine C#-Klasse `Data`zur Darstellung der Daten, mit denen wir arbeiten werden. In diesem Fall bestehen unsere Daten aus drei Spalten: `Age`, `Gender`und `Product`(das ist die Spalte, die wir vorhersagen möchten). Wir verwenden das `LoadColumn`Attribut, um den Index jeder Spalte in der CSV-Datei anzugeben.

```
public  class  Data {     [ LoadColumn(0) ] public  float Age;     [ LoadColumn(1) ] public  float Geschlecht;     [ LoadColumn(2) ] öffentliches  Float- Produkt; }
```

Als nächstes verwenden wir die `MLContext`Klasse, um eine Instanz des ML.Net-Kontexts zu erstellen. Dieser Kontext wird verwendet, um maschinelle Lernvorgänge durchzuführen, z. B. das Laden von Daten, das Transformieren von Daten, das Trainieren von Modellen und das Treffen von Vorhersagen.

```
var  mlContext  =  new  MLContext ();
```

Anschließend laden wir unsere Daten mit der Methode aus einer CSV-Datei `LoadFromTextFile`. Die `Data`zuvor definierte Klasse wird als Typargument verwendet, um das Schema der Daten anzugeben.

```
var  data = mlContext.Data.LoadFromTextFile<Data>( "sales_data.csv" , separatorChar: ',' );
```

Um unsere Daten zu bereinigen, erstellen wir mithilfe der `Transforms`Eigenschaft von eine Pipeline von Datentransformationen `MLContext`. In diesem Beispiel verwenden wir die `DropMissingValues`Methode zum Entfernen aller Zeilen mit fehlenden Werten und die `FilterByColumn`Methode zum Entfernen aller Zeilen, deren `Age`Spalte außerhalb des Bereichs von 18 bis 65 liegt.

```
var Pipeline = mlContext.Transforms. DropMissingValues ()     . Append (mlContext.Transforms. FilterByColumn ( "Age" , LowerBound : 18 , UpperBound : 65 ));
```

`TrainTestSplit`Wir teilen unsere Daten mithilfe der Methode der `Data`Eigenschaft in Trainings- und Testsätze auf `MLContext`. Standardmäßig teilt diese Methode die Daten in 80 % Trainingsdaten und 20 % Testdaten auf.

```
var trainTestSplit = mlContext.Data.TrainTestSplit( data ); var trainData = trainTestSplit.TrainSet; var testData = trainTestSplit.TestSet;
```

Anschließend definieren wir unser Modell mithilfe der `ModelBuilder`API des `MLContext`. In diesem Beispiel verwenden wir die `SelectColumns`Methode zum Auswählen der `Target`Spalte, die `Concatenate`Methode zum Kombinieren der Spalten `Age`, `Gender`und `Product`in einer einzelnen Feature-Spalte und die `LogisticRegression`Methode zum Definieren eines binären Klassifizierungsmodells.

```
var  modelBuilder  = mlContext.Model; var  model  = modelBuilder     .SelectColumns( "Target" )     .Append(mlContext.Transforms.Concatenate( "Age" , "Gender" , "Product" ))     .Append(mlContext.BinaryClassification.Trainers.LogisticRegression())     .Fit(trainData );
```

Mithilfe der Methode passen wir das Modell an unsere Trainingsdaten an `Fit`. Dadurch wird das Modell anhand der Trainingsdaten trainiert und ein trainiertes Modell zurückgegeben, das für Vorhersagen verwendet werden kann.

```
var  model  = modelBuilder          .Fit(trainData);
```

Wir verwenden das trainierte Modell, um mithilfe der Methode Vorhersagen zu unseren Testdaten zu treffen `Transform`. Dadurch wird ein Satz vorhergesagter Zielwerte generiert, die mit den tatsächlichen Zielwerten verglichen werden können, um die Leistung des Modells zu bewerten.

```
varvorhersagen  = model.Transform  (testData);
```

Schließlich verwenden wir die `BinaryClassification.Evaluate`Methode, um verschiedene Leistungsmetriken für das Modell zu berechnen, einschließlich Genauigkeit, Präzision und Rückruf.

Abschluss
---------

In Python haben wir Pandas verwendet, um unsere Daten zu laden und zu bearbeiten, und Scikit-Learn, um maschinelle Lernvorgänge durchzuführen. Wir haben unsere Daten aus einer CSV-Datei geladen, sie bereinigt, indem wir fehlende Werte gelöscht und Zeilen mit ungültigem Alter herausgefiltert haben, sie in Trainings- und Testsätze aufgeteilt, unser logistisches Regressionsmodell definiert und trainiert, Vorhersagen zu unseren Testdaten getroffen und die Leistung bewertet unseres Modells anhand verschiedener Metriken.

In ML.NET haben wir dieselben Daten verwendet, aber leicht unterschiedliche Vorgänge durchgeführt, um sie für maschinelles Lernen vorzubereiten. Wir haben ein Datenschema mithilfe einer C#-Klasse definiert, unsere Daten aus einer CSV-Datei geladen, sie durch Löschen fehlender Werte bereinigt, sie mithilfe einer integrierten Funktion in Trainings- und Testsätze aufgeteilt, unser logistisches Regressionsmodell definiert und trainiert und Vorhersagen getroffen Wir haben unsere Testdaten analysiert und die Leistung unseres Modells mithilfe der `Evaluate`Methode bewertet.

Sowohl Python als auch ML.NET bieten leistungsstarke und flexible Tools für die Durchführung maschinellen Lernens, und jedes hat seine Stärken und Schwächen. Durch das Verständnis der Grundlagen des maschinellen Lernens und der uns zur Verfügung stehenden Tools können wir fundierte Entscheidungen darüber treffen, welche Tools wir für eine bestimmte Aufgabe verwenden und genaue und zuverlässige Vorhersagen treffen.