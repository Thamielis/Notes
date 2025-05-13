
# [Deep Learning: Tensorflow DNNRegressor einfach erklärt](https://www.cbcity.de/deep-learning-tensorflow-dnnregressor-einfach-erklaert)

— Dies ist Teil2 der Tutorials zu Neuronalen Netzen - hier ist Teil1: [Neuronale Netze einfach erklärt](https://www.cbcity.de/tutorial-neuronale-netze-einfach-erklaert) —

[![Logo](https://www.cbcity.de/wp-content/uploads/2018/01/TensorFlow-Logo.png)](https://www.tensorflow.org/)
Nach der Einführung in die Thematik der [Neuronalen Netze](https://www.cbcity.de/tutorial-neuronale-netze-einfach-erklaert) nun ein einfaches Deep Learning Beispiel mit der wichtigsten Bibliothek, welche für das Thema Machine Learning mit Neuronalen Netzen derzeit genutzt wird: [Tensorflow](https://www.tensorflow.org/)!

Deep Learning ist hauptsächlich (bis auf Forschungsthemen) Supervised Learning, d.h. man zeigt dem Netzwerk also für bestimmte Eingangswerte die richtige Lösung (z.B. Klassifikation von Bildern oder Gruppen), das Netzwerk lernt Schritt für Schritt besser zu werden. Für viele Ingenieurs-Problemstellungen ist die zu schätzende Ausgangsgröße keine einzelne Klasse oder Kategorie (z.B. Auto, Haus, Boot) sondern ein kontinuierlicher Wert, z.B. ein Preis oder eine Kraft oder Fläche o.ä.

Neuronale Netze sind ein [universeller Approximator](https://en.wikipedia.org/wiki/Universal_approximation_theorem): Wenn es einen Zusammenhang zwischen Ein- und Ausgangsgröße gibt, ist es sehr wahrscheinlich, dass ein (handwerklich korrekt aufgesetztes) Neuronales Netz diesen finden wird. Achtung: Es findet Korrelationen! Ob diese Korrelationen auch einen kausalen Zusammenhang haben oder nicht muss der Experte entscheiden.

Für dieses Tutorial knüpfen wir an [Michael Nielsons Tutorial](http://neuralnetworksanddeeplearning.com/chap4.html) an und versuchen die folgende Funktion f(x) von einem Netzwerk schätzen zu lassen.

f(x)\=0.2+0.4x2+0.3x⋅sin(15x)+0.05⋅cos(50x)

Ein typisches Regressionsproblem, daher nun ein Tensorflow Tutorial zum [DNNRegressor](https://www.tensorflow.org/api_guides/python/contrib.learn), welches sich prinzipiell auch für höherdimensionale bzw. kompliziertere Fragestellungen nutzen lässt.

## Tutorial: Tensorflow DNNRegressor

Die Versionen und damit Tensorflow-APIs ändern sich so schnell, dass viele Google-Treffer zu Tutorials gar nicht mehr aktuell sind und man mitunter an einfachen Dinge hängen bleibt. Dieses Tutorial gilt für die aktuelle Tensorflow 1.4 (kompletter Code am Ende des Beitrags: Bitte scrollen).

Tensorflow ist ein Profi-Werkzeug, allerdings wurden mittlerweile vereinfachte bzw. High-Level API-Enpunkte hinzugefügt, welche es relativ einfach machen zu starten. Wer aus der Welt von [SciKit-Learn](http://scikit-learn.org/) kommt, wird jetzt hier einen Einstieg finden. Das [Skflow Projekt](https://github.com/tensorflow/skflow) wurde mittlerweile als [contrib/learn](https://www.tensorflow.org/api_guides/python/contrib.learn) in Tensorflow integriert, ist also gekommen, um zu bleiben (hoffentlich). Dazu importieren wir ein paar Dinge:

`import` `tensorflow as tf`

`import` `tensorflow.contrib.learn as skflow`

`from` `sklearn.model_selection` `import` `train_test_split`

`import` `numpy as np`

Nun können wir los legen.

### Problem Statement: Wir haben Daten (Features) und ein Zielwert (Labels)

Da wir ein einfaches, nachvollziehbares Tutorial durchgehen, sind unsere Eingangsdaten einfach nur eine Reihe von Zahlen, denn mehr brauchen wir erst mal nicht.  Wir erzeugen uns als Eingangsdaten 1mio Zahlen, aufsteigend zwischen 0 und 1 und als Spaltenvektor umgeformt:

`X` `=` `np.linspace(``0``,` `1``,` `1000001``).reshape((``-``1``,` `1``))`

Was das Netzwerk lernen soll müssen wir auch künstlich erzeugen, wir nehmen die oben genannte Funktion:

`f` `=` `lambda` `x:` `0.2``+``0.4``*``x``*``*``2``+``0.3``*``x``*``np.sin(``15``*``x)``+``0.05``*``np.cos(``50``*``x)`

`y` `=` `f(X)`

Nun haben wir unsere Features in X und unsere Labels in y. Wobei die Bezeichnung für ein Regressionsproblem nicht ganz korrekt ist, aber im Allgemeinen wird dies für Machine Learning Probleme so bezeichnet.

### Trainings- und Testdaten vorhalten

Um eine Aussage zur Qualität der Prädiktion treffen zu können, sollten wir von unseren Daten etwas abzweigen, was wir dem Netzwerk während des Lernprozesses nicht zeigen. Das ist der so genannte [Train/Test-Split](http://scikit-learn.org/stable/modules/generated/sklearn.model_selection.train_test_split.html), welchen wir ganz komfortabel in SciKit-Learn implementiert haben.

`X_train,X_test,y_train,y_test` `=` `train_test_split(X, y,`

                                                `test_size``=``0.1``,`

                                                `random_state``=``2``)`

Wir nutzen 10% der Daten zum testen der Vorhersage und trainieren mit 90% der Daten.

### Training und Test des DNNRegressor mit Tensorflow numpy\_input\_fn

Eine Möglichkeit Tensorflow mit Daten zu versorgen ist die [numpy\_input\_fn](https://www.tensorflow.org/api_docs/python/tf/estimator/inputs/numpy_input_fn). Wir generieren eine für das Training und später noch eine zum Evaluieren (Testen).

`def` `training_input_fn(batch_size``=``1``):`

    `return` `tf.estimator.inputs.numpy_input_fn(`

                        `x``=``{``'X'``: X_train.astype(np.float32)},`

                        `y``=``y_train.astype(np.float32),`

                        `batch_size``=``batch_size,`

                        `num_epochs``=``None``,`

                        `shuffle``=``True``)`

Was wurde hier gemacht? Die Funktion training\_input\_fn() gibt einfach nur die Tensorflow numpy\_input\_fn() zurück. Diese benötigt für die Eingangsdaten *x* ein Dictionary, welches wir mit dem Namen "X" versehen und mit den Werten aus *X\_train* füllen. Die Typzuweisung (float32) ist hier nicht unbedingt nötig, jedoch möchte ich explizit darauf hinweisen, dass dies gut wäre, denn GPUs verlangen float32 und alle Input Funktionen müssen den gleichen Datentyp haben. Zum Trainieren wird die Anzahl der Epochen auf None gesetzt.

### Design eines Neural Networks mit Tensorflow

Nun designen wir das Neural Net für Tensorflow. Wir nutzen den [DNNRegressor aus tf.contrib.learn](https://www.tensorflow.org/api_docs/python/tf/contrib/learn/DNNRegressor). Schaut man auf die Instantiierung, so gibt es viele (optionale) Parameter, welche wir nicht alle benötigen.

`regressor` `=` `skflow.DNNRegressor(feature_columns``=``feature_columns,`

                            `label_dimension``=``1``,`

                            `hidden_units``=``hidden_layers,`

                            `model_dir``=``MODEL_PATH,`

                            `dropout``=``dropout,`

                            `config``=``test_config)`

Einige Variablen möchte ich im folgenden erläutern:

Zum Instantiieren ist eine [feature\_column](https://www.tensorflow.org/api_docs/python/tf/feature_column) notwendig, welche Tensorflow sagt, was für Daten eingespeist werden. Für das Regressionsproblem ist eine [numerische Spalte](https://www.tensorflow.org/api_docs/python/tf/feature_column/numeric_column) der Breite 1 die korrekte Eingangsdefinition, denn die Funktion *f(x)* ist nur von einem eindimensionalen *x* abhängig. Für andere Problemstellungen sind auch noch andere und auch kombinierte Spalten möglich, [siehe](https://www.tensorflow.org/versions/master/get_started/feature_columns).

`feature_columns` `=` `[tf.feature_column.numeric_column(``'X'``, shape``=``(``1``,))]`

Da unser Regressionsproblem 1-dimensional ist (eine Funktion *f(x)* gibt ein eindimensionales *y* zurück), wird die label\_dimension auf 1 gesetzt. Für mehrdimensionale Problemstellungen, z.B. Lat/Lon Positionsschätzungen in der Ebene, muss dies entsprechend auf 2 gesetzt werden.

Weiterhin definieren wir ein paar Variablen, welche das Design des Netzwerks beschreiben:

`hidden_layers` `=` `[``128``,` `64``,` `32``]`

`dropout` `=` `0.0`

Was haben wir hier definiert?

- hidden\_layers ist die Anzahl der Neuronen pro Layer, in diesem Beispiel ein Netzwerk mit 3 Hidden Layers,
  - 1\. Layer 128 Neuronen
  - 2\. Layer 64 Neuronen
  - 3\. Layer 32 Neuronen
- dropout ist der Anteil an Neuronen der während jeden Lernschritts pro Layer zufällig ignoriert wird, d.h. nicht am Lernprozess (fitting) teilnimmt
  - Dies ist für viele praktische Anwendungsfälle empfohlen, um das Netzwerk daran zu hindern einfach nur alles auswendig zu lernen an statt generalisiert wiederzugeben, [siehe](https://www.cs.toronto.edu/~hinton/absps/JMLRdropout.pdf).
  - Allerdings dauert das lernen dann wesentlich länger und die Ergebnisse sind nicht immer zufriedenstellend
  - Warum das funktioniert ist noch Gegenstand der Forschung, wir Menschen lernen z.B. auch, indem wir einige Dinge einfach wieder vergessen. :)
- MODEL\_PATH ist der Pfad auf der Festplatte, wo Tensorflow alles speichern soll
  - kann für [Tensorboard](https://www.tensorflow.org/get_started/summaries_and_tensorboard) genutzt werden
  - wird zum laden des Modells (wenn es trainiert ist) genutzt
  - wird zum 'später weiter trainieren' genutzt
- test\_config kann genutzt werden um das Speichern in der MODEL\_DIR zu parametrieren, [siehe](https://www.tensorflow.org/api_docs/python/tf/estimator/RunConfig)

Fertig. Zeit zum lernen.

### Training eines Neuronalen Netzwerks mit Tensorflow DNNRegressor

Dies ist nun der einfachste Teil. Wir lassen für mehrere Epochen das Netzwerk den Fehler ermitteln und auf die Neuronen verteilen. Dies passiert bei geeigneter Hardware automatisch auf der GPU (NVIDIA CUDA vorausgesetzt), sonst auf der CPU. Für dieses kleine Problem auch nicht relevant, denn das kopieren von/zu Grafikkarte kostet auch Zeit und da ist man mitunter auf einer CPU schneller.

`for` `epoch` `in` `range``(EPOCHS):`

        `regressor.fit(input_fn``=``training_input_fn(batch_size``=``BATCH_SIZE),`

                    `steps``=``STEPS_PER_EPOCH)`

Was haben wir hier noch zusätzlich als Variablen definiert?

- BATCH\_SIZE ist die Anzahl an Daten die gleichzeitig zum lernen genutzt werden sollen.
  - Für uns irrelevant, wir könnten praktisch immer mit den gesamten Daten trainieren
  - Aber für größere Problemstellungen (z.B. für Bildverarbeitung), wo die Tensoren (=Eingangsdaten) groß sind \[batch\_size, height, width, channels\], steuert die BATCH\_SIZE wieviel Daten (z.B. Bilder) gleichzeitig auf die GPU kopiert werden zum training
  - begrenzt z.B. durch den RAM der GPU
- STEPS\_PER\_EPOCH: Wieviel mal Tensorflow pro Ausführen des [.fit()](https://www.tensorflow.org/api_docs/python/tf/contrib/learn/DNNRegressor#fit) die Fehler backpropagieren (auf die Neuronen verteilen) soll
- EPOCHS: Wie oft wir [.fit()](https://www.tensorflow.org/api_docs/python/tf/contrib/learn/DNNRegressor#fit) ausführen wollen

Das sieht jetzt erst mal komisch aus, denn man könnte ja auch einfach nur 1 Epoche laufen lassen, dafür aber steps größer wählen. Das stimmt, doch es gibt auch Fälle, wo die *input\_fn()* beispielsweise Daten aus verschiedenen Dateien erst mal lädt oder Datenbankabfragen macht oder die Daten jeweils generieren muss oder der RAM einfach zu klein ist für alle Daten gleichzeitig und dann kann man es auf Epochen verteilen. Andere Möglichkeiten [Daten zu lesen](https://www.tensorflow.org/api_guides/python/reading_data).

Tensorflow bekommt jetzt die Daten aus *X\_train* als Eingang, versucht *y\_train* korrekt zu schätzen, macht dabei Fehler (für Regressionsprobleme typisches Fehlermaß ist der mittlere Abstand von geschätzter Funktion zu realer Funktion: [MSE](https://en.wikipedia.org/wiki/Mean_squared_error)), der DNNRegressor (de-)aktiviert die Neuronen die ihn verursacht haben und wird Step-by-Step besser:

![dnn](https://www.cbcity.de/wp-content/uploads/2018/01/128_64_32_D00.gif)

128x64x32 DNNRegressor learning to predict a function

Soweit so gut, der Fehler geht nach unten, das Netzwerk lernt, alles richtig gemacht. Das war einfach. Doch die Frage bleibt: Ist das schon das beste Ergebnis? Länger lernen? Mehr Neuronen im 1. Layer oder mehr im 2. oder vielleicht Dropout? Und wer sagt, dass 3 Layer gut sind? Vielleicht 10 oder vielleicht nur ein Layer mit 100000 Neuronen?

Das ist die Kunst! Hier braucht es Werkzeuge, Erfahrung, Zeit, Rechenzentren und Tensorboard.

## Evaluation von Neuronalen Netzen mit Tensorboard

<iframe width="870" height="489" src="https://www.youtube.com/embed/eBbEDRsCmv4?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen=""></iframe>

Der von uns genutzte DNNRegressor hat eine Methode namens [.evaluate()](https://www.tensorflow.org/api_docs/python/tf/contrib/learn/DNNRegressor#evaluate) und diese können wir nutzen um ihn zu… na, wer errät es?

```python
eval_dict = regressor.evaluate(input_fn=test_input_fn(),
                                metrics=validation_metrics)
```

Wir nutzen eine andere Input Function zum testen, welche *X\_test* und *y\_test* (vom Train/Test Split) an Tensorflow liefert:

```python
def test_input_fn():
    return tf.estimator.inputs.numpy_input_fn(
                    x={'X': X_test.astype(np.float32)},
                    y=y_test.astype(np.float32),
                    num_epochs=1,
                    shuffle=False)
```

Hier wird Shuffle auf False gesetzt und die Anzahl der Epochen auf 1: Einfach nur 1x genau so wie definiert mit *X\_test* und *y\_test* durchrechnen lassen.

Die Validation Metric (also was wir evaluiert haben wollen) können wir aus [tf.contrib.metrics](https://www.tensorflow.org/api_docs/python/tf/contrib/metrics) bemühen.

```python
validation_metrics = {"MSE": tf.contrib.metrics.streaming_mean_squared_error}
```

Sobald der Regressor mit fit() trainiert und/oder evaluiert wird, werden im MODEL\_PATH Daten geschrieben, die wir mit [Tensorboard](https://www.tensorflow.org/get_started/summaries_and_tensorboard) ganz komfortabel einsehen können. Dazu einfach in einem Terminal Tensorboard starten (logdir sollte MODEL\_PATH sein, unter Windows den Pfad vollständig angeben):

```python
tensorboard --logdir='./DNNRegressors/'
```

Im Browser kann man nun unter [localhost auf Port 6006](http://localhost:6006/) folgendes sehen:

![Tensorboard-DNNRegressor-Evaluation](https://www.cbcity.de/wp-content/uploads/2018/01/Tensorboard-DNNRegressor-Evaluation-770x549.png)

Tensorboard mit Darstellung von Mean Square Error (MSE) von 3 Neuronalen Netzwerken

Tensorboard ermöglicht es u.a. den Lernerfolg zu visualisieren und zu vergleichen. In oberer Darstellung sind beispielsweise 3 verschiedene Netzwerke zu sehen, welche mit der test\_input\_fn() evaluiert werden.

### Vergleich von Neural Network Designs

Neuronale Netze sind ein [universeller Approximator](https://en.wikipedia.org/wiki/Universal_approximation_theorem), d.h. prinzipiell ist es möglich schon mit nur einem Hidden-Layer eine 1-D Funktion zu approximieren. Ob dies praktisch auf einem Computer dann auch gelingt, ist auch vom Zufall abhängig, denn je nachdem wie Variablen initialisiert werden, dauert das Verteilen der Fehler (Backprop) entsprechend lange, bis es besser wird bzw. bis man aus einem lokalen Minimum wieder heraus optimiert. Im Beispiel hier breche ich jeweils nach 100.000 Schritten ab.

#### 3-Hidden-Layer - 128x64x32 Netzwerk

Schaut man sich die hellblaue MSE Kurve in der Tensorboard Abbildung an, sieht man einen wunderbaren Loss-Function Verlauf, so soll es sein. Die Frage ist: Geht es besser?

"Besser" kann jetzt heißen den MSE zu reduzieren, es kann aber auch heißen weniger RAM zu verwenden, schneller den Vorwärtspfad berechnen zu können ([.predict()](https://www.tensorflow.org/api_docs/python/tf/contrib/learn/DNNRegressor#predict) ist ja das, was man in der Realität von so einem Netzwerk dann möchte), schneller trainieren zu können, oder oder oder, sodass sich die Frage stellt, ob es nicht auch mit einem Layer gehen würde?!

#### 1-Layer - 300 Neuronen Netzwerk

Weniger Neuronen und Layer bedeutet auch weniger zu berechnen, d.h. der Trainingsvorgang geht schneller. In unserem Beispiel lächerlich aber für reale Fragestellungen ist es schon relevant, ob das Netzwerk überhaupt in der Lebenszeit des Engineers ein Ergebnis ausspuckt oder während der Mittagspause schon erste Evaluationen bestimmen kann. Schaut man in Tensorboard die Wall-Time an, so sieht man, dass das 1-Layer Netzwerk mit 300 Neuronen im Vergleich rund 25% schneller trainiert war (39min statt 52min).

![Tensorboard-DNNRegressor-WallTimes](https://www.cbcity.de/wp-content/uploads/2018/01/Tensorboard-DNNRegressor-WallTimes.png)

Allerdings kann es auch schlechter die Funktion approximieren. Je nach Anwendungsfall kann dies ausreichend sein, wenn dafür weniger Rechenzeit oder auch Arbeitsspeicher benötigt wird (mobile Anwendungen auf dem Smartphone oder RaspberryPi o.ä.).

![300_D00](https://www.cbcity.de/wp-content/uploads/2018/01/300_D00.gif)

300 neuron shallow DNNRegressor learning to predict a function

Nun kann man argumentieren, dass ein 128x64x32 DNN wesentlich mehr Neuronen und damit Gewichte zum 'lernen' hat (nämlich 1×128 + 128×64 + 64×32 = 128 +  8192 + 2048 = 10368) als nur 300. Wie sieht es also aus mit einem Shallow-Network (also flach statt tief)?

#### 1-Layer - 10368 Neuronen Netzwerk

Das ist sehr flach und gar nicht Deep, hat aber genauso viele Gewichte zum aktivieren wie das soeben besprochene 128x64x32 Deep Neural Network. Wie man an der Tensorboard Abbildung (siehe oben) in grün sieht, ist das Netzwerk nicht aus einem lokalen Minimum heraus gekommen und ist damit konkurrenzlos schlecht (es kann sein, dass es bei nochmaliger Wiederholung anders läuft oder auch zu einer späteren Zeit das lokale Minimum überwindet und dann doch noch besser wird, man weiß es nicht)

### Tipps zum Design und Training eines Neuronalen Netzwerks

Grundsätzlich gibt es nicht **die goldene Regel**, wie es immer am besten funktioniert, aber ein paar Rules of Thumb kann man geben:

- lieber tief statt flach, [siehe Pascaneu et.al.: "On the number of response regions of deep feedforward networks with piecewise linear activations"](https://arxiv.org/pdf/1312.6098.pdf), d.h. mehr Hidden Layer statt vieler Neuronen
- aber nicht zu tief, [siehe The Vanishing Gradient Problem](http://neuralnetworksanddeeplearning.com/chap5.html), d.h. nicht unnütz viele Layer
- so wenig Neuronen wie möglich, so viele wie nötig
- wenn du denkst es hat lang genug gelernt weil nichts mehr passiert, lass es noch mindestens 3x so lange trainieren
- die Loss-Function sollte zu Beginn nicht zu stark fallen, [siehe "Babysitting the training process"](http://cs231n.github.io/neural-networks-3/)
- man hat relativ schnell gute Ergebnisse aber die letzten 10% heraus zu holen dauert lang, sehr lang
- die letzten 1% erreicht das Netzwerk vielleicht nie

Alles Tipps beachtet hier nun der Vergleich der oben Evaluierten drei Netzwerke mit einem 5-Layer Deep Neural Network mit je nur 16 (!) Neuronen:

#### 5-Layer - 16x16x16x16x16 Neuronen Netzwerk

Nach 350.000 Trainingsschritten kann dieses kleine Netzwerk die Funktion schon relativ gut approximieren, für die meisten Anwendungsfälle ist ein Modell gefunden worden, welches die Realität (die Funktion f(x)) hinreichend gut abbildet:

![16](https://www.cbcity.de/wp-content/uploads/2018/01/16_16_16_16_16_D00.png)

5-Layer Deep Neural Network after 350.000 training steps predicting a function

Im Vergleich zu den anderen besprochenen Netzwerken die MSE Evaluation Kurve, bei der deutlich wird, dass "noch etwas länger trainieren lassen" durchaus eine gute Idee ist.

![Tensorboard-DNNRegressor-Loss-Function](https://www.cbcity.de/wp-content/uploads/2018/01/Tensorboard-DNNRegressor-Loss-Function-770x566.png)

Tensorboard Darstellung der MSE Evaluation

Im Code liegt die Wahrheit, hier nun der gesamte Code zum selbst probieren:

## Tensorflow DNNRegressor in Python

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Tensorflow DNNRegressor in Python
# CC-BY-2.0 Paul Balzer
# see: http://www.cbcity.de/deep-learning-tensorflow-dnnregressor-einfach-erklaert
#
TRAINING = True
WITHPLOT = False

# Import Stuff
import tensorflow.contrib.learn as skflow
import tensorflow as tf
tf.logging.set_verbosity(tf.logging.ERROR)

import numpy as np
np.set_printoptions(precision=2)

from sklearn.model_selection import train_test_split

import matplotlib.pyplot as plt

import logging
logging.basicConfig(level=logging.INFO)
logging.info('Tensorflow %s' % tf.__version__) # 1.4.1

# This is the magic function which the Deep Neural Network
# has to 'learn' (see http://neuralnetworksanddeeplearning.com/chap4.html)
f = lambda x: 0.2+0.4*x**2+0.3*x*np.sin(15*x)+0.05*np.cos(50*x)

# Generate the 'features'
X = np.linspace(0, 1, 1000001).reshape((-1, 1))

# Generate the 'labels'
y = f(X)

# Train/Test Dataset for Validation
X_train,X_test,y_train,y_test = train_test_split(X, y,
                        test_size=0.1,
                        random_state=2)

# Defining the Tensorflow input functions
# for training
def training_input_fn(batch_size=1):
    return tf.estimator.inputs.numpy_input_fn(
                    x={'X': X_train.astype(np.float32)},
                    y=y_train.astype(np.float32),
                    batch_size=batch_size,
                    num_epochs=None,
                    shuffle=True)
# for test
def test_input_fn():
    return tf.estimator.inputs.numpy_input_fn(
                      x={'X': X_test.astype(np.float32)},
                      y=y_test.astype(np.float32),
                      num_epochs=1,
                      shuffle=False)

# Network Design
# --------------
feature_columns = [tf.feature_column.numeric_column('X', shape=(1,))]

STEPS_PER_EPOCH = 100
EPOCHS = 1000
BATCH_SIZE = 100

hidden_layers = [16, 16, 16, 16, 16]
dropout = 0.0

MODEL_PATH='./DNNRegressors/'
for hl in hidden_layers:
    MODEL_PATH += '%s_' % hl
MODEL_PATH += 'D0%s' % (int(dropout*10))
logging.info('Saving to %s' % MODEL_PATH)

# Validation and Test Configuration
validation_metrics = {"MSE": tf.contrib.metrics.streaming_mean_squared_error}
test_config = skflow.RunConfig(save_checkpoints_steps=100,
                save_checkpoints_secs=None)

# Building the Network
regressor = skflow.DNNRegressor(feature_columns=feature_columns,
                label_dimension=1,
                hidden_units=hidden_layers,
                model_dir=MODEL_PATH,
                dropout=dropout,
                config=test_config)

# Train it
if TRAINING:
    logging.info('Train the DNN Regressor...\n')
    MSEs = []    # for plotting
    STEPS = []    # for plotting

    for epoch in range(EPOCHS+1):

        # Fit the DNNRegressor (This is where the magic happens!!!)
        regressor.fit(input_fn=training_input_fn(batch_size=BATCH_SIZE),
                steps=STEPS_PER_EPOCH)
        # Thats it -----------------------------
        # Start Tensorboard in Terminal:
        #     tensorboard --logdir='./DNNRegressors/'
        # Now open Browser and visit localhost:6006\

        
        # This is just for fun and educational purpose:
        # Evaluate the DNNRegressor every 10th epoch
        if epoch%10==0:
            eval_dict = regressor.evaluate(input_fn=test_input_fn(),
                            metrics=validation_metrics)
                
            print('Epoch %i: %.5f MSE' % (epoch+1, eval_dict['MSE']))


            if WITHPLOT:
                # Generate a plot for this epoch to see the Network learning
                y_pred = regressor.predict(x={'X': X}, as_iterable=False)

                E = (y.reshape((1,-1))-y_pred)
                MSE = np.mean(E**2.0)
                step = (epoch+1) * STEPS_PER_EPOCH
                title_string = '%s DNNRegressor after %06d steps (MSE=%.5f)' % \
                                (MODEL_PATH.split('/')[-1], step, MSE)
                
                MSEs.append(MSE)
                STEPS.append(step)

                fig = plt.figure(figsize=(9,4))
                ax1 = fig.add_subplot(1, 4, (1, 3))
                ax1.plot(X, y, label='function to predict')
                ax1.plot(X, y_pred, label='DNNRegressor prediction')
                ax1.legend(loc=2)
                ax1.set_title(title_string)
                ax1.set_ylim([0, 1])

                ax2 = fig.add_subplot(1, 4, 4)
                ax2.plot(STEPS, MSEs)
                ax2.set_xlabel('Step')
                ax2.set_xlim([0, EPOCHS*STEPS_PER_EPOCH])
                ax2.set_ylabel('Mean Square Error')
                ax2.set_ylim([0, 0.01])

                plt.tight_layout()
                plt.savefig(MODEL_PATH + '_%05d.png' % (epoch+1), dpi=72)
                logging.info('Saved %s' % MODEL_PATH + '_%05d.png' % (epoch+1))

                plt.close()

    # Now it's trained. We can try to predict some values.
else:
    logging.info('No training today, just prediction')
    try:
        # Prediction
        X_pred = np.linspace(0,1,11)
        y_pred = regressor.predict(x={'X': X_pred}, as_iterable=False)
        print(y_pred)

        # Get trained values out of the Network
        for variable_name in regressor.get_variable_names():
            if str(variable_name).startswith('dnn/hiddenlayer') and \
                (str(variable_name).endswith('weights') or \
                str(variable_name).endswith('biases')):
                print('\n%s:' % variable_name)
                weights = regressor.get_variable_value(variable_name)
                print(weights)
                print('size: %i' % weights.size)

        # Final Plot
        if WITHPLOT:
            plt.plot(X, y, label='function to predict')
            plt.plot(X, regressor.predict(x={'X': X}, as_iterable=False), \
                            label='DNNRegressor prediction')
            plt.legend(loc=2)
            plt.ylim([0, 1])
            plt.title('%s DNNRegressor' % MODEL_PATH.split('/')[-1])
            plt.tight_layout()
            plt.savefig(MODEL_PATH + '.png', dpi=72)
            plt.close()
    except:
        logging.Error('Prediction failed! Maybe first train a model?')

```

> Ach übrigens: Für kommerzielle Anfragen gibt es auch die Möglichkeit mich zum Thema zu konsultieren:   [Hire me!](http://mechlab-engineering.de/kontakt/)

## Was nicht gelernt wurde: Allgemeines Verständnis worum es geht

Wer nun glaubt, dass das Neuronale Netz etwas von Sinus und Cosinus verstanden hat und nebenbei noch die [Fourierreihe](https://de.wikipedia.org/wiki/Fourierreihe) für f(x) mit gefunden, der täuscht sich! Mit einem einfachen Beispiel kann gezeigt werden, dass das Netzwerk nur das kann, was ihm gezeigt wurde und kein Fähigkeiten aufgebaut hat, die gegebene Funktion 'zu verstehen': Erweitert man den Wertebereich für x und lässt das Netzwerk die Funktion f(x) für x={1…1,2} schätzen, so zeigt sich eine riesige Diskrepanz:

![oor](https://www.cbcity.de/wp-content/uploads/2018/01/16_16_16_16_16_D00_out_of_range.png)

Das 5-Layer 16x16x16x16x16 Netzwerk versucht die Funktion außerhalb des gelernten Wertebereichs zu schätzen, grün=tatsächliche f(x), rot=DNNRegressor prediction

Diese Einschränkung von Neuronalen Netzen muss man immer im Hinterkopf behalten. Man sollte sie keine Dinge fragen, welche außerhalb ihres "Horizonts" liegen.

Es gibt Neuronale Netzwerke, welche Menschen in Objekterkennung o.ä. outperformen, d.h. bessere Erkennungsraten haben als Menschen. Man könnte meinen diese Netzwerke sind nun 'besser' als der Mensch. Eine einfaches invertieren der (Eingangsdaten) Bilder (d.h. aus weiß wird schwarz) reicht aus, um diese Netzwerke völlig zu verwirren (siehe "[On the Limitation of Convolutional Neural Networks in Recognizing Negative Images](https://arxiv.org/pdf/1703.06857.pdf)"). Uns als Menschen wäre es egal ob eine weiße 1 auf einem schwarzen oder eine schwarze 1 auf einem weißen Hintergrund zu sehen ist. Einem Neuronalen Netz nicht, es muss beide Varianten 'sehen' während des trainings, um korrekt zu klassifizieren! Unglaublich dumm aber doch so logisch.

Ein allgemeines Verständnis von dem was das Netzwerk während des trainings "lernt" kommt ohnehin nicht auf. Ein Netzwerk kann alle Flugzeuge der Welt korrekt auf einem Bild klassifizieren, was es heißt zu fliegen, davon hat es keine Ahnung. Diese 'General AI' wird es wohl auf absehbare Zeit nicht geben.
